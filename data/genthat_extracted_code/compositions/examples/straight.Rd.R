library(compositions)


### Name: straight
### Title: Draws straight lines.
### Aliases: straight straight.rmult straight.acomp straight.rcomp
###   straight.aplus straight.rplus
### Keywords: multivariate

### ** Examples

data(SimulatedAmounts)

plot(acomp(sa.lognormals))
straight(mean(acomp(sa.lognormals)),
         princomp(acomp(sa.lognormals))$Loadings[1,],
         col="red")
straight(mean(rcomp(sa.lognormals)),
         princomp(rcomp(sa.lognormals))$loadings[,1],
         col="blue")

plot(aplus(sa.lognormals[,1:2]))
straight(mean(aplus(sa.lognormals[,1:2])),
         princomp(aplus(sa.lognormals[,1:2]))$Loadings[1,],
         col="red")
straight(mean(rplus(sa.lognormals[,1:2])),
         princomp(rplus(sa.lognormals[,1:2]))$loadings[,1],
         col="blue")

plot(rplus(sa.lognormals[,1:2]))
straight(mean(aplus(sa.lognormals[,1:2])),
         princomp(aplus(sa.lognormals[,1:2]))$Loadings[1,],
         col="red")
straight(mean(rplus(sa.lognormals[,1:2])),
         princomp(rplus(sa.lognormals[,1:2]))$loadings[,1],
         col="blue")




