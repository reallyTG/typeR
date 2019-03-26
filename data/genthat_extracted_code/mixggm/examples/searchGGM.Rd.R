library(mixggm)


### Name: searchGGM
### Title: Structure search and estimation for Gaussian graphical models
### Aliases: searchGGM

### ** Examples


# fit covariance graph model with default forward-stepwise search
data(mtcars)
x <- mtcars[,c(1,3:7)]
mod1 <- searchGGM(x, model = "covariance")
mod1
plot(mod1)
#
# prefer a sparser model
mod2 <- searchGGM(x, model = "covariance", penalty = "ebic")
mod2
plot(mod2)


# fit concentration graph model with backward-stepwise structure search
# with a covariance matrix in input
data(ability.cov)
mod3 <- searchGGM(S = ability.cov$cov, N = ability.cov$n.obs,
                  model = "concentration", search = "step-back")
mod3
mod3$graph
mod3$omega
plot(mod3)

## Not run: 
##D 
##D # generate data from a Markov model
##D N <- 1000
##D V <- 20
##D dat <- matrix(NA, N, V)
##D dat[,1] <- rnorm(N)
##D for ( j in 2:V ) dat[,j] <- dat[,j-1] + rnorm(N, sd = 0.5)
##D mod4 <- searchGGM(data = dat, model = "concentration")        # recover the model
##D plot(mod4, what = "adjacency")
##D 
## End(Not run)



