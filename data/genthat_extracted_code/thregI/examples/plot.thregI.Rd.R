library(thregI)


### Name: plot.thregI
### Title: plot survival, hazard and density curves
### Aliases: plot.thregI
### Keywords: interval-censored data plot survival analysis threshold
###   regression

### ** Examples

#load the data "bcos"
data("bcos", package="thregI")

# transform the "treatment" variable into factor variable f.treatment
bcos$f.treatment=factor(bcos$treatment)

# fit the threshold regression model on the factor variable f.treatment
fit<-thregI(Surv(left, right, type='interval2')~f.treatment|f.treatment,data=bcos)

# estimated survival function at all levels of a categorical variable
plot.thregI(fit, var = f.treatment, graph = "sv", nocolor = 1)

# estimated hazard function at all levels of a categorical variable
plot.thregI(fit, var = f.treatment, graph = "hz", nocolor = 1)

# estimated density function at all levels of a categorical variable
plot.thregI(fit, var = f.treatment, graph = "ds", nocolor = 1)



