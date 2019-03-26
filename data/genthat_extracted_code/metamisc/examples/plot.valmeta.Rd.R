library(metamisc)


### Name: plot.valmeta
### Title: Forest Plots
### Aliases: plot.valmeta
### Keywords: calibration discrimination forest meta-analysis

### ** Examples

data(EuroSCORE)
fit <- with(EuroSCORE, valmeta(cstat=c.index, cstat.se=se.c.index, 
            cstat.95CI=cbind(c.index.95CIl,c.index.95CIu), N=n, O=n.events))
plot(fit)

library(ggplot2)
plot(fit, theme=theme_grey())




