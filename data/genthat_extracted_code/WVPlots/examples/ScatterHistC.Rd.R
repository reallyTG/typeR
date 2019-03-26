library(WVPlots)


### Name: ScatterHistC
### Title: Plot a conditional scatter plot with marginals.
### Aliases: ScatterHistC

### ** Examples


set.seed(34903490)
frm = data.frame(x=rnorm(50),y=rnorm(50))
frm$cat <- frm$x+frm$y>0
WVPlots::ScatterHistC(frm, "x", "y", "cat",
                      title="Example Conditional Distribution")




