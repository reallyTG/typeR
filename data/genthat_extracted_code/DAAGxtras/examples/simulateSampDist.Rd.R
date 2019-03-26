library(DAAGxtras)


### Name: simulateSampDist
### Title: Simulated sampling distribution of mean or other statistic
### Aliases: simulateSampDist
### Keywords: datagen distribution

### ** Examples

## By default, sample from normal population
simAvs <- simulateSampDist()
par(pty="s")
plotSampDist(simAvs)
## Sample from empirical distribution
simAvs <- simulateSampDist(rpop=rivers)
plotSampDist(simAvs)


## The function is currently defined as
function(rpop=rnorm, numsamp=100, numINsamp=c(4,16), FUN=mean,
seed=NULL){
    if(!is.null(seed))set.seed(seed)
    funtxt <- deparse(substitute(FUN))
    nDists <- length(numINsamp)+1
    values <- matrix(0, nrow=numsamp, ncol=nDists)
    if(!is.function(rpop)) {
      x <- rpop
      rpop <- function(n)sample(x, n, replace=TRUE)
    }
    values[,1] <- rpop(numsamp)
    for(j in 2:nDists){
      n <- numINsamp[j-1]
      for(i in 1:numsamp)values[i, j] <- FUN(rpop(n))
    }
    colnames(values) <- paste("Size", c(1, numINsamp))
    invisible(list(values=values, numINsamp=numINsamp, FUN=funtxt))
  }



