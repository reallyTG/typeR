library(lfe)


### Name: felm
### Title: Fit a linear model with multiple group fixed effects
### Aliases: felm

### ** Examples


oldopts <- options(lfe.threads=1)
## create covariates
x <- rnorm(1000)
x2 <- rnorm(length(x))

## individual and firm
id <- factor(sample(20,length(x),replace=TRUE))
firm <- factor(sample(13,length(x),replace=TRUE))

## effects for them
id.eff <- rnorm(nlevels(id))
firm.eff <- rnorm(nlevels(firm))

## left hand side
u <- rnorm(length(x))
y <- x + 0.5*x2 + id.eff[id] + firm.eff[firm] + u

## estimate and print result
est <- felm(y ~ x+x2| id + firm)
summary(est)
## Not run: 
##D ## compare with lm
##D summary(lm(y ~ x + x2 + id + firm-1))
## End(Not run)

# make an example with 'reverse causation'
# Q and W are instrumented by x3 and the factor x4. Report robust s.e.
x3 <- rnorm(length(x))
x4 <- sample(12,length(x),replace=TRUE)

Q <- 0.3*x3 + x + 0.2*x2 + id.eff[id] + 0.3*log(x4) - 0.3*y + rnorm(length(x),sd=0.3)
W <- 0.7*x3 - 2*x + 0.1*x2 - 0.7*id.eff[id] + 0.8*cos(x4) - 0.2*y+ rnorm(length(x),sd=0.6)

# add them to the outcome
y <- y + Q + W

ivest <- felm(y ~ x + x2 | id+firm | (Q|W ~x3+factor(x4)))
summary(ivest,robust=TRUE)
condfstat(ivest)
## Not run: 
##D # compare with the not instrumented fit:
##D summary(felm(y ~ x + x2 +Q + W |id+firm))
## End(Not run)
options(oldopts)




