library(LinkedGASP)


### Name: TGASPmetrics
### Title: Performance measurement of a T-GASP
### Aliases: TGASPmetrics
### Keywords: utilities

### ** Examples

## Function f1 is a simulator
f1<-function(x){sin(pi*x)}

## One-dimensional inputs are x1
x1 <- seq(-1,1,.37)

## The following contains the list of data inputs (training) and outputs (fD) together with 
## the assumed fixed smoothness of a computer model output.
data.f1 <- list(training = x1,fD = f1(x1), smooth = 1.99)

## Evaluation of GASP parameters
f1_MLEs = eval_GASP_RFP(data.f1,list(function(x){x^0},function(x){x^1}),1,FALSE)

## Evaluate the emulator
xn = seq(-1,1,.01)
TGASP_f1 <- eval_TGASP(as.matrix(xn),f1_MLEs)

## Plot the emulator
par(mfrow = c(1,1))
par(mar = c(6.1, 6.1, 5.1, 2.1))
ylim = c(-1.5,1.5)
TGASP_plot(TGASP_f1,f1,data.f1,ylim = ylim)

## Measure the performance of the emulator
TGASPmetrics(TGASP_f1,f1(xn),mean(f1(xn)))



