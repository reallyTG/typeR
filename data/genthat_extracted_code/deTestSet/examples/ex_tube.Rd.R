library(deTestSet)


### Name: tube
### Title: Water Tube System, Mechanics problem, DAE of Index 2
### Aliases: tube
### Keywords: utilities

### ** Examples

out <- tube()
plot(out, lwd = 2, which = 1:9)
plot(out, which = "phi3.4", lwd = 2, xlim = c(10000, 60000),
 ylim = c(0.000145, 0.000185))

# compare with reference solution
max(abs(out[nrow(out),-1]- reference("tube")))    



