library(WVPlots)


### Name: ROCPlot
### Title: Plot receiver operating characteristic plot.
### Aliases: ROCPlot

### ** Examples


set.seed(34903490)
x = rnorm(50)
y = 0.5*x^2 + 2*x + rnorm(length(x))
frm = data.frame(x=x,yC=y>=as.numeric(quantile(y,probs=0.8)))
WVPlots::ROCPlot(frm, "x", "yC", TRUE, title="Example ROC plot", estimate_sig = TRUE)




