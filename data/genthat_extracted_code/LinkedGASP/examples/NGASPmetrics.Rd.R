library(LinkedGASP)


### Name: NGASPmetrics
### Title: GASP performance assessment measures
### Aliases: NGASPmetrics
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
GASP_type2_f1 <- eval_type2_GASP(as.matrix(xn),f1_MLEs)

## Plot the emulator
par(mar = c(6.1, 6.1, 5.1, 2.1))
GASP_plot(GASP_type2_f1,data = data.f1,emul_type = "",ylim = ylim, plot_training = TRUE)

## Measure performance of an emulator
NGASPmetrics(GASP_type2_f1,f1(xn),mean(f1(xn)))



