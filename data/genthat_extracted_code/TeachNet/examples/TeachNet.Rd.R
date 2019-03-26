library(TeachNet)


### Name: TeachNet
### Title: Fits the neural network
### Aliases: TeachNet

### ** Examples

df <- sample(c(rep(1,20),rep(0,20))) 
income <- c(rnorm(40,mean=1000,sd=10)) 
debt <- rnorm(40,mean=0.5,sd=0.1)
data <- data.frame(df, income, debt)

weights <- TeachNet(data,sameSample=TRUE,sampleLength=0.9,stepMax=2)




