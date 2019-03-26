library(dCovTS)


### Name: ADCFplot
### Title: Auto-distance correlation plot
### Aliases: ADCFplot
### Keywords: plot

### ** Examples

## Not run: ADCFplot(rnorm(100),ylim=c(0,0.4),bootMethod="Subs")

ADCFplot(mdeaths,bootMethod="Wild",b=100)

ADCFplot(mdeaths,bootMethod="Indep",b=100)



