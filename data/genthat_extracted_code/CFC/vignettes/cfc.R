### R code from vignette source 'cfc.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: cfc.Rnw:96-97
###################################################
options(prompt = "R> ", continue = "+  ", width = 80, useFancyQuotes = FALSE)


###################################################
### code chunk number 2: cfc.Rnw:285-294 (eval = FALSE)
###################################################
## library("CFC")
## data("bmt")
## rel.tol <- 1e-3
## seed.no <- 0
## set.seed(seed.no)
## idx.train <- sample(1:nrow(bmt), size = 0.7 * nrow(bmt))
## idx.pred <- setdiff(1:nrow(bmt), idx.train)
## nobs.train <- length(idx.train)
## nobs.pred <- length(idx.pred)


###################################################
### code chunk number 3: cfc.Rnw:297-299 (eval = FALSE)
###################################################
## out.weib <- cfc.survreg(Surv(time, cause) ~ platelet + age + tcell, 
##   bmt[idx.train, ], bmt[idx.pred, ], rel.tol = rel.tol)


###################################################
### code chunk number 4: cfc.Rnw:302-303 (eval = FALSE)
###################################################
## summ <- summary(out.weib, obs.idx = which(bmt$age[idx.pred] > 0))


###################################################
### code chunk number 5: cfc.Rnw:306-307 (eval = FALSE)
###################################################
## plot(summ, which = 1)


###################################################
### code chunk number 6: cfc.Rnw:318-319 (eval = FALSE)
###################################################
## old.par <- par(mfrow=c(1,2)); plot(summ, which = 2); par(old.par)


###################################################
### code chunk number 7: cfc.Rnw:331-334 (eval = FALSE)
###################################################
## out.expo <- cfc.survreg(Surv(time, cause) ~ platelet + age + tcell, 
##   bmt[idx.train, ], bmt[idx.pred, ],
##   dist = "exponential", rel.tol = rel.tol)


###################################################
### code chunk number 8: cfc.Rnw:337-340 (eval = FALSE)
###################################################
## out.mix <- cfc.survreg(Surv(time, cause) ~ platelet + age + tcell, 
##   bmt[idx.train, ], bmt[idx.pred, ],
##   dist = c("weibull", "exponential"), rel.tol = rel.tol)


###################################################
### code chunk number 9: cfc.Rnw:347-352 (eval = FALSE)
###################################################
## out.prep <- cfc.prepdata(Surv(time, cause) ~ platelet + age + tcell, bmt)
## f1 <- out.prep$formula.list[[1]]
## f2 <- out.prep$formula.list[[2]]
## dat <- out.prep$dat
## tmax <- out.prep$tmax


###################################################
### code chunk number 10: cfc.Rnw:355-365 (eval = FALSE)
###################################################
## library("BSGW")
## seed.no <- 0
## set.seed(seed.no)
## nsmp <- 10
## reg1 <- bsgw(f1, dat[idx.train, ],
##   control = bsgw.control(iter = nsmp),
##   ordweib = T, print.level = 0)
## reg2 <- bsgw(f2, dat[idx.train, ], 
##   control = bsgw.control(iter = nsmp),
##   ordweib = T, print.level = 0)


###################################################
### code chunk number 11: cfc.Rnw:368-386 (eval = FALSE)
###################################################
## survfunc <- function(t, args, n) {
##   nobs <- args$nobs; natt <- args$natt; nsmp <- args$nsmp
##   alpha <- args$alpha; beta <- args$beta; X <- args$X
##   idx.smp <- floor((n - 1) / nobs) + 1
##   idx.obs <- n - (idx.smp - 1) * nobs
##   return (exp(- t ^ alpha[idx.smp] * 
##                 exp(sum(X[idx.obs, ] * 
##                           beta[idx.smp, ]))));
## }
## f.list <- list(survfunc, survfunc)
## X.pred <- as.matrix(cbind(1, bmt[idx.pred, c("platelet", "age", "tcell")]))
## arg.1 <- list(nobs = nobs.pred, natt = 4, nsmp = nsmp,
##   X = X.pred, alpha = exp(reg1$smp$betas),
##   beta = reg1$smp$beta)
## arg.2 <- list(nobs = nobs.pred, natt = 4, nsmp = nsmp, 
##   X = X.pred, alpha = exp(reg2$smp$betas), 
##   beta = reg2$smp$beta)
## arg.list <- list(arg.1, arg.2)


