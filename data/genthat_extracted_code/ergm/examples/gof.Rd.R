library(ergm)


### Name: gof
### Title: Conduct Goodness-of-Fit Diagnostics on a Exponential Family
###   Random Graph Model
### Aliases: gof gof.default gof.ergm gof.formula print.gof plot.gof
### Keywords: graphs models

### ** Examples


## No test: 
data(florentine)
gest <- ergm(flomarriage ~ edges + kstar(2))
gest
summary(gest)

# test the gof.ergm function
gofflo <- gof(gest)
gofflo

# Plot all three on the same page
# with nice margins
par(mfrow=c(1,3))
par(oma=c(0.5,2,1,0.5))
plot(gofflo)

# And now the log-odds
plot(gofflo, plotlogodds=TRUE)

# Use the formula version of gof
gofflo2 <-gof(flomarriage ~ edges + kstar(2), coef=c(-1.6339, 0.0049))
plot(gofflo2)
## End(No test)




