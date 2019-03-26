library(deTestSet)


### Name: ring
### Title: The Ring Modulator Problem, Electrical Circuit Analysis, ODE
### Aliases: ring
### Keywords: utilities

### ** Examples

out <- ring()
plot(out, col = "darkblue", lwd = 2)
mtext(side = 3, line = -1.5, "RING modulator",cex = 1.25, outer = TRUE)

# compare with reference solution
max(abs(out[nrow(out),-1]- reference("ring")))    



