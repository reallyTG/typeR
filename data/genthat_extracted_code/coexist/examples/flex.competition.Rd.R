library(coexist)


### Name: flex.competition
### Title: perform flexible competition analysis allowing multiple species
### Aliases: flex.competition

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (spvector, resource, grow, comp, allee = 1) 
{
    spnum <- dim(spvector)[1]
    islandnum <- dim(spvector)[2]
    for (i in 1:islandnum) {
        s <- spvector[, i]
        for (sp in 1:spnum) {
            spvector[sp, i] = s[sp] + (1 - comp[sp, i] * s[sp]/resource[sp, 
                i] - (1 - comp[sp, i]) * sum(s[-sp])/resource[sp, 
                i]) * s[sp] * grow[sp, i]
            if (spvector[sp, i] < allee) {
                spvector[sp, i] = 0
            }
        }
    }
    return(spvector)
  }



