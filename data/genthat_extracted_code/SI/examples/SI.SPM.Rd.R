library(SI)


### Name: SI.SPM
### Title: Stochastic Point Method
### Aliases: SI.SPM
### Keywords: SPM

### ** Examples

## To integrate exp(x) from -1 to 1
set.seed(0)
h <- function(x){
    exp(x)
}
N <- 100000
SPMresult <- SI.SPM(h,-1,1,exp(1),N)
I1 <- SPMresult[[1]]
VarI1 <- SPMresult[[2]]



