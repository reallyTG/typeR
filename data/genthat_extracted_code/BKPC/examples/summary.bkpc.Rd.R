library(BKPC)


### Name: summary.bkpc
### Title: Summary statistics for Markov Chain Monte Carlo chain from
###   Bayesian Kernel Projection Classifier
### Aliases: summary.bkpc

### ** Examples


set.seed(-88106935)

data(iris)
testset <- sample(1:150,50)

train <- as.matrix(iris[-testset,-5])
test <- as.matrix(iris[testset,-5])

wtr <- iris[-testset, 5]
wte <- iris[testset, 5]

result <- bkpc(train, y = wtr,  n.iter = 1000,  thin = 10, n.kpc = 2, 
intercept = FALSE, rotate = TRUE)


summary(result, n.burnin = 0)



