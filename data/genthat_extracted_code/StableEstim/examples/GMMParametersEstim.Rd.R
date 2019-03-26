library(StableEstim)


### Name: GMMParametersEstim
### Title: generalised method of moment with finite number of moment
###   conditions
### Aliases: GMMParametersEstim
### Keywords: Estim-functions

### ** Examples

## General data
theta <- c(1.5,0.5,1,0)
pm <- 0
set.seed(345);
x <- rstable(100,theta[1],theta[2],theta[3],theta[4],pm)
##---------------- 2S free ----------------
## method specific arguments
regularization="cut-off"
WeightingMatrix="OptAsym"
alphaReg=0.005
t_seq=seq(0.1,2,length.out=12)

## If you are just interested by the value
## of the 4 estimated parameters
t_scheme="free"
algo = "2SGMM"
     
suppressWarnings(GMMParametersEstim(x=x,
                                    algo=algo,alphaReg=alphaReg,
                                    regularization=regularization,
                                    WeightingMatrix=WeightingMatrix,
                                    t_scheme=t_scheme,
                                    pm=pm,PrintTime=TRUE,t_free=t_seq))



