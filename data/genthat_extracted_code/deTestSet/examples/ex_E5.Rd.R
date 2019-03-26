library(deTestSet)


### Name: E5
### Title: E5 Model for Chemical Pyrolysis, ODE
### Aliases: E5
### Keywords: utilities

### ** Examples

out <- E5()
plot(out, lwd = 2, log = "xy")
# compare with reference solution
out[nrow(out),-1] - reference("E5")




