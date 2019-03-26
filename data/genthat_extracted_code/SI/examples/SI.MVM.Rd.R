library(SI)


### Name: SI.MVM
### Title: Mean Value Method
### Aliases: SI.MVM
### Keywords: MVM

### ** Examples

## To integrate exp(x) from -1 to 1
set.seed(0)
h <- function(x){
    exp(x)
}
N <- 100000
MVMresult <- SI.MVM(h,-1,1,N)
I2 <- MVMresult[[1]]
VarI2 <- MVMresult[[2]]



