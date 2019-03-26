library(fitdistrplus)


### Name: plotdistcens
### Title: Plot of empirical and theoretical distributions for censored
###   data
### Aliases: plotdistcens
### Keywords: distribution

### ** Examples

# (1) Plot of an empirical censored distribution (censored data) as a CDF
# using the default Turnbull method
#
data(smokedfish)
d1 <- as.data.frame(log10(smokedfish))
plotdistcens(d1)

# (2) Add the CDF of a normal distribution 
#
plotdistcens(d1,"norm",para=list(mean=-1.6,sd=1.5))

# (3) Various plots of the same empirical distribution 
#
# default Wang plot
plotdistcens(d1, NPMLE = TRUE, NPMLE.method = "Wang")
# Turnbull plot
plotdistcens(d1, NPMLE = TRUE, NPMLE.method = "Turnbull")
# Turnbull plot with confidence intervals
plotdistcens(d1, NPMLE = TRUE, NPMLE.method = "Turnbull", Turnbull.confint = TRUE)
# with intervals and points
plotdistcens(d1,rightNA=3, NPMLE = FALSE)
# with intervals and points
# defining a minimum value for left censored values
plotdistcens(d1,leftNA=-3, NPMLE = FALSE)




