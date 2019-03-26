library(qpcR)


### Name: pcrsim
### Title: Simulation of sigmoidal qPCR data with goodness-of-fit analysis
### Aliases: pcrsim
### Keywords: models nonlinear

### ** Examples

## Generate initial model.
m1 <- pcrfit(reps, 1, 2, l4)

## Simulate homoscedastic error
## and test l4 and l5 on data.
res1 <- pcrsim(m1, error = 0.2, nsim = 20, 
               fitmodel = list(l4, l5))

## Not run: 
##D ## Use heteroscedastic noise typical for 
##D ## qPCR: more noise at lower fluorescence.
##D res2 <- pcrsim(m1, error = 0.01, errfun = function(y) 1/y,
##D               nsim = 20, fitmodel = list(l4, l5, l6))
##D 
##D ## Get 95% confidence interval for 
##D ## the models GOF in question (l4, l5, l6).
##D res3 <- pcrsim(m1, error = 0.2, nsim = 20, fitmodel = list(l4, l5, l6),
##D               statfun = function(y) quantile(y, c(0.025, 0.975)))
##D res3$statList  
##D 
##D ## Count the selection of the 'true' model (l4)
##D ## for each of the GOF measures,
##D ## use PRESS statistic => SLOW!
##D ## BIC wins!!
##D res4 <- pcrsim(m1, error = 0.05, nsim = 10, fitmodel = list(l4, l5, l6),
##D                select = TRUE, PRESS = TRUE)
##D apply(res4$modelMat, 2, function(x) sum(x == 1))
## End(Not run) 



