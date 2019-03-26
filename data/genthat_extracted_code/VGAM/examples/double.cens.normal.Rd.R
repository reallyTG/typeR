library(VGAM)


### Name: double.cens.normal
### Title: Univariate Normal Distribution with Double Censoring
### Aliases: double.cens.normal
### Keywords: models regression

### ** Examples
## Not run: 
##D  # Repeat the simulations described in Harter and Moore (1966)
##D SIMS <- 100  # Number of simulations (change this to 1000)
##D mu.save <- sd.save <- rep(NA, len = SIMS)
##D r1 <- 0; r2 <- 4; nn <- 20
##D for (sim in 1:SIMS) {
##D   y <- sort(rnorm(nn))
##D   y <- y[(1+r1):(nn-r2)]  # Delete r1 smallest and r2 largest
##D   fit <- vglm(y ~ 1, double.cens.normal(r1 = r1, r2 = r2))
##D   mu.save[sim] <- predict(fit)[1, 1]
##D   sd.save[sim] <- exp(predict(fit)[1, 2])  # Assumes a log link and ~ 1
##D }
##D c(mean(mu.save), mean(sd.save))  # Should be c(0,1)
##D c(sd(mu.save), sd(sd.save))
## End(Not run)

# Data from Sarhan and Greenberg (1962); MLEs are mu = 9.2606, sd = 1.3754
strontium90 <- data.frame(y = c(8.2, 8.4, 9.1, 9.8, 9.9))
fit <- vglm(y ~ 1, double.cens.normal(r1 = 2, r2 = 3, isd = 6),
            data = strontium90, trace = TRUE)
coef(fit, matrix = TRUE)
Coef(fit)



