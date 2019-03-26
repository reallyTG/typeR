library(hdlm)


### Name: hdglm
### Title: Fitting High Dimensional Generalized Linear Models
### Aliases: hdglm bayes.hdglm.fit predict.hdglm print.summary.hdglm

### ** Examples

  set.seed(42)
  x <- matrix(rnorm(10*100),ncol=10)
  mu <- exp(x[,1] + x[,2]*0.5) / (1 + exp(x[,1] + x[,2]*0.5))

  y <- rbinom(100,1,prob=mu)

  out <- hdglm(y ~ x, family='binomial')
  summary(out)



