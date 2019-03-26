library(POT)


### Name: plot.bvpot
### Title: Graphical Diagnostics: the Bivariate Extreme Value Distribution
###   Model.
### Aliases: plot.bvpot
### Keywords: hplot

### ** Examples

x <- rbvgpd(1000, alpha = 0.55, mar1 = c(0,1,0.25), mar2 = c(2,0.5,0.1))
Mlog <- fitbvgpd(x, c(0, 2), "log")
layout(matrix(c(1,1,2,2,0,3,3,0), 2, byrow = TRUE))
plot(Mlog)



