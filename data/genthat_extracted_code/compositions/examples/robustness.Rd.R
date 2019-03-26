library(compositions)


### Name: robustnessInCompositions
### Title: Handling robustness issues and outliers in compositions.
### Aliases: robust robustnessInCompositions
### Keywords: robust

### ** Examples

A <- matrix(c(0.1,0.2,0.3,0.1),nrow=2)
Mvar <- 0.1*ilrvar2clr(A%*%t(A))
Mcenter <- acomp(c(1,2,1))
typicalData <- rnorm.acomp(100,Mcenter,Mvar) # main population
colnames(typicalData)<-c("A","B","C")
data5 <- acomp(rbind(unclass(typicalData)+outer(rbinom(100,1,p=0.1)*runif(100),c(0.1,1,2))))

mean(data5)
mean(data5,robust=TRUE)
var(data5)
var(data5,robust=TRUE)
Mvar
biplot(princomp(data5))
biplot(princomp(data5,robust=TRUE))




