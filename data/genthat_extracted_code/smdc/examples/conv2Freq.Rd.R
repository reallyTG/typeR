library(smdc)


### Name: conv2Freq
### Title: Conversion from Matrix to Frequency Distribution
### Aliases: conv2Freq
### Keywords: ~kwd1 ~kwd2

### ** Examples


## The function is currently defined as
function (tmpMatrix, wordClass, breaks) 
{
    freqDist <- matrix(0, nrow = length(breaks) - 1, ncol = ncol(tmpMatrix))
    for (tmp in rownames(tmpMatrix)) {
        cat <- wordClass[tmp]
        if (!is.na(cat)) {
            freqDist[cat, ] <- freqDist[cat, ] + tmpMatrix[tmp, 
                ]
        }
    }
    colnames(freqDist) <- colnames(tmpMatrix)
    if (!is.null(names(breaks))) {
        rownames(freqDist) <- names(breaks)[2:length(breaks)]
    }
    return(freqDist)
  }



