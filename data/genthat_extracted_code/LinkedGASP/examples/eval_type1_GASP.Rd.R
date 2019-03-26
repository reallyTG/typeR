library(LinkedGASP)


### Name: eval_type1_GASP
### Title: The first type of an emulator of a computer model
### Aliases: eval_type1_GASP
### Keywords: models

### ** Examples

## Function f1 is a simulator
f1<-function(x){sin(pi*x)}

## One-dimensional inputs are x1
x1 <- seq(-1,1,.37)

## The following contains the list of data inputs (training) and outputs (fD) together with the 
## assumed fixed smoothness of a computer model output.
data.f1 <- list(training = x1,fD = f1(x1), smooth = 1.99)

## Evaluation of GASP parameters
f1_MLEs = eval_GASP_RFP(data.f1,list(function(x){x^0},function(x){x^1}),1,FALSE)

## Evaluate the emulator
xn = seq(-1,1,.01)
GASP_type1_f1 <- eval_type1_GASP(as.matrix(xn),f1_MLEs)



