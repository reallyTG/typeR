library(kmlShape)


### Name: kmlShape
### Title: ~kmlShape ~
### Aliases: kmlShape

### ** Examples

###########
### Example

### Generating artificial data
nbLignes <- 20
trajG <- matrix(0,nbLignes,10)
for(i in 1:(nbLignes/2)){
   trajG[i,] <- dnorm(1:10,runif(1,3,8),1)*rnorm(1,10,0.1)
}
for(i in (nbLignes/2+1):nbLignes){
   trajG[i,] <- dnorm(1:10,runif(1,3,8),1)*rnorm(1,5,0.1)
}

myClds <- cldsWide(data.frame(1:20,trajG))
plot(myClds)

### kmlshape
par(ask=FALSE)
kmlShape(myClds,2)
par(ask=TRUE)
plot(myClds)



###########
### Example 2

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

myClds2 <- cldsWide(data.frame(1:60,trajH))
plot(myClds2)

### kmlshape
par(ask=FALSE)
kmlShape(myClds2,3)
par(ask=TRUE)
plot(myClds2)




