library(ROCS)


### Name: e.roc
### Title: Calculating expected Receiver Operating Characteristics Curve in
###   the presence of imperfect reference standards.
### Aliases: e.roc
### Keywords: classif

### ** Examples

## normal scores
sample.p <- rnorm(100, mean=1, sd=sqrt(2))  
sample.n <- rnorm(100, mean=-1, sd=sqrt(2))  

## probabilistic confidence
mu.p <- rbeta(100, shape1=5, shape2=1)
mu.n <- rbeta(100, shape1=1, shape2=5)

## combine the sample
x.sample <- c(sample.p, sample.n)
mu.sample <- c(mu.p, mu.n)

## build eROC curve
e.roc.fit <- e.roc(x=x.sample, mu=mu.sample)




