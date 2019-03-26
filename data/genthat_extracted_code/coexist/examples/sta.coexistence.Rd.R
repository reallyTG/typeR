library(coexist)


### Name: sta.coexistence
### Title: posterior coexistence analysis
### Aliases: sta.coexistence

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (outcome, island) 
{
    sta <- matrix(0, ncol = 3 + length(outcome[[1]]$pars), nrow = length(outcome))
    for (i in 1:length(outcome)) {
        s12 = 0
        s1 = 0
        s2 = 0
        for (j in 1:island) {
            if (outcome[[i]]$abund[1, j] != 0 & outcome[[i]]$abund[2, 
                j] != 0) {
                s12 = s12 + 1
            }
            if (outcome[[i]]$abund[1, j] != 0 & outcome[[i]]$abund[2, 
                j] == 0) {
                s1 = s1 + 1
            }
            if (outcome[[i]]$abund[1, j] == 0 & outcome[[i]]$abund[2, 
                j] != 0) {
                s2 = s2 + 1
            }
        }
        sta[i, 1] = s1
        sta[i, 2] = s2
        sta[i, 3] = s12 - 1
        sta[i, 4:dim(sta)[2]] = outcome[[i]]$pars
        colnames(sta) <- c("s1win", "s2win", "coexist", "r1", 
            "r2", "disp", "comp1", "comp2")
    }
    return(sta)
  }



