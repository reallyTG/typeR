library(LinkedGASP)


### Name: eval_type2_GASP
### Title: The second type of an emulator of a computer model
### Aliases: eval_type2_GASP
### Keywords: models

### ** Examples

## Function f2 is a simulator
f2<-function(x){cos(5*x)}

## One-dimensional inputs x2
x2 = seq(-0.95,0.95,length = 6)
data.f2 <- list(training = x2,fD = f2(x2), smooth = 2)

## Evaluation of GASP parameters
f2_MLEs = eval_GASP_RFP(data.f2,list(function(x){x^0},function(x){x^1}),1,FALSE)

## Evaluation of a second type GASP emulator
GASP_type2_f2 <- eval_type2_GASP(as.matrix(seq(-1,1,.01)),f2_MLEs)




