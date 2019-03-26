library(deTestSet)


### Name: rober
### Title: Autocatalytic Chemical Reaction of Robertson, ODE
### Aliases: rober
### Keywords: utilities

### ** Examples

out <- rober()
plot(out, lwd = 2, log = "x")

# compare to reference solution
out[nrow(out),-1] - reference("rober")




