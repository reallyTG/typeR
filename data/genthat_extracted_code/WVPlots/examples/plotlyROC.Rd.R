library(WVPlots)


### Name: plotlyROC
### Title: Use 'plotly' to produce a ROC plot.
### Aliases: plotlyROC

### ** Examples


if(requireNamespace("plotly", quietly = TRUE)) {
   set.seed(34903490)
   x = rnorm(50)
   y = 0.5*x^2 + 2*x + rnorm(length(x))
   frm = data.frame(x=x,yC=y>=as.numeric(quantile(y,probs=0.8)))
   plotlyROC(frm, 'x', 'yC', TRUE, 'example plot', estimate_sig = TRUE)
}





