library(WVPlots)


### Name: ScatterHist
### Title: Plot a scatter plot with marginals.
### Aliases: ScatterHist

### ** Examples


set.seed(34903490)
x = rnorm(50)
y = 0.5*x^2 + 2*x + rnorm(length(x))
frm = data.frame(x=x,y=y)
WVPlots::ScatterHist(frm, "x", "y",
  title= "Example Fit",
  smoothmethod = "gam",
  contour = TRUE)




