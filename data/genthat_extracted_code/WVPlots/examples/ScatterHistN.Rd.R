library(WVPlots)


### Name: ScatterHistN
### Title: Plot a height scatter plot with marginals.
### Aliases: ScatterHistN

### ** Examples


set.seed(34903490)
frm = data.frame(x=rnorm(50),y=rnorm(50))
frm$z <- frm$x+frm$y
WVPlots::ScatterHistN(frm, "x", "y", "z", title="Example Joint Distribution")




