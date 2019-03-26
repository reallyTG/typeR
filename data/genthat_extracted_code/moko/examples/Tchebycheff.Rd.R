library(moko)


### Name: Tchebycheff
### Title: Augmented Tchebycheff function
### Aliases: Tchebycheff

### ** Examples

grid <- expand.grid(seq(0, 1, , 50),seq(0, 1, , 50))
 res <- t(apply(grid, 1, nowacki_beam))
 plot(nowacki_beam_tps$x, xlim=c(0,1), ylim=c(0,1))
 grid <- grid[which(as.logical(apply(res[,-(1:2)] < 0, 1, prod))),]
 res <- res[which(as.logical(apply(res[,-(1:2)] < 0, 1, prod))),1:2]
for (i in 1:10){
sres <- Tchebycheff(res[,1:2], s=100, rho=0.1)
points(grid[which.min(sres),], col='green')
}



