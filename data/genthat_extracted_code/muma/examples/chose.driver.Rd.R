library(muma)


### Name: chose.driver
### Title: List variables in the dataset
### Aliases: chose.driver
### Keywords: ~kwd1 ~kwd2

### ** Examples


## The function is currently defined as
function (scaling) 
{
    pwd.n = paste(getwd(), "/Preprocessing_Data_", scaling, "/ProcessedTable.csv", 
        sep = "")
    x <- read.csv(pwd.n, sep = ",", header = TRUE)
    x.x <- x[, 2:ncol(x)]
    rownames(x.x) <- x[, 1]
    print(colnames(x.x))
  }



