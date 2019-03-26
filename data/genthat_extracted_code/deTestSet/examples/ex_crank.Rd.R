library(deTestSet)


### Name: crank
### Title: Slider Crank Mechanical Problem, Index 2 DAE
### Aliases: crank
### Keywords: utilities

### ** Examples

out <- crank()
plot(out, lwd = 2, which = 1:9)

# compare  with reference solution (only  the first seven components)
refsol <- reference("crank")
max(abs(out[nrow(out),2:8] - refsol[1:7])/refsol[1:7])     



