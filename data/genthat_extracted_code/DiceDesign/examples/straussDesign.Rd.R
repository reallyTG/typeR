library(DiceDesign)


### Name: straussDesign
### Title: Designs based on Strauss process
### Aliases: straussDesign
### Keywords: design

### ** Examples

# Strauss-Gibbs designs in dimension 2 (n=20 points)
S1 <- straussDesign(n=20,dimension=2,RND=0.2)
plot(S1$design,xlim=c(0,1),ylim=c(0,1))
theta <- seq(0,2*pi,by =2*pi/(100 - 1))
for(i in 1:S1$n){
   lines(S1$design[i,1]+S1$radius/2*cos(theta),
	   S1$design[i,2]+S1$radius/2*sin(theta),col='red')
}
# 2D-Strauss design
S2 <- straussDesign(n=20,dimension=2,RND=0.2,NMC=200,
	constraints1D=0,alpha=0,repulsion=0.01)

plot(S2$design,xlim=c(0,1),ylim=c(0,1))

# 2D-Strauss designs with constraints on the axis
S3 <- straussDesign(n=20,dimension=2,RND=0.18,NMC=200,
	constraints1D=1,alpha=0.5,repulsion=0.1,repulsion1D=0.01)

plot(S3$design,xlim=c(0,1),ylim=c(0,1))
rug(S3$design[,1],side=1)
rug(S3$design[,2],side=2)



