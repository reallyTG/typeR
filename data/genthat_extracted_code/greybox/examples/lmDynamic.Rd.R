library(greybox)


### Name: lmDynamic
### Title: Combine regressions based on point information criteria
### Aliases: lmDynamic
### Keywords: models nonlinear regression ts

### ** Examples


### Simple example
xreg <- cbind(rnorm(100,10,3),rnorm(100,50,5))
xreg <- cbind(100+0.5*xreg[,1]-0.75*xreg[,2]+rnorm(100,0,3),xreg,rnorm(100,300,10))
colnames(xreg) <- c("y","x1","x2","Noise")
inSample <- xreg[1:80,]
outSample <- xreg[-c(1:80),]
# Combine all the possible models
ourModel <- lmDynamic(inSample,bruteForce=TRUE)
predict(ourModel,outSample)
plot(predict(ourModel,outSample))