###################################################
### code chunk number 12: cfc.Rnw:389-396 (eval = FALSE)
###################################################
## rel.tol <- 1e-4
## tout <- seq(from = 0.0, to = tmax, length.out = 10)
## t.R <- proc.time()[3]
## out.cfc.R <- cfc(f.list, arg.list, nobs.pred * nsmp, tout,
##   rel.tol = rel.tol)
## t.R <- proc.time()[3] - t.R
## cat("t.R:", t.R, "sec\n")


###################################################
### code chunk number 13: cfc.Rnw:398-400
###################################################
t.R <- readRDS("t_R.rds")
cat("t.R:", t.R, "sec\n")


###################################################
### code chunk number 14: cfc.Rnw:406-409 (eval = FALSE)
###################################################
## my.f.reduce <- function(x, nobs, nsmp) {
##   return (colMeans(array(x, dim = c(nobs, nsmp))))
## }


###################################################
### code chunk number 15: cfc.Rnw:412-418 (eval = FALSE)
###################################################
## my.cfc.summ <- summary(
##   out.cfc.R, f.reduce = my.f.reduce
##   , nobs = nobs.pred, nsmp = nsmp)
## oldpar <- par(mfrow = c(2, 2))
## plot(my.cfc.summ)
## par(oldpar)


###################################################
### code chunk number 16: cfc.Rnw:428-435 (eval = FALSE)
###################################################
## ncores <- 2
## tout <- seq(from = 0.0, to = tmax, length.out = 10)
## t.R.par <- proc.time()[3]
## out.cfc.R.par <- cfc(f.list, arg.list, nobs.pred * nsmp, tout,
##   rel.tol = rel.tol, ncores = ncores)
## t.R.par <- proc.time()[3] - t.R.par
## cat("t.R.par:", t.R.par, "sec\n")


###################################################
### code chunk number 17: cfc.Rnw:437-438
###################################################
t.R.par <- readRDS("t_R_par.rds")


###################################################
### code chunk number 18: cfc.Rnw:441-442
###################################################
cat("parallelization speedup - R:", t.R / t.R.par, "\n")


###################################################
### code chunk number 19: cfc.Rnw:510-521 (eval = FALSE)
###################################################
## tout <- seq(from = 0.0, to = tmax, length.out = 10)
## library("Rcpp")
## Rcpp::sourceCpp("weib.cpp")
## f.list.Cpp.1 <- list(weib_getPtr_func(), weib_getPtr_init(),
##   weib_getPtr_free())
## f.list.Cpp <- list(f.list.Cpp.1, f.list.Cpp.1)
## t.Cpp <- proc.time()[3]
## out.cfc.Cpp <- cfc(f.list.Cpp, arg.list, nobs.pred * nsmp, tout,
##   rel.tol = rel.tol)
## t.Cpp <- proc.time()[3] - t.Cpp
## cat("t.Cpp:", t.Cpp, "sec\n")


###################################################
### code chunk number 20: cfc.Rnw:523-525
###################################################
t.Cpp <- readRDS(file = "t_Cpp.rds")
cat("t.Cpp:", t.Cpp, "sec\n")


###################################################
### code chunk number 21: cfc.Rnw:528-529 (eval = FALSE)
###################################################
## all.equal(out.cfc.R, out.cfc.Cpp)


###################################################
### code chunk number 22: cfc.Rnw:531-534
###################################################
out.cfc.R <- readRDS(file = "out_cfc_R.rds")
out.cfc.Cpp <- readRDS(file = "out_cfc_Cpp.rds")
all.equal(out.cfc.R, out.cfc.Cpp)


###################################################
### code chunk number 23: cfc.Rnw:537-538
###################################################
cat("C++-vs-R speedup:", t.R / t.Cpp, "\n")


