library(DRR)


### Name: constructFastKRRLearner
### Title: Fast implementation for Kernel Ridge Regression.
### Aliases: constructFastKRRLearner

### ** Examples

ns <- noisySinc(1000)
nsTest <- noisySinc(1000)

fast.krr <- constructFastKRRLearner()
fast.p <- list(kernel="rbfdot", sigma=100, lambda=.1/getN(ns), nblocks = 4)
system.time(fast.m <- fast.krr$learn(ns, fast.p))
fast.pred <- fast.krr$predict(fast.m, nsTest)
sum((fast.pred - nsTest$y)^2) / getN(nsTest)

## Not run: 
##D krr <- CVST::constructKRRLearner()
##D p <- list(kernel="rbfdot", sigma=100, lambda=.1/getN(ns))
##D system.time(m <- krr$learn(ns, p))
##D pred <- krr$predict(m, nsTest)
##D sum((pred - nsTest$y)^2) / getN(nsTest)
##D 
##D plot(ns, col = '#00000030', pch = 19)
##D lines(sort(nsTest$x), fast.pred[order(nsTest$x)], col = '#00C000', lty = 2)
##D lines(sort(nsTest$x), pred[order(nsTest$x)], col = '#0000C0', lty = 2)
##D legend('topleft', legend = c('fast KRR', 'KRR'),
##D        col = c('#00C000', '#0000C0'), lty = 2)
## End(Not run)




