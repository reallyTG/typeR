library(knnGarden)


### Name: dataFiller
### Title: Missing Observations Filling Function
### Aliases: dataFiller
### Keywords: missing fill

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## Define Data 
library(knnGarden)
data(iris)
v1=c(iris[1:4,3],NA,iris[6:10,3])
v2=iris[101:110,4]
v3=iris[101:110,1]
v4=c(iris[11:18,3],NA,iris[20,3])
data1=data.frame(v1,v2,v3,v4)

## Call Function
data2=dataFiller(data1)

## The function is currently defined as
function (data, NAstring = NA) 
{
    central.value <- function(x) {
        if (is.numeric(x)) 
            median(x, na.rm = T)
        else if (is.factor(x)) 
            levels(x)[which.max(table(x))]
        else {
            f <- as.factor(x)
            levels(f)[which.max(table(f))]
        }
    }
    dist.mtx <- as.matrix(daisy(data, stand = T))
    ShowMissing = NULL
    ShowMissing = data[which(!complete.cases(data)), ]
    for (r in which(!complete.cases(data))) data[r, which(is.na(data[r, 
        ]))] <- apply(data.frame(data[c(as.integer(names(sort(dist.mtx[r, 
        ])[2:11]))), which(is.na(data[r, ]))]), 2, central.value)
    cat("the missing case(s) in the orignal dataset ", "\n\n")
    print(ShowMissing)
    cat("\n\n")
    return(data)
  }



