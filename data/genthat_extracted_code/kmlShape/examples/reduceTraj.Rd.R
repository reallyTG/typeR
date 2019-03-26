library(kmlShape)


### Name: reduceTraj
### Title: ~ Function: reduceTraj ~
### Aliases: reduceTraj

### ** Examples

### Generating artificial data
nbLignes <- 200
trajG <- matrix(0,nbLignes,51)
for(i in 1:(nbLignes/2)){
   trajG[i,] <- dnorm(0:50,runif(1,15,35),5)*rnorm(1,10,0.1)
}
for(i in (nbLignes/2+1):nbLignes){
   trajG[i,] <- dnorm(0:50,runif(1,15,35),5)*rnorm(1,5,0.1)
}
myClds <- cldsWide(data.frame(1:200,trajG))
plot(myClds)

### Reducing the number of time measurement
reduceTraj(myClds,nbTimes=7)
plotSenators(myClds)

### Reducing the number of individual
reduceTraj(myClds,nbSenators=32)
plotSenators(myClds)

### Reducing both
reduceTraj(myClds,nbSenators=32,nbTimes=7)
plotSenators(myClds)



