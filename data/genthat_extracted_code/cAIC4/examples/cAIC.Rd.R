library(cAIC4)


### Name: cAIC
### Title: Conditional Akaike Information for 'lme4'
### Aliases: cAIC
### Keywords: regression

### ** Examples


### Three application examples
b <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
cAIC(b)

b2 <- lmer(Reaction ~ (1 | Days) + (1 | Subject), sleepstudy)
cAIC(b2)

b2ML <- lmer(Reaction ~ (1 + Days | Subject), sleepstudy, REML = FALSE)
cAIC(b2ML)

### Demonstration of boundary case
## Not run: 
##D set.seed(2017-1-1)
##D n <- 50
##D beta <- 2
##D x <- rnorm(n)
##D eta <- x*beta
##D id <- gl(5,10)
##D epsvar <- 1
##D data <- data.frame(x = x, id = id)
##D y_wo_bi <- eta + rnorm(n, 0, sd = epsvar) 
##D 
##D # use a very small RE variance
##D ranvar <- 0.05
##D nrExperiments <- 100
##D 
##D sim <- sapply(1:nrExperiments, function(j){
##D 
##D b_i <- scale(rnorm(5, 0, ranvar), scale = FALSE)
##D y <- y_wo_bi + model.matrix(~ -1 + id) %*% b_i
##D data$y <- y
##D 
##D mixedmod <- lmer(y ~ x + (1 | id), data = data)
##D linmod <- lm(y ~ x, data = data)
##D 
##D c(cAIC(mixedmod)$caic, cAIC(linmod)$caic)
##D })
##D 
##D rownames(sim) <- c("mixed model", "linear model")
##D 
##D boxplot(t(sim))
##D 
##D 
## End(Not run)





