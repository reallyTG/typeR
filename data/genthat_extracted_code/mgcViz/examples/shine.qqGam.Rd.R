library(mgcViz)


### Name: shine.qqGam
### Title: Shiny QQ-plots for GAMs
### Aliases: shine.qqGam

### ** Examples

## Not run: 
##D 
##D ## simulate binomial data...
##D library(mgcv)
##D library(mgcViz)
##D set.seed(0)
##D n.samp <- 400
##D dat <- gamSim(1,n = n.samp, dist = "binary", scale = .33)
##D p <- binomial()$linkinv(dat$f) ## binomial p
##D n <- sample(c(1, 3), n.samp, replace = TRUE) ## binomial n
##D dat$y <- rbinom(n, n, p)
##D dat$n <- n
##D lr.fit <- gam(y/n ~ s(x0) + s(x1) + s(x2) + s(x3)
##D               , family = binomial, data = dat,
##D               weights = n, method = "REML")
##D lr.fit <- getViz(lr.fit)
##D # launch shiny gagdet
##D shine(qq(lr.fit))
##D  
## End(Not run)




