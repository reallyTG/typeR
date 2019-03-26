library(freestats)


### Name: classify.pt
### Title: Classify for perceptrain result
### Aliases: classify.pt

### ** Examples

set.seed(1024)
z <- runif(n=3)
mydata <- fakedata(w=z,n=100)
r <- perceptrain(S=mydata$S,y=mydata$y,alpha_k=1,endcost=0)
classify.pt(r,mydata$S[,1:(NCOL(mydata$S)-1)])



