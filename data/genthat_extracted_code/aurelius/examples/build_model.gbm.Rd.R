library(aurelius)


### Name: build_model.gbm
### Title: build_model.gbm
### Aliases: build_model.gbm

### ** Examples

dat <- data.frame(X1 = runif(100), 
                  X2 = rnorm(100))
dat$Y <- ((rexp(100,5) + 5 * dat$X1 - 4 * dat$X2) > 0)

bernoulli_model <- gbm::gbm(Y ~ X1 + X2, 
                            data = dat, 
                            distribution = 'bernoulli')
my_tree <- build_model(bernoulli_model, 1)



