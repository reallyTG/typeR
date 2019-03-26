library(widals)


### Name: create.rm.ndx.ls
### Title: Cross-Validation Indices
### Aliases: create.rm.ndx.ls
### Keywords: ~kwd1 ~kwd2

### ** Examples

n <- 100
xincmnt <- 7
rm.ndx <- create.rm.ndx.ls(n=n, xincmnt=xincmnt)
rm.ndx

######## if we want randomization of indices:
n <- 100
xincmnt <- 7
rm.ndx <- create.rm.ndx.ls(n=n, xincmnt=xincmnt)

rnd.ndx <- sample(I(1:n))
for(i in 1:length(rm.ndx)) { rm.ndx[[i]] <- rnd.ndx[rm.ndx[[i]]] }
rm.ndx

## The function is currently defined as
function (n, xincmnt = 10) 
{
    rm.ndx.ls <- list()
    for (i in 1:xincmnt) {
        xrm.ndxs <- seq(i, n + xincmnt, by = xincmnt)
        xrm.ndxs <- xrm.ndxs[xrm.ndxs <= n]
        rm.ndx.ls[[i]] <- xrm.ndxs
    }
    return(rm.ndx.ls)
}



