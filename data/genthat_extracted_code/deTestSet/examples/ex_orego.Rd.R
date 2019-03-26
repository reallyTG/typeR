library(deTestSet)


### Name: orego
### Title: The Oregonator Chemistry Model, ODE
### Aliases: orego
### Keywords: utilities

### ** Examples

out <- orego()
plot(out, lwd = 2, log = "y")

# compare with exact solution
out[nrow(out),-1] - reference("orego")




