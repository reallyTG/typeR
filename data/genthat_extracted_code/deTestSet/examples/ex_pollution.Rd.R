library(deTestSet)


### Name: pollution
### Title: Pollution Problem, from Chemistry, ODE
### Aliases: pollution
### Keywords: utilities

### ** Examples

out <- pollution()
plot(out, lwd = 2, which = 1:9)

out1 <- pollution(times = 0:60)

# compare with reference solution
max(abs(out1[nrow(out1),-1] -  reference("pollution")))    



