library(spatstat)


### Name: model.depends
### Title: Identify Covariates Involved in each Model Term
### Aliases: model.depends model.is.additive model.covariates
###   has.offset.term has.offset
### Keywords: spatial models

### ** Examples

   x <- 1:10
   y <- 3*x + 2
   z <- rep(c(-1,1), 5)
   fit <- lm(y ~ poly(x,2) + sin(z))
   model.depends(fit)
   model.covariates(fit)
   model.is.additive(fit)

   fitoff1 <- lm(y ~ x + offset(z))
   fitoff2 <- lm(y ~ x, offset=z)
   has.offset.term(fitoff1)
   has.offset(fitoff1)
   has.offset.term(fitoff2)
   has.offset(fitoff2)



