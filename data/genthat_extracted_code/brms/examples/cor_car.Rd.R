library(brms)


### Name: cor_car
### Title: Spatial conditional autoregressive (CAR) structures
### Aliases: cor_car cor_icar

### ** Examples

## Not run: 
##D # generate some spatial data
##D east <- north <- 1:10
##D Grid <- expand.grid(east, north)
##D K <- nrow(Grid)
##D 
##D # set up distance and neighbourhood matrices
##D distance <- as.matrix(dist(Grid))
##D W <- array(0, c(K, K))
##D W[distance == 1] <- 1 	
##D 
##D # generate the covariates and response data
##D x1 <- rnorm(K)
##D x2 <- rnorm(K)
##D theta <- rnorm(K, sd = 0.05)
##D phi <- rmulti_normal(
##D   1, mu = rep(0, K), Sigma = 0.4 * exp(-0.1 * distance)
##D )
##D eta <- x1 + x2 + phi
##D prob <- exp(eta) / (1 + exp(eta))
##D size <- rep(50, K)
##D y <- rbinom(n = K, size = size, prob = prob)
##D dat <- data.frame(y, size, x1, x2)
##D 
##D # fit a CAR model
##D fit <- brm(y | trials(size) ~ x1 + x2, data = dat, 
##D            family = binomial(), autocor = cor_car(W)) 
##D summary(fit)
## End(Not run)




