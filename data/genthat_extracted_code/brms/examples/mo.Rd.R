library(brms)


### Name: mo
### Title: Monotonic Predictors in 'brms' Models
### Aliases: mo mono monotonic

### ** Examples

  
## Not run: 
##D # generate some data
##D income_options <- c("below_20", "20_to_40", "40_to_100", "greater_100")
##D income <- factor(sample(income_options, 100, TRUE), 
##D                  levels = income_options, ordered = TRUE)
##D mean_ls <- c(30, 60, 70, 75)
##D ls <- mean_ls[income] + rnorm(100, sd = 7)
##D dat <- data.frame(income, ls)
##D 
##D # fit a simple monotonic model
##D fit1 <- brm(ls ~ mo(income), data = dat)
##D 
##D # summarise the model
##D summary(fit1)
##D plot(fit1, N = 6)
##D plot(marginal_effects(fit1), points = TRUE)
##D 
##D # model interaction with other variables
##D dat$x <- sample(c("a", "b", "c"), 100, TRUE)
##D fit2 <- brm(ls ~ mo(income)*x, data = dat)
##D 
##D # summarise the model
##D summary(fit2)
##D plot(marginal_effects(fit2), points = TRUE)
## End(Not run) 
 



