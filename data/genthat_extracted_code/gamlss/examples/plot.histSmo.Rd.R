library(gamlss)


### Name: plot.histSmo
### Title: A Plotting Function for density estimator object histSmo
### Aliases: plot.histSmo
### Keywords: distribution

### ** Examples

Y <- rPARETO2(1000) 
m1<- histSmo(Y, lower=0, save=TRUE)
plot(m1)
plot(m1, "cdf")
plot(m1, "invcdf")



