library(gMWT)


### Name: estPI
### Title: Calculate Probabilistic Index
### Aliases: estPI
### Keywords: methods

### ** Examples


X <- c(sample(15))
g <- c(1,1,1,2,2,2,2,3,3,3,4,4,4,4,4)
estPI(X,g,type="single")

X <- matrix(c(rnorm(5000,1.5,2),rnorm(6000,2,2),rnorm(4000,3.5,1)),byrow=TRUE, ncol=10)
colnames(X) <- letters[1:10]
g <- c(rep(1,500),rep(2,600),rep(3,400))

estPI(X,g,type="single",mc=1)




