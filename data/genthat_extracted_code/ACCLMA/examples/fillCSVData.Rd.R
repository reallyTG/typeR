library(ACCLMA)


### Name: fillCSVData
### Title: Imports data from a CSV file and sort it by the first column
### Aliases: fillCSVData
### Keywords: ~kwd1 ~kwd2

### ** Examples

#Assuming there is a three column csv in C drive named "data.csv" with no header
#mydata<-fillCSVData("c:/data.csv",FALSE)

## The function is currently defined as
function (str, head) 
{
    mat <- read.table(str, header = head, sep = ",")
    names(mat)[1] = "X"
    names(mat)[2] = "Y"
    if ((is.null(mat[1, 3]) && is.null(mat[2, 3])) || (mat[1, 
        3] == 0 && mat[2, 3] == 0)) 
        mat <- calcWeights(mat)
    names(mat)[3] = "Weights"
    mat <- mat[order(mat[1]), ]
    return(mat)
  }



