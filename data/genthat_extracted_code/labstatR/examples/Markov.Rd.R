library(labstatR)


### Name: Markov
### Title: Simulatore di catene di Markov
### Aliases: Markov Markov2
### Keywords: distribution

### ** Examples

x <- c("P","S","N")
P <- matrix(c(0.5,0.5,0.25,0.25,0,0.25,0.25,0.5,0.5),3,3)
Markov("S",15,x,P)  -> traj
traj
plot(traj$t,unclass(factor(traj$X)),type="s",axes=FALSE,
 xlab="t",ylab="Che tempo fa'")
axis(1)
axis(2,c(1,2,3),levels(factor(traj$X)))
box()



