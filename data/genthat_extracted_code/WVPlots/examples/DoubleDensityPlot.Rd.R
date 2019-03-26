library(WVPlots)


### Name: DoubleDensityPlot
### Title: Plot two density plots conditioned on an outcome variable.
### Aliases: DoubleDensityPlot

### ** Examples


mpg = ggplot2::mpg
mpg$trans = gsub("\\(.*$", '', mpg$trans)
WVPlots::DoubleDensityPlot(mpg, "cty", "trans", "City driving mpg by transmission type")

set.seed(34903490)
x = rnorm(50)
y = 0.5*x^2 + 2*x + rnorm(length(x))
frm = data.frame(score=x,
   truth=(y>=as.numeric(quantile(y,probs=0.8))),
   stuck=TRUE,
   rare=FALSE)
frm[1,'rare'] = TRUE
WVPlots::DoubleDensityPlot(frm, "score", "truth", title="Example double density plot")
WVPlots::DoubleDensityPlot(frm, "score", "stuck", title="Example double density plot")
WVPlots::DoubleDensityPlot(frm, "score", "rare", title="Example double density plot")




