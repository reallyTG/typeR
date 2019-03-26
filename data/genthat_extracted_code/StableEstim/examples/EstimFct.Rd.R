library(StableEstim)


### Name: Estim
### Title: Main estimation function
### Aliases: Estim
### Keywords: Estim-functions

### ** Examples

## general inputs
theta <- c(1.45,0.55,1,0)
pm <- 0
set.seed(2345)
x <- rstable(200,theta[1],theta[2],theta[3],theta[4],pm)

objKout <- Estim(EstimMethod="Kout",data=x,pm=pm,
                     ComputeCov=FALSE,HandleError=FALSE,
                     spacing="Kout")




