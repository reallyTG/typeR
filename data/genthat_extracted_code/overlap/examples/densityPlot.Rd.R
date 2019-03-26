library(overlap)


### Name: densityPlot
### Title: Plot fitted kernel densities
### Aliases: densityPlot

### ** Examples

# Get example data:
data(simulatedData)

# Do basic plot with defaults:
densityPlot(pigObs)
# Prettier plots:
densityPlot(pigObs, extend=NULL, lwd=2)
densityPlot(pigObs, rug=TRUE, main="Simulated data", extend='gold')
densityPlot(tigerObs, add=TRUE, rug=TRUE, col='red')
legend('topleft', c("Tiger", "Pig"), lty=1, col=c('black', 'red'), bg='white')
# Add vertical dotted lines to mark sunrise (say 05:30) and sunset (18:47):
# (times must be in hours if the x-axis is labelled in hours)
abline(v=c(5.5, 18+47/60), lty=3)

# A plot centered on midnight:
densityPlot(pigObs, xcenter = "m")
# Mark sunrise/sunset; values to the left of "00:00" are negative
# so subtract 24:
abline(v=c(5.5, (18+47/60) - 24), lty=3)

# Using object returned:
densityPlot(pigObs, rug=TRUE, lwd=3)
# Don't like the rug with lwd = 3?
pigDens <- densityPlot(pigObs, rug=TRUE)
lines(pigDens, lwd=3)
# What proportion of the density lies between 9:00 and 15:00 hrs?
wanted <- pigDens$x > 9 & pigDens$x < 15
mean(pigDens$y[wanted]) * 6  # probability mass for the 6 hr period. 

# Plotting time in radians:
densityPlot(pigObs, xscale=NA, rug=TRUE)
densityPlot(tigerObs, xscale=NA, add=TRUE, rug=TRUE, col='red')




