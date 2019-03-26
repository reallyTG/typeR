library(CFC)


### Name: summary.cfc
### Title: Summarizing and plotting output of 'cfc'
### Aliases: summary.cfc plot.summary.cfc

### ** Examples

## Not run: 
##D 
##D library("BSGW") # used for Bayesian survival regression
##D 
##D data(bmt)
##D # splitting data into training and prediction sets
##D idx.train <- sample(1:nrow(bmt), size = 0.7 * nrow(bmt))
##D idx.pred <- setdiff(1:nrow(bmt), idx.train)
##D nobs.train <- length(idx.train)
##D nobs.pred <- length(idx.pred)
##D 
##D # prepare data and formula for Bayesian cause-specific survival regression
##D # using R package BSGW
##D out.prep <- cfc.prepdata(Surv(time, cause) ~ platelet + age + tcell, bmt)
##D f1 <- out.prep$formula.list[[1]]
##D f2 <- out.prep$formula.list[[2]]
##D dat <- out.prep$dat
##D tmax <- out.prep$tmax
##D 
##D # estimating cause-specific models
##D # set nsmp to larger number in real-world applications
##D nsmp <- 10
##D reg1 <- bsgw(f1, dat[idx.train, ], control = bsgw.control(iter = nsmp)
##D   , ordweib = T, print.level = 0)
##D reg2 <- bsgw(f2, dat[idx.train, ], control = bsgw.control(iter = nsmp)
##D   , ordweib = T, print.level = 0)
##D 
##D # defining survival function for this model
##D survfunc <- function(t, args, n) {
##D   nobs <- args$nobs; natt <- args$natt; nsmp <- args$nsmp
##D   alpha <- args$alpha; beta <- args$beta; X <- args$X
##D   idx.smp <- floor((n - 1) / nobs) + 1
##D   idx.obs <- n - (idx.smp - 1) * nobs
##D   return (exp(- t ^ alpha[idx.smp] * 
##D                 exp(sum(X[idx.obs, ] * beta[idx.smp, ]))));
##D }
##D 
##D # preparing function and argument lists
##D X.pred <- as.matrix(cbind(1, bmt[idx.pred, c("platelet", "age", "tcell")]))
##D arg.1 <- list(nobs = nobs.pred, natt = 4, nsmp = nsmp
##D   , alpha = exp(reg1$smp$betas), beta = reg1$smp$beta, X = X.pred)
##D arg.2 <- list(nobs = nobs.pred, natt = 4, nsmp = nsmp
##D   , alpha = exp(reg2$smp$betas), beta = reg2$smp$beta, X = X.pred)
##D arg.list <- list(arg.1, arg.2)
##D f.list <- list(survfunc, survfunc)
##D 
##D # cause-specific competing-risk
##D # set rel.tol to smaller number in real-world applications
##D out.cfc <- cfc(f.list, arg.list, nobs.pred * nsmp, tout, rel.tol = 1e-2)
##D 
##D # summarizing (and plotting) the results
##D # this function calculates the population-average CI and survival, one
##D # per each MCMC sample; therefore, the quantiles produced by the summary
##D # method, correspondingly, reflect our confidence in population-average values
##D my.f.reduce <- function(x, nobs, nsmp) {
##D   return (colMeans(array(x, dim = c(nobs, nsmp))))
##D }
##D my.summ <- summary(out.cfc, f.reduce = my.f.reduce, nobs = nobs.pred, nsmp = nsmp)
##D 
## End(Not run)



