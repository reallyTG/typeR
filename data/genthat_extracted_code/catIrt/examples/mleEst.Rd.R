library(catIrt)


### Name: mleEst
### Title: Estimate Ability in IRT Models
### Aliases: mleEst wleEst bmeEst eapEst

### ** Examples

## Not run: 
##D 
##D #########################
##D # Binary Response Model #
##D #########################
##D set.seed(888)
##D # generating random theta:
##D theta <- rnorm(201)
##D # generating an item bank under a 2-parameter binary response model:
##D b.params <- cbind(a = runif(100, .5, 1.5), b = rnorm(100, 0, 2), c = 0)
##D # simulating responses using specified theta:
##D b.resp <- simIrt(theta = theta, params = b.params, mod = "brm")$resp
##D 
##D 
##D # estimating theta using all four methods:
##D est.mle1 <- mleEst(resp = b.resp, params = b.params, mod = "brm")$theta
##D est.wle1 <- wleEst(resp = b.resp, params = b.params, mod = "brm")$theta
##D est.bme1 <- bmeEst(resp = b.resp, params = b.params, mod = "brm",
##D                    ddist = dnorm, mean = 0, sd = 1)$theta
##D est.eap1 <- eapEst(resp = b.resp, params = b.params, mod = "brm",
##D                    ddist = dnorm, mean = 0, sd = 1, quad = 33)$theta
##D 
##D # eap takes a while!
##D 
##D # all of the methods are highly correlated:
##D cor(cbind(theta = theta, mle = est.mle1, wle = est.wle1,
##D                          bme = est.bme1, eap = est.eap1))
##D 
##D # you can force eap to be positive:
##D est.eap2 <- eapEst(resp = b.resp, params = b.params, range = c(0, 6),
##D                                   mod = "brm", ddist = dunif, min = 0, max = 6)$theta
##D 
##D est.eap2
##D 
##D # if you only have a single response, MLE will give junk!
##D mleEst(resp = 0, params = c(1, 0, .2), mod = "brm")$theta
##D 
##D # the others will give you answers that are not really determined by the response:
##D wleEst(resp = 0, params = c(1, 0, .2), mod = "brm")$theta
##D bmeEst(resp = 0, params = c(1, 0, .2), mod = "brm")$theta
##D eapEst(resp = 0, params = c(1, 0, .2), mod = "brm")$theta
##D 
##D 
##D #########################
##D # Graded Response Model #
##D #########################
##D set.seed(999)
##D # generating random theta
##D theta <- rnorm(400)
##D # generating an item bank under a graded response model:
##D g.params <- cbind(a = runif(100, .5, 1.5), b1 = rnorm(100), b2 = rnorm(100),
##D                                            b3 = rnorm(100), b4 = rnorm(100))
##D # simulating responses using random theta:
##D g.mod <- simIrt(params = g.params, theta = theta, mod = "grm")
##D 
##D # pulling out the responses and the parameters:
##D g.params2 <- g.mod$params[ , -1]       # now the parameters are sorted
##D g.resp2 <- g.mod$resp
##D 
##D # estimating theta using all four methods:
##D est.mle3 <- mleEst(resp = g.resp2, params = g.params2, mod = "grm")$theta
##D est.wle3 <- wleEst(resp = g.resp2, params = g.params2, mod = "grm")$theta
##D est.bme3 <- bmeEst(resp = g.resp2, params = g.params2, mod = "grm",
##D                    ddist = dnorm, mean = 0, sd = 1)$theta
##D est.eap3 <- eapEst(resp = g.resp2, params = g.params2, mod = "grm",
##D                    ddist = dnorm, mean = 0, sd = 1, quad = 33)$theta
##D 
##D # and the correlations are still pretty high:
##D cor(cbind(theta = theta, mle = est.mle3, wle = est.wle3,
##D                          bme = est.bme3, eap = est.eap3))
##D 
##D # note that the graded response model is just a generalization of the brm:
##D cor(est.mle1, mleEst(resp = b.resp + 1, params = b.params[ , -3], mod = "grm")$theta)
##D cor(est.wle1, wleEst(resp = b.resp + 1, params = b.params[ , -3], mod = "grm")$theta)
##D cor(est.bme1, bmeEst(resp = b.resp + 1, params = b.params[ , -3], mod = "grm")$theta)
##D cor(est.eap1, eapEst(resp = b.resp + 1, params = b.params[ , -3], mod = "grm")$theta)
##D 
## End(Not run)




