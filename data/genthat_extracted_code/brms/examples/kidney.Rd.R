library(brms)


### Name: kidney
### Title: Infections in kidney patients
### Aliases: kidney
### Keywords: datasets

### ** Examples

## Not run: 
##D ## performing surivival analysis using the "weibull" family
##D fit1 <- brm(time | cens(censored) ~ age + sex + disease, 
##D             data = kidney, family = weibull, inits = "0")
##D summary(fit1) 
##D plot(fit1)
##D 
##D ## adding random intercepts over patients
##D fit2 <- brm(time | cens(censored) ~ age + sex + disease + (1|patient), 
##D             data = kidney, family = weibull(), inits = "0",
##D             prior = set_prior("cauchy(0,2)", class = "sd"))
##D summary(fit2) 
##D plot(fit2)         
## End(Not run)




