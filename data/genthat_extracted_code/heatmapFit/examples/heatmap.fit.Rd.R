library(heatmapFit)


### Name: heatmap.fit
### Title: Heatmap Fit Statistic for Binary Dependent Variable Models
### Aliases: heatmap.fit

### ** Examples

## Not run: 
##D ## a correctly specified model
##D ###############################
##D 
##D set.seed(123456)
##D x <- runif(20000)
##D y <- as.numeric( runif(20000) < pnorm(2*x - 1) )
##D mod <- glm( y ~ x, family=binomial(link="probit"))
##D pred <- predict(mod, type="response")
##D 
##D heatmap.fit(y, pred, reps=1000)
##D 
##D ## out-of-sample prediction w/o bootstrap p-values
##D 
##D set.seed(654321)
##D x <- runif(1000)
##D y <- as.numeric( runif(1000) < pnorm(2*x - 1) )
##D pred <- predict(mod, type="response", newdata=data.frame(x))
##D 
##D heatmap.fit(y, pred, calc.boot=FALSE)
##D 
##D 
##D 
##D ## a misspecified model
##D ########################
##D 
##D set.seed(13579)
##D x <- runif(20000)
##D y <- as.numeric( runif(20000) < pnorm(sin(10*x)) )
##D mod <- glm( y ~ x, family=binomial(link="probit"))
##D pred <- predict(mod, type="response")
##D heatmap.fit(y, pred, reps=1000)
##D 
##D ## Comparison with and without data compression
##D 
##D system.time(heatmap.fit(y, pred, reps=100))
##D system.time(heatmap.fit(y, pred, reps=100, compress.obs=FALSE))
## End(Not run)




