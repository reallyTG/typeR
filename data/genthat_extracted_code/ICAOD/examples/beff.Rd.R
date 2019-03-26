library(ICAOD)


### Name: beff
### Title: Calculates Relative Efficiency for Bayesian Optimal Designs
### Aliases: beff

### ** Examples

#############################
#  2PL model
############################
formula4.1 <- ~ 1/(1 + exp(-b *(x - a)))
predvars4.1 <- "x"
parvars4.1 <- c("a", "b")

# des4.1 is a list of Bayesian optimal designs with corresponding priors.


des4.1 <- vector("list", 6)
des4.1[[1]]$x <- c(-3, -1.20829, 0, 1.20814, 3)
des4.1[[1]]$w <- c(.24701, .18305, .13988, .18309, .24702)
des4.1[[1]]$prior <- uniform(lower =  c(-3, .1), upper = c(3, 2))

des4.1[[2]]$x <- c(-2.41692, -1.16676, .04386, 1.18506, 2.40631)
des4.1[[2]]$w <- c(.26304, .18231, .14205, .16846, .24414)
des4.1[[2]]$prior <- student(mean =  c(0, 1), S   = matrix(c(1, -0.17, -0.17, .5), nrow = 2),
                             df = 3, lower =  c(-3, .1), upper = c(3, 2))

des4.1[[3]]$x <- c(-2.25540, -.76318, .54628, 2.16045)
des4.1[[3]]$w <- c(.31762, .18225, .18159, .31853)
des4.1[[3]]$prior <- normal(mu =  c(0, 1),
                            sigma = matrix(c(1, -0.17, -0.17, .5), nrow = 2),
                            lower =  c(-3, .1), upper = c(3, 2))

des4.1[[4]]$x <- c(-2.23013, -.66995, .67182, 2.23055)
des4.1[[4]]$w <- c(.31420, .18595, .18581, .31404)
des4.1[[4]]$prior <- normal(mu =  c(0, 1),
                            sigma = matrix(c(1, 0, 0, .5), nrow = 2),
                            lower =  c(-3, .1), upper = c(3, 2))

des4.1[[5]]$x <- c(-1.51175, .12043, 1.05272, 2.59691)
des4.1[[5]]$w <- c(.37679, .14078, .12676, .35567)
des4.1[[5]]$prior <- skewnormal(xi = c(0, 1),
                                Omega = matrix(c(1, -0.17, -0.17, .5), nrow = 2),
                                alpha = c(1, 0), lower =  c(-3, .1), upper = c(3, 2))


des4.1[[6]]$x <- c(-2.50914, -1.16780, -.36904, 1.29227)
des4.1[[6]]$w <- c(.35767, .11032, .15621, .37580)
des4.1[[6]]$prior <- skewnormal(xi = c(0, 1),
                                Omega = matrix(c(1, -0.17, -0.17, .5), nrow = 2),
                                alpha = c(-1, 0), lower =  c(-3, .1), upper = c(3, 2))

## now we want to find the relative efficiency of
## all Bayesian optimal designs assuming different priors (6 * 6)
eff4.1 <- matrix(NA, 6, 6)
colnames(eff4.1) <- c("uni", "t", "norm1", "norm2", "skew1", "skew2")
rownames(eff4.1) <- colnames(eff4.1)
## Not run: 
##D for (i in 1:6)
##D   for(j in 1:6)
##D     eff4.1[i, j] <- beff(formula = formula4.1,
##D                          predvars = predvars4.1,
##D                          parvars = parvars4.1,
##D                          family = binomial(),
##D                          prior = des4.1[[i]]$prior,
##D                          xopt = des4.1[[i]]$x,
##D                          wopt = des4.1[[i]]$w,
##D                          x = des4.1[[j]]$x,
##D                          w = des4.1[[j]]$w)
##D # For example the first row represents Bayesian D-efficiencies of different
##D # Bayesian optimal design found assuming different priors with respect to
##D # the Bayesian D-optimal design found under uniform prior distribution.
## End(Not run)

#############################
# Relative efficiency for the DP-Compund criterion
############################
p <- c(1, -2, 1, -1)
prior4.4 <- uniform(p -1.5, p + 1.5)
formula4.4 <- ~exp(b0+b1*x1+b2*x2+b3*x1*x2)/(1+exp(b0+b1*x1+b2*x2+b3*x1*x2))
prob4.4 <- ~1-1/(1+exp(b0 + b1 * x1 + b2 * x2 + b3 * x1 * x2))
predvars4.4 <-  c("x1", "x2")
parvars4.4 <- c("b0", "b1", "b2", "b3")
lb <- c(-1, -1)
ub <- c(1, 1)



