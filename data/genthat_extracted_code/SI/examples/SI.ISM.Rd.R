library(SI)


### Name: SI.ISM
### Title: Important Sampling Method
### Aliases: SI.ISM
### Keywords: ISM

### ** Examples

## To integrate exp(x) from -1 to 1
## Use the sampling density (3/2+x)/3
set.seed(0)
h <- function(x){
    exp(x)
}
N <- 100000
g <- function(x){return((3/2+x)/3)}
G_inv <- function(y){return(sqrt(6*y+1/4)-3/2)}
ISMresult <- SI.ISM(h,g,G_inv,N)
I3 <- ISMresult[[1]]
VarI3 <- ISMresult[[2]]



