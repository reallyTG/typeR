library(R2MLwiN)


### Name: height
### Title: Height data.
### Aliases: height
### Keywords: datasets

### ** Examples

## Not run: 
##D # from demo(UserGuide16)
##D 
##D data(height, package = "R2MLwiN")
##D summary(height)
##D 
##D hist(height$height)
##D 
##D 1 - pnorm((200 - mean(height$height)) / sd(height$height))
##D 
##D heightsim1 <- function() {
##D   heightsim <- 175.35 + 10.002 * qnorm(runif(100))
##D   c(pmean = mean(heightsim), pvar = var(heightsim))
##D }
##D 
##D set.seed(1)
##D 
##D # Note: To obtain estimates as close as possible to the MLwiN manual,
##D # increase the number of reps to 10000.
##D 
##D simdata1 <- as.data.frame(t(replicate(1000, heightsim1())))
##D simdata1$iteration <- 1:nrow(simdata1)
##D 
##D plot(simdata1$iteration, simdata1$pmean, type = "l")
##D 
##D plot(density(simdata1$pmean))
##D 
##D quantile(simdata1$pmean, c(0.025, 0.975))
##D 
##D plot(simdata1$iteration, simdata1$pvar, type = "l")
##D 
##D plot(density(simdata1$pvar))
##D 
##D quantile(simdata1$pvar, c(0.025, 0.975))
##D 
##D heightsim2 <- function(variable) {
##D   samp <- sample(variable, replace = TRUE)
##D   c(npmean = mean(samp), npvar = var(samp))
##D }
##D 
##D simdata2 <- as.data.frame(t(replicate(1000, heightsim2(height$height))))
##D simdata2$iteration <- 1:nrow(simdata2)
##D 
##D plot(simdata2$iteration, simdata2$npmean, type = "l")
##D 
##D plot(density(simdata2$npmean))
##D 
##D quantile(simdata2$npmean, c(0.025, 0.975))
##D 
##D plot(simdata2$iteration, simdata2$npvar, type = "l")
##D 
##D plot(density(simdata2$npvar))
##D 
##D quantile(simdata2$npvar, c(0.025, 0.975))
## End(Not run)



