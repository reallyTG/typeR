library(spselect)


### Name: stepwise.ss
### Title: Spatial scale forward stepwise regression
### Aliases: stepwise.ss
### Keywords: models

### ** Examples

data(y)
data(X.3D)
y.name <- "y"
ss <- c("ind", "ss1", "ss2")
mod_forward.step.ss_1 <- stepwise.ss(y, X.3D, y.name, ss, 1)



