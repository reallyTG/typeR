library(GDINA)


### Name: plot.GDINA
### Title: Create plots for GDINA estimates
### Aliases: plot.GDINA

### ** Examples

## Not run: 
##D dat <- sim10GDINA$simdat
##D Q <- sim10GDINA$simQ
##D mod1 <- GDINA(dat = dat, Q = Q, model = "GDINA")
##D #plot item response functions for item 10
##D plot(mod1, item = 10)
##D plot(mod1, what = "IRF", item = 10,withSE = TRUE)
##D 
##D # plot mastery probabilities for individuals 4 and 10
##D plot(mod1, what = "mp", person = c(4,10))
##D plot(mod1, what = "mp", person = c(4,10,15),
##D att.names = c("addition","subtraction","multiplication"))
## End(Not run)



