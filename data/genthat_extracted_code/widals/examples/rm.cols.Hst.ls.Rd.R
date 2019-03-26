library(widals)


### Name: rm.cols.Hst.ls
### Title: Remove Space-Time Covariates from Model
### Aliases: rm.cols.Hst.ls
### Keywords: ~kwd1 ~kwd2

### ** Examples

	
tau <- 21
n <- 7
	
pst <- 5
Hst.ls <- list()
for(i in 1:tau) { Hst.ls[[i]] <- matrix(1:pst, n, pst, byrow=TRUE) }

rm.cols.Hst.ls(Hst.ls, c(1,3))


## The function is currently defined as
function (Hst.ls, rm.col.ndx) 
{
    tau <- length(Hst.ls)
    for (i in 1:tau) {
        Hst.ls[[i]] <- Hst.ls[[i]][, -rm.col.ndx, drop = FALSE]
    }
    return(Hst.ls)
  }



