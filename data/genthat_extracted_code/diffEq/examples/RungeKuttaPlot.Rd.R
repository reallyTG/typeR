library(diffEq)


### Name: rkMethodPlot
### Title: Plots the steps in runge-kutta methods
### Aliases: rkMethodPlot
### Keywords: plot

### ** Examples

# This to plot all runge kutta methods
#RKS <- rkMethod()
#for (i in 4:21)   rkMethodPlot( rkMethod(RKS[i]))

## -----------------------------------------------------------------------------
## Figures A and B: Cash-Karp and Radau 5 steps
## -----------------------------------------------------------------------------

par(mfrow=c(2,2))

rkMethodPlot( rkMethod("rk45ck"), main="Cash-Karp")
writelabel("A")

rkMethodPlot( rkMethod("irk5"), main="Radau5")
writelabel("B")

rkMethodPlot( rkMethod("rk45dp6"), main="Dopri")
writelabel("C")
                                                                                   
rkMethodPlot( rkMethod("irk6l"), main="Lobatto")
writelabel("D")

legend("bottomright", pch = c(16, 16, 1, NA), pt.cex = c(1.5, 1.5, 1), 
       legend = c(expression(y[0]), expression(y[1]), "intermediary", "k"),
       col = c("grey", "black", "black", "black"), lty = c(NA, NA, NA, 1), 
       lwd = c(1, 1, 1, 2))




