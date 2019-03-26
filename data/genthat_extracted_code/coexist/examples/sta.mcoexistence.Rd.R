library(coexist)


### Name: sta.mcoexistence
### Title: basic posterior coexistence analysis for a single scenario of
###   the multiple-species simulation
### Aliases: sta.mcoexistence

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (outcome, island, spnum) 
{
    conum <- spnum * 2
    sta <- matrix(0, ncol = conum + length(outcome[[1]]$pars), 
        nrow = length(outcome))
    for (i in 1:length(outcome)) {
        for (j in 2:island) {
            num <- length(which(outcome[[i]]$abund[, j] != 0))
            if (num == 0) {
                sta[i, 1] = sta[i, 1] + 1
            }
            if (num == 1) {
                spindex <- which(outcome[[i]]$abund[, j] != 0)
                sta[i, spindex + 1] = sta[i, spindex + 1] + 1
            }
            if (num > 1) {
                sta[i, spnum + num] = sta[i, spnum + num] + 1
            }
        }
        sta[i, (conum + 1):dim(sta)[2]] = as.numeric(outcome[[i]]$pars)
    }
    colnames(sta) <- c(paste("s", c(0:spnum), sep = ""), paste("co", 
        c(2:spnum), sep = ""), names(outcome[[i]]$pars))
    return(sta)
  }



