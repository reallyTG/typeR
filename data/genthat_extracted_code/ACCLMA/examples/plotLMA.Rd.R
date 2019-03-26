library(ACCLMA)


### Name: plotLMA
### Title: Plots the ACC vs LOI and LMA graphs of an imported or manually
###   entered data set
### Aliases: plotLMA
### Keywords: ~kwd1 ~kwd2

### ** Examples

#plotLMA()

## The function is currently defined as
function (str = NULL, header = FALSE) 
{
    if (is.null(str)) {
        mat <- fillData()
    }
    else {
        mat <- fillCSVData(str, header)
    }
    mat <- calcWeights(mat)
    mat <- averageSameXs(mat)
    mat <- calcFX(mat)
    mat <- calcFY(mat)
    mat <- calcLOI(mat)
    mat <- calcLMA(mat)
    plotGraphs(mat)
    return(mat)
  }



