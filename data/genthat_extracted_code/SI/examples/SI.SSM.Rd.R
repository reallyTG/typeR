library(SI)


### Name: SI.SSM
### Title: Stratified Sampling Method
### Aliases: SI.SSM
### Keywords: ~kwd1 ~kwd2

### ** Examples

## To integrate exp(x) from -1 to 1
set.seed(0)
h <- function(x){
    exp(x)
}
N <- 100000
SSMresult <- SI.SSM(h,-1,1,10,N)
I4 <- SSMresult[[1]]
VarI4 <- SSMresult[[2]]



