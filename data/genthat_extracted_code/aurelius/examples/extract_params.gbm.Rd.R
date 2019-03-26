library(aurelius)


### Name: extract_params.gbm
### Title: extract_params.gbm
### Aliases: extract_params.gbm

### ** Examples

dat <- data.frame(X1 = runif(100), 
                  X2 = rnorm(100)) 
dat$Y <- ((rexp(100,5) + 5 * dat$X1 - 4 * dat$X2) > 0)

bernoulli_model <- gbm::gbm(Y ~ X1 + X2, 
                            data = dat, 
                            distribution = 'bernoulli')
my_tree <- extract_params(bernoulli_model, 1)



