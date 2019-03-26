library(freestats)


### Name: perceptrain
### Title: An original perceptron algorithm
### Aliases: perceptrain

### ** Examples

set.seed(1024)
z <- runif(n=3)
mydata <- fakedata(w=z,n=100)
r <- perceptrain(S=mydata$S,y=mydata$y,alpha_k=1,endcost=0)
r



