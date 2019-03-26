library(flipscores)


### Name: flipscores
### Title: Robust testing in GLMs
### Aliases: flipscores

### ** Examples


set.seed(8153)
n <-50
beta <- 2  #coeffient of interest (H0: beta=0)
gamma <- 1   #nuisance coefficient

dataset <- data.frame(x=NULL,z=NULL,y=NULL)
dataset[n,] <- NA
dataset[,1:2] <- data.frame(matrix(rnorm(n*2),n,2))  #generate covariates
colnames(dataset) <- c("x","z")
dataset$y <- rnbinom(n, mu = exp(dataset[,1]*beta + dataset[,2]*gamma), size=1 )

#Y has a negative binomial distribution but we assume a Poisson model:
modelz <- glm(y~z, family=poisson,data=dataset,x=TRUE)


## Basic test:
pv1 <- flipscores(model0=modelz, X1=dataset[,1], alternative = "two.sided", scoretype="basic")
pv1  #p-value

## Test that takes into account nuisance estimation:
pv2 <- flipscores(model0=modelz, X1=dataset[,1], alternative = "two.sided", scoretype="eff")
pv2  #p-value




