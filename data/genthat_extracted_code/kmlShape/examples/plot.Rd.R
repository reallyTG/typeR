library(kmlShape)


### Name: plot
### Title: ~ Function: plot for Clds ~
### Aliases: plot plot,Clds,missing-method
### Keywords: dplotTraj iplotTraj chron spatial classif cluster ts

### ** Examples


### Generating artificial data
nbLignes <- 12
trajH <- matrix(0,nbLignes,10)

 for(i in 1:(nbLignes/3)){
   trajH[i,] <- pnorm(1:10,runif(1,3,8),1)*rnorm(1,10,1)
}
for(i in (nbLignes/3+1):(2*nbLignes/3)){
   trajH[i,] <- dnorm(1:10,runif(1,3,8),1)*rnorm(1,13,1)
}

for(i in (2*nbLignes/3+1):nbLignes){
   trajH[i,] <- pnorm(1:10,runif(1,3,8),1)*rnorm(1,5,0.1)
}

myClds <- cldsWide(data.frame(1:60,trajH))

par(mfrow=c(1,2))
plotTraj(myClds)
kmlShape(myClds,toPlot="none")
plotTraj(myClds)




