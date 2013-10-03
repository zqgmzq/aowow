{strip}
    new Listview({ldelim}
        template:'spell',
        {if !isset($params.id)}id:'spells',{/if}
        {if !isset($params.name)}name:LANG.tab_spells,{/if}
        {if !isset($params.parent)}parent:'lv-generic',{/if}
        {foreach from=$params key=k item=v}
            {if $v[0] == '$'}
                {$k}:{$v|substr:1},
            {else if $v}
                {$k}:'{$v}',
            {/if}
        {/foreach}
        data:[
            {foreach name=i from=$data item=curr}
                {ldelim}
                    name:'{$curr.quality}{$curr.name|escape:"javascript"}',
                    {if isset($curr.level)}level:{$curr.level},{/if}
                    school:{$curr.school},
                    cat:{$curr.cat},
                    {if isset($curr.rank)}
                        rank:'{$curr.rank|escape:"javascript"}',
                    {/if}
                    {if isset($curr.type)}
                        type:'{$curr.type}',
                    {/if}
                    {if isset($curr.skill)}
                        skill:[
                            {section name=j loop=$curr.skill}
                                {$curr.skill[j]}
                                {if $smarty.section.j.last}{else},{/if}
                            {/section}
                        ],
                    {/if}
                    {if isset($curr.reqclass)}
                        reqclass:{$curr.reqclass},
                    {/if}
                    {if isset($curr.reqrace)}
                        reqrace:{$curr.reqrace},
                    {/if}
                    {if isset($curr.glyphtype)}
                        glyphtype:{$curr.glyphtype},
                    {/if}
                    {if !empty($curr.source)}
                        source:{$curr.source},
                    {/if}
                    {if isset($curr.trainingcost)}
                        trainingcost:{$curr.trainingcost},
                    {/if}
                    {if !empty($curr.reagents)}
                        reagents:[
                            {foreach name=j from=$curr.reagents item=r}
                                [{$r[0]},{$r[1]}]
                                {if $smarty.foreach.j.last}{else},{/if}
                            {/foreach}
                        ],
                    {/if}
                    {if isset($curr.creates)}
                        creates:[
                            {section name=j loop=$curr.creates}
                                {$curr.creates[j]}
                                {if $smarty.section.j.last}{else},{/if}
                            {/section}
                        ],
                    {/if}
                    {if isset($curr.learnedat)}
                        learnedat:{$curr.learnedat},
                    {/if}
                    {if isset($curr.colors)}
                        colors:[
                            {section name=j loop=$curr.colors}
                                {$curr.colors[j]}
                                {if $smarty.section.j.last}{else},{/if}
                            {/section}
                        ],
                    {/if}
                    {if isset($curr.percent)}
                        percent:{$curr.percent},
                    {/if}
                    {if isset($curr.stackRule)}
                        stackRule:{$curr.stackRule},
                    {/if}
                    {if isset($curr.linked)}
                        linked:{$curr.linked},
                    {/if}
                    id:{$curr.id}
                {rdelim}
                {if $smarty.foreach.i.last}{else},{/if}
            {/foreach}
        ]
    {rdelim});
{/strip}
