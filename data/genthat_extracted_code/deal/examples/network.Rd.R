library(deal)


### Name: network
### Title: Bayesian network data structure
### Aliases: network plot.network print.network
### Keywords: models

### ** Examples

A <- factor(rep(c("A1","A2"),50))
B <- factor(rep(rep(c("B1","B2"),25),2))
thisnet <- network( data.frame(A,B) )

set.seed(109)
sex     <- gl(2,4,label=c("male","female"))
age     <- gl(2,2,8)
yield   <- rnorm(length(sex))
weight  <- rnorm(length(sex))
mydata  <- data.frame(sex,age,yield,weight)
mynw    <- network(mydata)

# adjust prior probability distribution
localprob(mynw,"sex")   <- c(0.4,0.6)
localprob(mynw,"age")   <- c(0.6,0.4)
localprob(mynw,"yield") <- c(2,0)
localprob(mynw,"weight")<- c(1,0)

print(mynw)
plot(mynw)

prior <- jointprior(mynw)
mynw  <- getnetwork(learn(mynw,mydata,prior))
thebest <- getnetwork(autosearch(mynw,mydata,prior))

print(mynw,condposterior=TRUE)

## Not run: savenet(mynw,file("yield.net"))



