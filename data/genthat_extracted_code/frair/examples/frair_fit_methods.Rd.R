library(frair)


### Name: frair_fit_methods
### Title: frair methods
### Aliases: frair_fit_methods print.frfit plot.frfit lines.frfit

### ** Examples

data(gammarus)
outII <- frair_fit(eaten~density, data=gammarus, response='rogersII', 
        start=list(a = 1.2, h = 0.015), fixed=list(T=40/24))

# Visualise fit
plot(outII, pch=20, col=rgb(0,0,0,0.2), xlim=c(0,30))
lines(outII)



