library(RandomFields)


### Name: RRdistr
### Title: Definition of Distribution Families
### Aliases: RRdistr RM_DISTR
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## here a model with random scale parameter
model <- RMgauss(scale=exp(rate=1))
x <- seq(0,10,0.02)
n <- 10
## Don't show: 
if(RFoptions()$internal$examples_reduced){warning("reduced 'n'"); n<-1}
## End(Don't show) 
for (i in 1:n) {  
  readline(paste("Simulation no.", i, ": press return", sep=""))
  plot(RFsimulate(model, x=x, seed=i))
}

## another possibility to define exactly the same model above is
## model <- RMgauss(scale=exp())

## note that however, the following two definitions lead
## to covariance models with fixed scale parameter:
## model <- RMgauss(scale=exp(1))   # fixed to 2.7181
## model <- RMgauss(scale=exp(x=1)) # fixed to 2.7181


## here, just two other examples:
## fst
model <- RMmatern(nu=unif(min=0.1, max=2)) # random
for (i in 1:n) {
  readline(paste("Simulation no.", i, ": press return", sep=""))
  plot(RFsimulate(model, x=x, seed=i))
}

## snd, part 1
## note that the fist 'exp' refers to the exponential function,
## the second to the exponential distribution.
(model1 <- RMgauss(var=exp(3), scale=exp(rate=1)))
x <- 1:100/10
plot(z1 <- RFsimulate(model=model, x=x))

## snd, part 2
## exactly the same result as in the previous example
(model2 <- RMgauss(var=exp(3), scale=RRdistr("exp", rate=1)))
plot(z2 <- RFsimulate(model=model, x=x))
all.equal(model1, model2)

## Don't show: 
FinalizeExample()
## End(Don't show)


