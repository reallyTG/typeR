library(coexist)


### Name: flexsim
### Title: species coexistence simulation for multiple-species modeling
###   (>=2)
### Aliases: flexsim

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (scale = 2, dispersalscale = 51, allee = 1, T = 1000, 
    prange, initp,spnum = 2, island=10,sourcetype = "constant", type, 
    path = NULL) 
{
    parnum = spnum * 3
    outcome <- list()
    if (!is.list(prange)) {
        length(outcome) <- length(prange)^parnum
    }
    else {
        parlen <- vector()
        length(parlen) <- length(prange)
        for (i in 1:length(prange)) {
            parlen[i] <- length(prange[[i]])
        }
        length(outcome) <- prod(parlen)
    }
    resource <- matrix(0, ncol = island, nrow = spnum)
    grow <- resource
    comp <- resource
    for (i in 1:spnum) {
        resource[i, ] <- parsetting(island, initp, scale, type[i])
    }
    outcomefile = filename.check(path)
    if (!is.list(prange)) {
        parcomb <- comblist(prange, parnum)
    }
    if (is.list(prange)) {
        parcomb <- comblist2(prange)
    }
    comnum <- dim(parcomb)[1]
    colnames(parcomb) <- c(paste("r", c(1:spnum), sep = ""), 
        paste("dis", c(1:spnum), sep = ""), paste("com", c(1:spnum), 
            sep = ""))
    dismat <- list()
    length(dismat) <- spnum
    for (each in 1:comnum) {
        typenum <- spnum
        for (i in 1:spnum) {
            grow[i, ] <- parsetting(island, rate = parcomb[each, 
                i], scale, type[typenum + i])
        }
        typenum <- spnum + typenum
        for (i in 1:spnum) {
            dismat[[i]] <- dispvar(island, rate = parcomb[each, 
                i + spnum]/dispersalscale, scale, type[typenum + 
                i])
        }
        typenum <- spnum + typenum
        for (i in 1:spnum) {
            comp[i, ] <- parsetting(island, rate = parcomb[each, 
                i + spnum * 2], scale, type[typenum + i])
        }
        spvector <- rbind(spabundance(island, 1000), spabundance(island, 
            1000))
        for (j in 1:T) {
            spvector <- flex.competition(spvector, resource, 
                grow, comp, allee)
            spvector <- flex.dispersal(spvector, dismat, allee, 
                type = sourcetype)
        }
        outcome[[each]] <- spvector
        write.table(outcome[[each]], file = outcomefile, sep = "\t", 
            append = TRUE)
        outcome[[each]] <- list(abund = outcome[[each]], pars = parcomb[each, 
            ])
    }
    return(outcome)
  }



