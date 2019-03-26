# context("ghq_fixed")
# #############################################
# 
# # method: gauss-hermite quadrature
# # models: no-random effects
# # covariance: no-random effects
# 
# # GAUSSIAN
# ###############################################################################
# # basic model with no covariates
# test_that("Test 1.1", {
#   lmmodel <- lm(y ~ 1,data=data_lintrt)
#   lmres <- c(lmmodel$coeff,log(stats::sigma(lmmodel)),logLik(lmmodel))
#   names(lmres) <- NULL
#   comp <- rep(0,length(lmres))
#   mod <- merlin(model=list(y ~ 1),
#                 ip=15,
#                 family="gaussian",
#                 data=data_lintrt)
#   expect_equal((abs(mod$checkcode-lmres)/(abs(lmres)+1)),comp,tolerance=1e-2)
#   expect_is(mod, "merlin")
# })
# 
# # add in covariates
# test_that("Test 1.2", {
#   lmmodel <- lm(y ~ x + trt,data=data_lintrt)
#   lmres <- c(lmmodel$coeff,log(stats::sigma(lmmodel)),logLik(lmmodel))
#   names(lmres) <- NULL
#   comp <- rep(0,length(lmres))
#   mod <- merlin(model=list(y ~ x + trt),
#                 ip=15,
#                 family="gaussian",
#                 data=data_lintrt)
#   merlinres <- c(mod$coefftable[3,1],mod$coefftable[1:2,1],mod$coefftable[4,1],mod$loglikelihood)
#   names(merlinres) <- NULL
#   expect_equal((abs(merlinres-lmres)/(abs(lmres)+1)),comp,tolerance=1e-2)
#   expect_is(mod, "merlin")
# })
# 
# # use log of variable
# test_that("Test 1.3", {
#   data_lintrt$x <- data_lintrt$x + 0.001
#   data_lintrt$logx <- log(data_lintrt$x)
#   lmmodel <- lm(y ~ logx + trt,data=data_lintrt)
#   lmres <- c(lmmodel$coeff,log(stats::sigma(lmmodel)),logLik(lmmodel))
#   names(lmres) <- NULL
#   comp <- rep(0,length(lmres))
#   mod <- merlin(model=list(y ~ fp(x,powers=c(0)) + trt),
#                 ip=15,timevar="x",
#                 family="gaussian",
#                 data=data_lintrt)
#   merlinres <- c(mod$coefftable[3,1],mod$coefftable[1:2,1],mod$coefftable[4,1],mod$loglikelihood)
#   names(merlinres) <- NULL
#   expect_equal((abs(merlinres-lmres)/(abs(lmres)+1)),comp,tolerance=1e-2)
#   expect_is(mod, "merlin")
# })
# data_lintrt$x <- data_lintrt$x - 0.001
# 
# 
# # BERNOULLI
# ###############################################################################
# test_that("Test 2.1", {
#   gmlmod <- glm(y1 ~ y2,family="binomial",data=data_bern)
#   gmlres <- c(gmlmod$coefficients,logLik(gmlmod))
#   names(gmlres) <- NULL
#   comp <- rep(0,length(gmlres))
#   mod <- merlin(model=list(y1 ~ y2),
#                 ip=15,
#                 family="bernoulli",
#                 covariance="identity",
#                 data=data_bern)
#   merlinres <- c(mod$coefftable[2,1],mod$coefftable[1,1],mod$loglikelihood)
#   names(merlinres) <- NULL
#   expect_equal((abs(merlinres-gmlres)/(abs(gmlres)+1)),comp,tolerance=1e-2)
# })
# 
# 
# # EXPONENTIAL
# ###############################################################################
# test_that("Test 8.1", {
#   survmod <- survival::survreg(survival::Surv(stime,status) ~ trt,data=data_surv3,dist="exponential")
#   survres <- c(-survmod$coefficients,logLik(survmod))
#   names(survres) <- NULL
#   comp <- rep(0,length(survres))
#   mod <- merlin(model=list(Surv(stime,status) ~ trt),
#                 ip=15,
#                 family="exponential",
#                 covariance="identity",
#                 data=data_surv3)
#   merlinres <- c(mod$coefftable[2,1],mod$coefftable[1,1],mod$loglikelihood)
#   names(merlinres) <- NULL
#   expect_equal((abs(merlinres-survres)/(abs(survres)+1)),comp,tolerance=1e-2)
# })
# 
# 
# # EXPONENTIAL
# ###############################################################################
# test_that("Test 11.1", {
#   survmod <- survival::survreg(survival::Surv(stime,status) ~ trt,data=data_surv3,dist="weibull")
#   survres <- c(-survmod$coefficient*(1/(survmod$scale)),-log(survmod$scale),logLik(survmod))
#   names(survres) <- NULL
#   comp <- rep(0,length(survres))
#   mod <- merlin(model=list(surv(stime,status) ~ trt),
#                 ip=5,
#                 family="weibull",
#                 covariance="identity",
#                 data=data_surv3)
#   merlinres <- c(mod$coefftable[2,1],mod$coefftable[1,1],mod$coefftable[3,1],mod$loglikelihood)
#   names(merlinres) <- NULL
#   expect_equal((abs(merlinres-survres)/(abs(survres)+1)),comp,tolerance=1e-2)
# })
# 
# 
# # GAUSSIAN - GAUSSIAN
# ###############################################################################
# test_that("Test 14.1", {
#   lmmodel <- lm(logp ~ trt,data=data_jm)
#   lmres1 <- c(lmmodel$coeff,log(stats::sigma(lmmodel)),logLik(lmmodel))
#   lmmodel <- lm(logb ~ trt,data=data_jm)
#   lmres2 <- c(lmmodel$coeff,log(stats::sigma(lmmodel)),logLik(lmmodel))
#   lmres <- c(lmres1[1:3],lmres2[1:3],lmres1[4]+lmres2[4])
#   names(lmres) <- NULL
#   comp <- rep(0,length(lmres))
#   data_jm$trt <- as.numeric(data_jm$trt) - 1
#   mod <- merlin(model=list(logp ~ trt,
#                            logb ~ trt),
#                 ip=25,
#                 family=c("gaussian","gaussian"),
#                 covariance="identity",
#                 data=data_jm)
#   merlinres <- c(mod$coefftable[c(2,1,3,5,4,6),1],mod$loglikelihood)
#   names(merlinres) <- NULL
#   expect_equal((abs(merlinres-lmres)/(abs(lmres)+1)),comp,tolerance=1e-2)
# })
# 
