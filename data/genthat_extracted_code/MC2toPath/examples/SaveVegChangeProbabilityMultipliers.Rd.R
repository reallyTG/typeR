library(MC2toPath)


### Name: SaveVegChangeProbabilityMultipliers
### Title: Saves probability multipliers for Path to read in.
### Aliases: SaveVegChangeProbabilityMultipliers
### Keywords: IO file

### ** Examples

## The function is currently defined as
function (vegChanges, project, climateChangeTransitionTypes) 
{
    srcDataFile = vegChanges[[1]]
    years = vegChanges[[2]]
    VTs = vegChanges[[3]]
    nVT = length(VTs)
    changeFracs = vegChanges[[5]]
    nYrs = dim(changeFracs)[3]
    stopifnot((nYrs + 1) == length(years))
    nTransitionTypes = length(climateChangeTransitionTypes)
    stopifnot(nTransitionTypes >= 1)
    multiplierFile = "vegChangeProbabilityMultipliers.txt"
    pvts <- vegChanges$vt2pvtlut[, 2]
    cat(srcDataFile, file = multiplierFile, append = FALSE)
    cat("\n", file = multiplierFile, append = TRUE)
    for (kSrc in 1:nVT) {
        for (kDest in 1:nVT) if (kSrc != kDest) {
            meanTransitionProbability = mean(changeFracs[kSrc, 
                kDest, ])
            transitionType = paste(c(pvts[VTs[kSrc]], "2", pvts[VTs[kDest]]), 
                collapse = "")
            iType = 0
            found = FALSE
            while (!found && iType < nTransitionTypes) {
                iType = iType + 1
                found = climateChangeTransitionTypes[iType] == 
                  transitionType
            }
            if (!found) 
                next
            cat(c(transitionType, meanTransitionProbability, 
                "\n"))
            for (yr in 1:nYrs) {
                if (meanTransitionProbability > 0) 
                  transitionProbabilityMultiplier = changeFracs[kSrc, 
                    kDest, yr]/meanTransitionProbability
                else transitionProbabilityMultiplier = 0
                cat(yr, file = multiplierFile, append = TRUE)
                cat("\tTemporal\t", file = multiplierFile, append = TRUE)
                cat(transitionType, file = multiplierFile, append = TRUE)
                cat("\t", file = multiplierFile, append = TRUE)
                cat(transitionProbabilityMultiplier, file = multiplierFile, 
                  append = TRUE)
                cat("\n", file = multiplierFile, append = TRUE)
            }
        }
    }
  }



