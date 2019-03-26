library(CPsurv)


### Name: cpsurv
### Title: Nonparametric Change Point Estimation
### Aliases: cpsurv

### ** Examples

data(survdata)
# estimate change point for survdata (random censored)
cp <- cpsurv(survdata$time, survdata$event, cpmax = 360, intwd = 20)
summary(cp)

## Not run: 
##D # estimation with parametric bootstrap bias correction
##D cp_param <- cpsurv(survdata$time, survdata$event, cpmax = 360, intwd = 20,
##D             biascorrect = TRUE, parametric = TRUE)
##D summary(cp_param)
##D 
##D # with bootstrap confidence intervals and parametric bootstrap bias
##D cp_ci <- cpsurv(survdata$time, survdata$event, cpmax = 360, intwd = 20,
##D biascorrect = TRUE, parametric = FALSE, boot.ci = TRUE, cores = 4, seed = 36020)
##D # runtime: approx. 180 min (with Intel(R) Core(TM) i7 CPU 950 @ 3.07GHz, 4 logical CPUs used)
## End(Not run)



