library(deTestSet)


### Name: pleiades
### Title: Motion of Inextensible Elastic Beam, ODE
### Aliases: pleiades
### Keywords: utilities

### ** Examples

out <- pleiades()
par(mfrow = c(3,3))
for (i in 1:7) plot(out[,i+1], out[,i+8], type = "l", main = paste("body ",i),
     xlab = "x", ylab = "y")


plot(0, 0 , type = "n", main = "ALL",
     xlab = "x", ylab = "y", xlim = c(-3, 4), ylim = c(-4, 5))
for (i in 1:7) lines(out[,i+1], out[,i+8], col = i, lwd = 2)

# compare with reference solution
max(abs(out[nrow(out),-1]- reference("pleiades")))




