library(widals)


### Name: fuse.Hst.ls
### Title: Merge Contemporaneous Space-Time Covariates
### Aliases: fuse.Hst.ls
### Keywords: ~kwd1 ~kwd2

### ** Examples


set.seed(9999)

tau <- 5
n <- 7

p1 <- 2
Hst.ls1 <- list()
for(i in 1:tau) { Hst.ls1[[i]] <- matrix(rnorm(n*p1), nrow=n) }

p2 <- 3
Hst.ls2 <- list()
for(i in 1:tau) { Hst.ls2[[i]] <- matrix(rnorm(n*p2), nrow=n) }

fuse.Hst.ls(Hst.ls1, Hst.ls2)


## The function is currently defined as
function (Hst.ls1, Hst.ls2) 
{
    tau <- length(Hst.ls1)
    for (i in 1:tau) {
        Hst.ls1[[i]] <- cbind(Hst.ls1[[i]], Hst.ls2[[i]])
    }
    return(Hst.ls1)
  }