###################################################
### code chunk number 24: cfc.Rnw:541-560 (eval = FALSE)
###################################################
## nsmp <- 1000
## reg1 <- bsgw(f1, dat[idx.train, ],
##   control = bsgw.control(iter = nsmp),
##   ordweib = T, print.level = 0)
## reg2 <- bsgw(f2, dat[idx.train, ], 
##   control = bsgw.control(iter = nsmp),
##   ordweib = T, print.level = 0)
## arg.1 <- list(nobs = nobs.pred, natt = 4, nsmp = nsmp,
##   X = X.pred, alpha = exp(reg1$smp$betas),
##   beta = reg1$smp$beta)
## arg.2 <- list(nobs = nobs.pred, natt = 4, nsmp = nsmp, 
##   X = X.pred, alpha = exp(reg2$smp$betas), 
##   beta = reg2$smp$beta)
## arg.list <- list(arg.1, arg.2)
## t.Cpp.1000 <- proc.time()[3]
## out.cfc.Cpp.1000 <- cfc(f.list.Cpp, arg.list, nobs.pred * nsmp, tout,
##   rel.tol = rel.tol)
## t.Cpp.1000 <- proc.time()[3] - t.Cpp.1000
## cat("t.Cpp - 1000 samples", t.Cpp.1000, "sec\n")


###################################################
### code chunk number 25: cfc.Rnw:562-564
###################################################
t.Cpp.1000 <- readRDS(file = "t_Cpp_1000.rds")
cat("t.Cpp - 1000 samples", t.Cpp.1000, "sec\n")


###################################################
### code chunk number 26: cfc.Rnw:567-573 (eval = FALSE)
###################################################
## ncores <- 2
## t.Cpp.1000.par <- proc.time()[3]
## out.cfc.Cpp.1000.par <- cfc(f.list.Cpp, arg.list, nobs.pred * nsmp, tout,
##   rel.tol = rel.tol, ncores = ncores)
## t.Cpp.par.1000.par <- proc.time()[3] - t.Cpp.1000.par
## cat("t.Cpp.par - 1000 samples:", t.Cpp.1000.par, "sec\n")


###################################################
### code chunk number 27: cfc.Rnw:575-577
###################################################
t.Cpp.1000.par <- readRDS(file = "t_Cpp_1000_par.rds")
cat("t.Cpp.par - 1000 samples:", t.Cpp.1000.par, "sec\n")


###################################################
### code chunk number 28: cfc.Rnw:580-581
###################################################
cat("parallelization speedup - C++:", t.Cpp.1000 / t.Cpp.1000.par, "\n")


###################################################
### code chunk number 29: cfc.Rnw:590-595 (eval = FALSE)
###################################################
## prep <- cfc.prepdata(Surv(time, cause) ~ platelet + age + tcell, bmt)
## f1 <- prep$formula.list[[1]]
## f2 <- prep$formula.list[[2]]
## dat <- prep$dat
## tmax <- prep$tmax


###################################################
### code chunk number 30: cfc.Rnw:598-600 (eval = FALSE)
###################################################
## library("survival")
## reg1 <- survreg(f1, dat, x = TRUE)


###################################################
### code chunk number 31: cfc.Rnw:603-611 (eval = FALSE)
###################################################
## library("randomForestSRC")
## reg2 <- rfsrc(f2, dat)
## rfsrc.survfunc <- function(t, args, n) {
##   which.zero <- which(t < .Machine$double.eps)
##   ret <- approx(args$time.interest, args$survival[n, ], t, rule = 2)$y
##   ret[which.zero] <- 1.0
##   return (ret)
## }


###################################################
### code chunk number 32: cfc.Rnw:614-618 (eval = FALSE)
###################################################
## f.list <- list(cfc.survreg.survprob, rfsrc.survfunc)
## arg.list <- list(reg1, reg2)
## tout <- seq(0.0, tmax, length.out = 10)
## cfc.out <- cfc(f.list, arg.list, nrow(bmt), tout, rel.tol = 1e-3)


###################################################
### code chunk number 33: cfc.Rnw:677-678 (eval = FALSE)
###################################################
## sessionInfo()


###################################################
### code chunk number 34: cfc.Rnw:680-682
###################################################
my.session <- readRDS(file = "session_info.RDS")
print(my.session)


