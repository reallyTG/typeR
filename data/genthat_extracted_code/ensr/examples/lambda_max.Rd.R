library(ensr)


### Name: lambda_max
### Title: Lambda Max
### Aliases: lambda_max

### ** Examples


data(tbi)
Xmat <- model.matrix( ~ . - injury1 - injury2 - injury3 - 1, data = tbi)
Yvec <- matrix(tbi$injury1, ncol = 1)

alphas <- seq(0, 1, length = 20)
lambda_max(Yvec, Xmat, alpha = alphas)

# Look at different options for standardizing the inputs.

dat <-
  expand.grid(standardize = c(TRUE, FALSE),
              alpha = alphas)

lmax <-
  Map(lambda_max,
      standardize = dat$standardize,
      alpha = dat$alpha,
      MoreArgs = list(y = Yvec, x = Xmat))


gmax <-
  Map(glmnet::glmnet,
      standardize = dat$standardize,
      alpha = dat$alpha,
      MoreArgs = list(y = Yvec, x = Xmat))

dat$gmax <- sapply(gmax, function(f) f$lambda[1])
dat$lmax <- unlist(lmax)

par(mfrow = c(1, 2))

with(subset(dat, standardize == TRUE),
     {
       plot(log10(gmax), log10(lmax))
       abline(0, 1)
       title(main = "standardize == TRUE")
     })

with(subset(dat, standardize == FALSE),
     {
       plot(log10(gmax), log10(lmax))
       abline(0, 1)
       title(main = "standardize == FALSE")
     })




