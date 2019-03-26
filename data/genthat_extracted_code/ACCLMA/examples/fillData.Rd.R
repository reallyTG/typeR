library(ACCLMA)


### Name: fillData
### Title: Opens a window for manual entry of X,Y,weight data set
### Aliases: fillData
### Keywords: ~kwd1 ~kwd2

### ** Examples

#mydata<-fillData()

## The function is currently defined as
function () 
{
    mydata <- data.frame(X = numeric(0), Y = numeric(0), Weight = numeric(0))
    mydata <- edit(mydata)
    mydata <- mydata[order(mydata[1]), ]
    return(mydata)
  }



