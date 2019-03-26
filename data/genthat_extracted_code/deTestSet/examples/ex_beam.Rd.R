library(deTestSet)


### Name: beam
### Title: Motion of Inextensible Elastic Beam, ODE
### Aliases: beam
### Keywords: utilities

### ** Examples

out <- beam()
plot(out, col = "darkblue", lwd = 2, which = 1:16)
mtext(side = 3, line = -1.5, "beam", cex = 1.25, outer = TRUE)

image(out[,-1])

# compare with reference solution
refsol <- reference("beam")
max(abs(out[nrow(out),-1] - refsol)/refsol)  




