library(mirt)


### Name: wald
### Title: Wald statistics for mirt models
### Aliases: wald
### Keywords: wald

### ** Examples

## Not run: 
##D #View parnumber index
##D data(LSAT7)
##D data <- expand.table(LSAT7)
##D mod <- mirt(data, 1, SE = TRUE)
##D coef(mod)
##D 
##D # see how the information matrix relates to estimated parameters, and how it lines up
##D #   with the parameter index
##D (infonames <- wald(mod))
##D index <- mod2values(mod)
##D index[index$est, ]
##D 
##D #second item slope equal to 0?
##D L <- matrix(0, 1, 10)
##D L[1,3] <- 1
##D wald(mod, L)
##D 
##D #simultaneously test equal factor slopes for item 1 and 2, and 4 and 5
##D L <- matrix(0, 2, 10)
##D L[1,1] <- L[2, 7] <- 1
##D L[1,3] <- L[2, 9] <- -1
##D L
##D wald(mod, L)
##D 
##D #logLiklihood tests (requires estimating a new model)
##D cmodel <- 'theta = 1-5
##D            CONSTRAIN = (1,2, a1), (4,5, a1)'
##D mod2 <- mirt(data, cmodel)
##D #or, eqivalently
##D #mod2 <- mirt(data, 1, constrain = list(c(1,5), c(13,17)))
##D anova(mod2, mod)
##D 
## End(Not run)



