library(simone)


### Name: rTranscriptData
### Title: Simulation of artificial transcriptomic data
### Aliases: rTranscriptData
### Keywords: datagen

### ** Examples

## time-Course data generation
##-----------------------------
# generate a directed network
n <- 20
p <- 5
g <- rNetwork(p, pi=5, directed=TRUE)
# Generate the data, data2 noisier than data1
data1  <- rTranscriptData(n,g)
data2  <- rTranscriptData(n,g,sigma=1)
matplot(1:n, data1$X,type= "l", xlab = "time points",
        ylab = "level of expression", col=rainbow(n,start=2/6,end = 3/6),
        ylim = range(c(data1$X,data2$X)),
        main="data2 (blue) generated with more noise than data1 (green)")
matlines(1:n,data2$X,type= "l",col = rainbow(n,start=4/6,end=5/6))

## steady-state data generation
##-----------------------------
# generate an undirected network
p <- 10
g <- rNetwork(p, pi=10)
data <- rTranscriptData(n=1000,g, sigma=0)
attach(data)
# Inference of Theta (here without dimension problems since p << n)
b <- sapply(1:p,function(x){
   tmp <- -solve(t(X[,-x]) %*% X[,-x]) %*% t(X[,-x]) %*% X[,x]
   res <- rep(NA,10)
   res[-x] <- tmp
   res[x] <- 1
   return(res)
  }
)
detach(data)
# comparison of theoretical Theta and inferred Theta
par(mfrow=c(1,2))
image(g$Theta, main = "Theoretical Theta")
image(b, main = "Inferred Theta")

## time-course multitask data generation
##--------------------------------------
# start by generating the networks
ancestor <- rNetwork(p=5, pi=5, name="ancestor", directed=TRUE)
child1   <- coNetwork(ancestor, 1, name = "child 1")
child2   <- coNetwork(ancestor, 1, name = "child 2")
# generate the data
n <- c(20,20)
data  <- rTranscriptData(n,child1,child2)
attach(data)
par(mfrow=c(2,1))
matplot(1:(n[1]),X[tasks ==1,],type= "l", main="Dataset from child 1",
        xlab = "time points", ylab = "level of expression")
matplot(1:(n[2]),X[tasks == 2,], type= "l", main="Dataset from child 2",
        xlab = "time points", ylab = "level of expression")
detach(data)



