library(Fragman)


### Name: transfft
### Title: Applying the fourier transformation to a data frame
### Aliases: transfft

### ** Examples

data(my.plants)
g1 <- transfft(my.plants[[1]][,4], top=0.8)
g2 <- transfft(my.plants[[1]][,4], top=0.4)
g3 <- transfft(my.plants[[1]][,4], top=0.1)
layout(matrix(1:3,3,1))
plot(g1, type="l")
lines(g2, col="red")
lines(g3, col="blue")
par1 <- c("top=0.8", "top=0.4", "top=0.1")
par2 <- c("black", "red", "blue")
par3 <- c(1,1,1)
legend("topright", legend=par1, col=par2, bty = "n", lty=par3, lwd=par3, cex=0.75)