## des4.4 is a list of DP-optimal designs found using different values for alpha
des4.4 <- vector("list", 5)
des4.4[[1]]$x <- c(-1, 1)
des4.4[[1]]$w <- c(1)
des4.4[[1]]$alpha <- 0


des4.4[[2]]$x <- c(1, -.62534, .11405, -1, 1, .28175, -1, -1, 1, -1, -1, 1, 1, .09359)
des4.4[[2]]$w <- c(.08503, .43128, .01169, .14546, .05945, .08996, .17713)
des4.4[[2]]$alpha <- .25


des4.4[[3]]$x <- c(-1, .30193, 1, 1, .07411, -1, -.31952, -.08251, 1, -1, 1, -1, -1, 1)
des4.4[[3]]$w <- c(.09162, .10288, .15615, .13123, .01993, .22366, .27454)
des4.4[[3]]$alpha <- .5

des4.4[[4]]$x <- c(1, -1, .28274, 1, -1, -.19674, .03288, 1, -1, 1, -1, -.16751, 1, -1)
des4.4[[4]]$w <- c(.19040, .24015, .10011, .20527, .0388, .20075, .02452)
des4.4[[4]]$alpha <- .75

des4.4[[5]]$x <- c(1, -1, .26606, -.13370, 1, -.00887, -1, 1, -.2052, 1, 1, -1, -1, -1)
des4.4[[5]]$w <- c(.23020, .01612, .09546, .16197, .23675, .02701, .2325)
des4.4[[5]]$alpha <- 1

# D-efficiency of the DP-optimal designs:
# des4.4[[5]]$x and  des4.4[[5]]$w is the D-optimal design

beff(formula = formula4.4,
     predvars = predvars4.4,
     parvars = parvars4.4,
     family = binomial(),
     prior = prior4.4,
     xopt = des4.4[[5]]$x,
     wopt = des4.4[[5]]$w,
     x = des4.4[[2]]$x,
     w = des4.4[[2]]$w)

beff(formula = formula4.4,
     predvars = predvars4.4,
     parvars = parvars4.4,
     family = binomial(),
     prior = prior4.4,
     xopt = des4.4[[5]]$x,
     wopt = des4.4[[5]]$w,
     x = des4.4[[3]]$x,
     w = des4.4[[3]]$w)

beff(formula = formula4.4,
     predvars = predvars4.4,
     parvars = parvars4.4,
     family = binomial(),
     prior = prior4.4,
     xopt = des4.4[[5]]$x,
     wopt = des4.4[[5]]$w,
     x = des4.4[[4]]$x,
     w = des4.4[[4]]$w)

# must be one!
beff(formula = formula4.4,
     predvars = predvars4.4,
     parvars = parvars4.4,
     family = binomial(),
     prior = prior4.4,
     prob = prob4.4,
     type = "PA",
     xopt = des4.4[[5]]$x,
     wopt = des4.4[[5]]$w,
     x = des4.4[[5]]$x,
     w = des4.4[[5]]$w)

## P-efficiency
# reported in Table 4 as eff_P
# des4.4[[1]]$x and  des4.4[[1]]$w is the P-optimal design
beff(formula = formula4.4,
     predvars = predvars4.4,
     parvars = parvars4.4,
     family = binomial(),
     prior = prior4.4,
     prob = prob4.4,
     type = "PA",
     xopt = des4.4[[1]]$x,
     wopt = des4.4[[1]]$w,
     x = des4.4[[2]]$x,
     w = des4.4[[2]]$w)

beff(formula = formula4.4,
     predvars = predvars4.4,
     parvars = parvars4.4,
     family = binomial(),
     prior = prior4.4,
     prob = prob4.4,
     type = "PA",
     xopt = des4.4[[1]]$x,
     wopt = des4.4[[1]]$w,
     x = des4.4[[3]]$x,
     w = des4.4[[3]]$w)

beff(formula = formula4.4,
     predvars = predvars4.4,
     parvars = parvars4.4,
     family = binomial(),
     prior = prior4.4,
     prob = prob4.4,
     type = "PA",
     xopt = des4.4[[1]]$x,
     wopt = des4.4[[1]]$w,
     x = des4.4[[4]]$x,
     w = des4.4[[4]]$w)

beff(formula = formula4.4,
     predvars = predvars4.4,
     parvars = parvars4.4,
     family = binomial(),
     prior = prior4.4,
     prob = prob4.4,
     type = "PA",
     xopt = des4.4[[1]]$x,
     wopt = des4.4[[1]]$w,
     x = des4.4[[5]]$x,
     w = des4.4[[5]]$w)








