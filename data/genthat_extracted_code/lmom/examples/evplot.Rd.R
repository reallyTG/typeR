library(lmom)


### Name: evplot
### Title: Extreme-value plot
### Aliases: evplot evplot.default evdistp evdistq evpoints
### Keywords: hplot

### ** Examples

# Extreme-value plot of Ozone from the airquality data
data(airquality)
evplot(airquality$Ozone)

# Fit a GEV distribution and add it to the plot
evdistq(quagev, pelgev(samlmu(airquality$Ozone)))

# Not too good -- try a kappa distribution instead
evdistq(quakap, pelkap(samlmu(airquality$Ozone)), col="red")



