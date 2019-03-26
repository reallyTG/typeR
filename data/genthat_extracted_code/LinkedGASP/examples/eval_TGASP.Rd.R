library(LinkedGASP)


### Name: eval_TGASP
### Title: T-GASP emulator
### Aliases: eval_TGASP
### Keywords: models

### ** Examples

## Function f2 is a simulator
f2<-function(x){cos(5*x)}

## One-dimensional inputs x2
x2 = seq(-0.95,0.95,length = 6)
data.f2 <- list(training = x2,fD = f2(x2), smooth = 2)

## Evaluation of GASP parameters
f2_MLEs = eval_GASP_RFP(data.f2,list(function(x){x^0},function(x){x^1}),1,FALSE)

## Evaluation of a T-GASP emulator
TGASP_f2 <- eval_TGASP(as.matrix(seq(-1,1,.01)),f2_MLEs)



