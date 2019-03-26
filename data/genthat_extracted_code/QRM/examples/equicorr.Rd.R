library(QRM)


### Name: equicorr
### Title: Equal Correlation Matrix
### Aliases: equicorr
### Keywords: array

### ** Examples

equicorr(7, 0.5)
ll <- c(0.01, 0.99)
BiDensPlot(func = dcopula.gauss, xpts = ll, ypts = ll,
           Sigma = equicorr(2,0.5))
BiDensPlot(func = dcopula.t, xpts = ll, ypts = ll , df = 4,
           Sigma = equicorr(2, 0.5)) 



