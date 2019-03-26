library(spselect)


### Name: spselect-package
### Title: Selecting spatial scale of area-level covariates in regression
###   models
### Aliases: spselect-package spselect
### Keywords: package

### ** Examples

data(y)
data(X.3D)
y.name <- "y"
ss <- c("ind", "ss1", "ss2")
mod_forward.step.ss_1 <- stepwise.ss(y, X.3D, y.name, ss, 1)



