library(MC2toPath)


### Name: SaveMatrix
### Title: Save a matrix to a text file
### Aliases: SaveMatrix
### Keywords: IO file

### ** Examples

## The function is currently defined as
function (startYear, localMatrix, outFile) 
{
    nSeq = dim(localMatrix)[2]
    stopifnot(nSeq >= 1)
    matrixRows = dim(localMatrix)[1]
    stopifnot(matrixRows > 1)
    indexedSeq = matrix(0, nrow = nSeq, ncol = matrixRows + 1)
    appendFlag = FALSE
    for (ndx in 1:nSeq) {
        cat(c(startYear + ndx - 1), file = outFile, append = appendFlag)
        appendFlag = TRUE
        indexedSeq[ndx, 1] = startYear + ndx - 1
        for (row in 1:matrixRows) {
            if (is.na(localMatrix[row, ndx])) 
                localMatrix[row, ndx] = 0
            cat(c(", ", localMatrix[row, ndx]), file = outFile, 
                append = appendFlag)
            indexedSeq[ndx, row + 1] = localMatrix[row, ndx]
        }
        cat(c("\n"), file = outFile, append = appendFlag)
    }
    return(indexedSeq)
  }



