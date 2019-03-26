library(joineRML)


### Name: plot.ranef.mjoint
### Title: Plot a 'ranef.mjoint' object
### Aliases: plot.ranef.mjoint
### Keywords: methods

### ** Examples

## Not run: 
##D require(ggplot2)
##D data(heart.valve)
##D hvd <- heart.valve[!is.na(heart.valve$log.grad) & !is.na(heart.valve$log.lvmi), ]
##D set.seed(1)
##D 
##D fit1 <- mjoint(formLongFixed = log.lvmi ~ time,
##D     formLongRandom = ~ time | num,
##D     formSurv = Surv(fuyrs, status) ~ 1,
##D     data = hvd,
##D     timeVar = "time")
##D 
##D plot(ranef(fit1, postVar = TRUE))
## End(Not run)



