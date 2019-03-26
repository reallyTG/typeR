library(multitaper)


### Name: plot.mtm
### Title: Compute and plot the multitaper spectrum estimate
### Aliases: plot.mtm
### Keywords: multitaper

### ** Examples

data(willamette)
resSpec <- spec.mtm(willamette, nw=4.0, k=8, Ftest=TRUE, plot=FALSE, deltat=1.0, dtUnits="month")
plot(resSpec)
plot(resSpec, Ftest=TRUE)
plot(resSpec, Ftest=TRUE, siglines=c(0.90, 0.99))

# with jackknife estimate
resSpec2 <- spec.mtm(willamette, nw=4.0, k=8, Ftest=TRUE, jackknife=TRUE, plot=FALSE,
                     deltat=1.0, dtUnits="month")
plot(resSpec2,jackknife=TRUE)




