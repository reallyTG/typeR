library(dafs)


### Name: plotRegDiagPlots
### Title: Plot some standard regression diagnostic plots
### Aliases: plotRegDiagPlots
### Keywords: Book

### ** Examples

x = runif(100)
y = 3*x+2+dnorm(100)
fit = lm(y~x)
plotRegDiagPlots(fit)



