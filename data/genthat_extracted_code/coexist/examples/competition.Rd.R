library(coexist)


### Name: competition
### Title: perform competition analysis in the 2-species modeling
### Aliases: competition

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (spvector, resource, comp1, comp2, grow, allee = 1) 
{
    islandnum <- dim(spvector)[2]
    for (i in 1:islandnum) {
        if (spvector[1, i] != 0 & spvector[2, i] != 0) {
            s1 <- spvector[1, i]
            s2 <- spvector[2, i]
            spvector[1, i] = s1 + (1 - comp1[1, i] * s1/resource[1, 
                i] - comp1[2, i] * s2/resource[1, i]) * s1 * 
                grow[1, i]
            spvector[2, i] = s2 + (1 - comp2[1, i] * s2/resource[2, 
                i] - comp2[2, i] * s1/resource[2, i]) * s2 * 
                grow[2, i]
        }
        if (spvector[1, i] != 0 & spvector[2, i] == 0) {
            s1 <- spvector[1, i]
            spvector[1, i] = s1 + (1 - comp1[1, i] * s1/resource[1, 
                i]) * s1 * grow[1, i]
        }
        if (spvector[2, i] != 0 & spvector[1, i] == 0) {
            s2 <- spvector[2, i]
            spvector[2, i] = s2 + (1 - comp2[1, i] * s2/resource[2, 
                i]) * s2 * grow[2, i]
        }
        if (spvector[1, i] < allee) {
            spvector[1, i] = 0
        }
        if (spvector[2, i] < allee) {
            spvector[2, i] = 0
        }
    }
    return(spvector)
  }



