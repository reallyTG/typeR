library(LinkedGASP)


### Name: eval_GASP_RFP
### Title: Evaluation of parameters of a Gaussian stochastic process
###   emulator of a computer model.
### Aliases: eval_GASP_RFP
### Keywords: models

### ** Examples

## Function f1 is a simulator
f1<-function(x){sin(pi*x)}

## One-dimensional inputs are x1
x1 <- seq(-1,1,.37)

## data.f1 contains the list of data inputs (training) and outputs (fD) together with the assumed
## fixed smoothness of a computer model output. This corresponds to the smoothness in a product 
## power exponential correlation function used for construction of the emulator.
data.f1 <- list(training = x1,fD = f1(x1), smooth = 1.99)

## Evaluation of GASP parameters
f1_MLEs = eval_GASP_RFP(data.f1,list(function(x){x^0},function(x){x^1}),1,FALSE)



