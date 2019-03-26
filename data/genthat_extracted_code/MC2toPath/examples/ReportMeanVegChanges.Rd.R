library(MC2toPath)


### Name: ReportMeanVegChanges
### Title: Report Mean Vegetation Changes
### Aliases: ReportMeanVegChanges
### Keywords: print

### ** Examples

## The function is currently defined as
function (baseCalib, VTs, vtFracs, changeFracs, vtXpvt = data.frame(NULL)) 
{
    vtNames = VTnames(baseCalib)
    nVT = length(VTs)
    nYrs = dim(changeFracs)[3]
    for (kSrc in 1:nVT) {
        meanFracOfAllCells = mean(vtFracs[kSrc, ])
        if (meanFracOfAllCells > 0) {
            if (length(vtXpvt) > 0) {
                cat(c("\n", "mean transition probabilities for transitions out of", 
                  levels(vtXpvt$PVT)[vtXpvt$PVT[kSrc]], "...\n"))
                for (kDest in 1:nVT) if (kSrc != kDest) {
                  meanTransitionProbability = mean(changeFracs[kSrc, 
                    kDest, ])
                  if (meanTransitionProbability > 0) {
                    cat(c(levels(vtXpvt$PVT)[vtXpvt$PVT[kSrc]], 
                      "2", levels(vtXpvt$PVT)[vtXpvt$PVT[kDest]], 
                      meanTransitionProbability, "\n"))
                  }
                }
            }
        }
    }
    cat("\n")
    cat(c("Mean values over ", dim(vtFracs)[2], " years:\n"))
    cat("frac of all cells, VTYPE\n")
    for (kSrc in 1:nVT) {
        meanFracOfAllCells = mean(vtFracs[kSrc, ])
        if (meanFracOfAllCells > 0) {
            vtName = vtNames[[VTs[kSrc]]]
            cat(c(meanFracOfAllCells, VTs[kSrc], vtName, "\n"))
        }
    }
  }



