library(dclone)


### Name: bugs.parfit
### Title: Parallel computing with WinBUGS/OpenBUGS
### Aliases: bugs.parfit
### Keywords: models

### ** Examples

## Not run: 
##D ## fitting with WinBUGS, bugs example
##D if (require(R2WinBUGS)) {
##D data(schools)
##D dat <- list(J = nrow(schools),
##D     y = schools$estimate,
##D     sigma.y = schools$sd)
##D bugs.model <- function(){
##D        for (j in 1:J){
##D          y[j] ~ dnorm (theta[j], tau.y[j])
##D          theta[j] ~ dnorm (mu.theta, tau.theta)
##D          tau.y[j] <- pow(sigma.y[j], -2)
##D        }
##D        mu.theta ~ dnorm (0.0, 1.0E-6)
##D        tau.theta <- pow(sigma.theta, -2)
##D        sigma.theta ~ dunif (0, 1000)
##D      }
##D param <- c("mu.theta", "sigma.theta")
##D SEED <- floor(runif(3, 100000, 999999))
##D cl <- makePSOCKcluster(3)
##D if (.Platform$OS.type == "windows") {
##D sim <- bugs.parfit(cl, dat, param, bugs.model, seed=SEED)
##D summary(sim)
##D }
##D dat2 <- dclone(dat, 2, multiply="J")
##D if (.Platform$OS.type == "windows") {
##D sim2 <- bugs.parfit(cl, dat2, param, bugs.model,
##D     program="winbugs", n.iter=2000, n.thin=1, seed=SEED)
##D summary(sim2)
##D }
##D }
##D if (require(BRugs)) {
##D ## fitting the model with OpenBUGS
##D ## using the less preferred BRugs interface
##D sim3 <- bugs.parfit(cl, dat2, param, bugs.model,
##D     program="brugs", n.iter=2000, n.thin=1, seed=1:3)
##D summary(sim3)
##D }
##D if (require(R2OpenBUGS)) {
##D ## fitting the model with OpenBUGS
##D ## using the preferred R2OpenBUGS interface
##D sim4 <- bugs.parfit(cl, dat2, param, bugs.model,
##D     program="openbugs", n.iter=2000, n.thin=1, seed=1:3)
##D summary(sim4)
##D }
##D stopCluster(cl)
##D ## multicore type forking
##D if (require(R2OpenBUGS) && .Platform$OS.type != "windows") {
##D sim7 <- bugs.parfit(3, dat2, param, bugs.model,
##D     program="openbugs", n.iter=2000, n.thin=1, seed=1:3)
##D summary(sim7)
##D }
## End(Not run)



