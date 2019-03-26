library(coexist)


### Name: sim.coarse
### Title: 2-species coexistence modeling based on the matrix listing out
###   all combinations of parameter setting
### Aliases: sim.coarse

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (scale = 2, dispersalscale = 51, allee = 1, T = 1000, 
    prange = parspace, type = typevector, path = NULL) 
{
    parnum = 5
    parlen <- length(prange)
    outcome <- list()
    length(outcome) <- parlen^parnum
    outindex <- matrix(0, nrow = parlen^parnum, ncol = parnum)
    colnames(outindex) <- c("r1", "r2", "dis", "c11", "c22")
    habitat1 <- parsetting(island, good, scale, type[1])
    habitat2 <- parsetting(island, good, scale, type[2])
    resource <- rbind(habitat1, habitat2)
    count = 0
    outcomefile = filename.check(path)
    for (i1 in 1:parlen) {
        for (i2 in 1:parlen) {
            for (i3 in 1:parlen) {
                for (i4 in 1:parlen) {
                  for (i5 in 1:parlen) {
                    grow1 <- parsetting(island, rate = prange[i1], 
                      scale, type[3])
                    grow2 <- parsetting(island, rate = prange[i2], 
                      scale, type[4])
                    grow <- rbind(grow1, grow2)
                    dismat <- dispvar(island, rate = prange[i3]/dispersalscale, 
                      scale, type[5])
                    comp1 <- compvar(island, rate = prange[i4], 
                      scale, type[6])
                    comp2 <- compvar(island, rate = prange[i5], 
                      scale, type[7])
                    spvector <- rbind(spabundance(island, 1000), 
                      spabundance(island, 1000))
                    count = count + 1
                    outindex[count, ] <- c(prange[i1], prange[i2], 
                      prange[i3], prange[i4], prange[i5])
                    for (j in 1:T) {
                      spvector <- competition(spvector, resource, 
                        comp1, comp2, grow, allee)
                      spvector <- dispersal(spvector, dismat, 
                        allee)
                    }
                    outcome[[count]] <- spvector
                    write.table(outcome[[count]], file = outcomefile, 
                      sep = "\t", append = TRUE)
                    outcome[[count]] <- list(abund = outcome[[count]], 
                      pars = outindex[count, ])
                  }
                }
            }
        }
    }
    return(outcome)
  }



