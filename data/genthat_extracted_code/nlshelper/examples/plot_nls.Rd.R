library(nlshelper)


### Name: plot_nls
### Title: Plot a non-linear or non-parametric regression model
### Aliases: plot_loess plot_nls

### ** Examples


# Plot an nls object
chick <- as.data.frame(ChickWeight)
fit0 <- nls(weight ~ a*Time^b, data=chick, start=list(a=10, b=1.1))
plot_nls(fit0)

# Plot a grouped nls object
library(nlme)
fit1 <- nlsList(weight ~ a*Time^b|Diet, data=chick, start=list(a=10, b=1.1))
plot_nls(fit1)

# Plot a local regression object, with confidence interval
l <- loess(wt ~ disp, data=mtcars)
plot_loess(l)

# To plot behind the data:
with(mtcars, plot(disp, wt, pch=19,
 panel.first=plot_loess(l, plotdata=FALSE)))




