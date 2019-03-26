library(BayesBD)


### Name: lebesgueError
### Title: Lebesgue Error of boundary estimate
### Aliases: lebesgueError

### ** Examples

set.seed(12345)
gamma.fun = ellipse(a = 0.35, b = 0.25)
norm.obs = parnormobs(m = 100, mu.in = 4, mu.out = 1, sd.in = 1.5, sd.out = 1, design = 'J',
 center = c(0.5,0.5), gamma.fun)
## Not run: 
##D norm.samp = fitContImage(norm.obs, NULL,NULL,.4, 1000, 0, 10,"I","I",rep(1,10000), FALSE, FALSE)
##D par(mfrow = c(1,3))
##D plotBD(norm.samp, 1)
##D plotBD(norm.samp, 2)
##D plotBD(norm.samp, 3)
##D lebesgueError(norm.samp)
## End(Not run)



