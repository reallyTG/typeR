library(deTestSet)


### Name: caraxis
### Title: The Car Axis Mechanical Problem, Index 3 DAE
### Aliases: caraxis
### Keywords: utilities

### ** Examples

out <- caraxis()
plot(out, lwd = 2, mfrow = c(3, 4))

# compare with reference solution
out[nrow(out),2:11]-reference("caraxis")



