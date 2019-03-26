library(matlib)


### Name: vectors
### Title: Draw geometric vectors in 2D
### Aliases: vectors

### ** Examples

# shows addition of vectors
u <- c(3,1)
v <- c(1,3)
sum <- u+v

xlim <- c(0,5)
ylim <- c(0,5)
# proper geometry requires asp=1
plot( xlim, ylim, type="n", xlab="X", ylab="Y", asp=1)
abline(v=0, h=0, col="gray")

vectors(rbind(u,v,`u+v`=sum), col=c("red", "blue", "purple"), cex.lab=c(2, 2, 2.2))
# show the opposing sides of the parallelogram
vectors(sum, origin=u, col="red", lty=2)
vectors(sum, origin=v, col="blue", lty=2)

# projection of vectors
vectors(Proj(v,u), labels="P(v,u)", lwd=3)
vectors(v, origin=Proj(v,u))
corner(c(0,0), Proj(v,u), v, col="grey")



