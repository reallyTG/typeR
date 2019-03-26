library(dclone)


### Name: bugs.fit
### Title: Fit BUGS models with cloned data
### Aliases: bugs.fit as.mcmc.list.bugs
### Keywords: models htest

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
##D inits <- function(){
##D     list(theta=rnorm(nrow(schools), 0, 100), mu.theta=rnorm(1, 0, 100),
##D          sigma.theta=runif(1, 0, 100))
##D }
##D param <- c("mu.theta", "sigma.theta")
##D if (.Platform$OS.type == "windows") {
##D sim <- bugs.fit(dat, param, bugs.model, inits)
##D summary(sim)
##D }
##D dat2 <- dclone(dat, 2, multiply="J")
##D if (.Platform$OS.type == "windows") {
##D sim2 <- bugs.fit(dat2, param, bugs.model, 
##D     program="winbugs", n.iter=2000, n.thin=1)
##D summary(sim2)
##D }
##D }
##D if (require(BRugs)) {
##D ## fitting the model with OpenBUGS
##D ## using the less preferred BRugs interface
##D sim3 <- bugs.fit(dat2, param, bugs.model, 
##D     program="brugs", n.iter=2000, n.thin=1)
##D summary(sim3)
##D }
##D if (require(R2OpenBUGS)) {
##D ## fitting the model with OpenBUGS
##D ## using the preferred R2OpenBUGS interface
##D sim4 <- bugs.fit(dat2, param, bugs.model, 
##D     program="openbugs", n.iter=2000, n.thin=1)
##D summary(sim4)
##D }
##D if (require(rjags)) {
##D ## fitting the model with JAGS
##D sim5 <- jags.fit(dat2, param, bugs.model)
##D summary(sim5)
##D }
## End(Not run)



