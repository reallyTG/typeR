library(MC2toPath)


### Name: SaveRatios
### Title: Normalize an array
### Aliases: SaveRatios
### Keywords: IO file

### ** Examples

## The function is currently defined as
function (rawValues, outFile) 
{
    nRaw = length(rawValues)
    stopifnot(nRaw >= 1)
    meanVal = mean(rawValues, na.rm = TRUE)
    stopifnot(meanVal != 0)
    ratios = rawValues/meanVal
    appendFlag = FALSE
    for (ndx in 1:nRaw) {
        if (is.na(ratios[ndx])) 
            ratios[ndx] = 0
        cat(c(ndx - 1, ", ", ratios[ndx], "\n"), file = outFile, 
            append = appendFlag)
        appendFlag = TRUE
    }
    return(ratios)
  }



