# context("ghq")
# #############################################
# # method: test gauss-hermite quadrature
#
# # GAUSSIAN
# ###############################################################################
# test_that("Test 1.1", {
#   lmemod <- lme(logb~1,random=~1|id,data=pbc.merlin)
#   lmemodres <- as.numeric(c(summary(lmemod)$tTable[1,1],log(as.numeric(VarCorr(lmemod)[c(2,1),2])),lmemod$logLik))
#   comp <- rep(0,length(lmemodres))
#   mod <- merlin(model=list(logb ~ M1[id]*1),
#                 ip=25,
#                 levels=c("id"),
#                 family="gaussian",
#                 data=pbc.merlin)
#   modres <- as.numeric(c(mod$coefftable[,1],mod$loglikelihood))
#   expect_equal((abs(modres-lmemodres)/(abs(lmemodres)+1)),comp,tolerance=5e-2)
# })
#
# test_that("Test 1.2a", {
#   lmemod <- lme(logp~year,random=~1|id,data=pbc.merlin)
#   lmemodres <- as.numeric(c(summary(lmemod)$tTable[c(2,1),1],log(as.numeric(VarCorr(lmemod)[c(2,1),2])),lmemod$logLik))
#   comp <- rep(0,length(lmemodres))
#   mod <- merlin(model=list(logp ~ year + M1[id]*1),
#                   ip=25,
#                   levels=c("id"),
#                   family="gaussian",
#                   data=pbc.merlin)
#   modres <- as.numeric(c(mod$coefftable[,1],mod$loglikelihood))
#   expect_equal((abs(modres-lmemodres)/(abs(lmemodres)+1)),comp,tolerance=1e-2)
# })
#
# test_that("Test 1.3a", {
#   lmemod <- lme(logb~year,random = list(id = pdDiag(~ year)),data=pbc.merlin)
#   lmemodres <- as.numeric(c(summary(lmemod)$tTable[c(2,1),1],log(as.numeric(VarCorr(lmemod)[c(3,1,2),2])),lmemod$logLik))
#   comp <- rep(0,length(lmemodres))
#   mod <- merlin(model=list(logb ~ year + M1[id]*1 + year:M2[id]*1),
#                   ip=9,
#                   levels=c("id"),
#                   family="gaussian",
#                   data=pbc.merlin)
#   modres <- as.numeric(c(mod$coefftable[,1],mod$loglikelihood))
#   expect_equal((abs(modres-lmemodres)/(abs(lmemodres)+1)),comp,tolerance=1e-1)
# })
#
# test_that("Test 1.3b", {
#   pbc.merlin$year_2 <- pbc.merlin$year^2
#   lmemod <- lme(logp ~ year + year_2,random=~1|id,data=pbc.merlin)
#   lmemodres <- as.numeric(c(summary(lmemod)$tTable[c(2,3,1),1],log(as.numeric(VarCorr(lmemod)[c(2,1),2])),lmemod$logLik))
#   comp <- rep(0,length(lmemodres))
#   mod <- merlin(model=list(logp ~ year + fp(year,powers=c(2)) + M1[id]*1),
#                   ip=11,
#                   timevar="year",
#                   levels=c("id"),
#                   family="gaussian",
#                   data=pbc.merlin)
#   modres <- as.numeric(c(mod$coefftable[,1],mod$loglikelihood))
#   expect_equal((abs(modres-lmemodres)/(abs(lmemodres)+1)),comp,tolerance=5e-2)
# })
#
# test_that("Test 1.4a", {
#   pbc.merlin$year <- pbc.merlin$year + 0.001
#   pbc.merlin$logyear <- log(pbc.merlin$year)
#   lmemod <- lme(logb ~ logyear,random=~1|id,data=pbc.merlin)
#   lmemodres <- as.numeric(c(summary(lmemod)$tTable[c(2,1),1],log(as.numeric(VarCorr(lmemod)[c(2,1),2])),lmemod$logLik))
#   comp <- rep(0,length(lmemodres))
#   mod <- merlin(model=list(logb ~ fp(year,powers=c(0)) + M1[id]*1),
#                   ip=41,
#                   levels=c("id"),
#                   family="gaussian",
#                   data=pbc.merlin)
#   modres <- as.numeric(c(mod$coefftable[,1],mod$loglikelihood))
#   expect_equal((abs(modres-lmemodres)/(abs(lmemodres)+1)),comp,tolerance=1e-2)
#   pbc.merlin$year <- pbc.merlin$year - 0.001
# })
#
# test_that("Test 1.4b", {
#   skip_on_cran()
#   pbc.merlin$year <- pbc.merlin$year + 0.001
#   pbc.merlin$logyear <- log(pbc.merlin$year)
#   lmemod <- lme(logb ~ logyear,random=list(id = pdDiag(~ logyear)),data=pbc.merlin)
#   lmemodres <- as.numeric(c(summary(lmemod)$tTable[c(2,1),1],log(as.numeric(VarCorr(lmemod)[c(3,1,2),2])),lmemod$logLik))
#   comp <- rep(0,length(lmemodres))
#   mod <- merlin(model=list(logb ~ fp(year,powers=c(0)) + M1[id]*1 + fp(year,powers=c(0)):M2[id]*1),
#                   ip=25,
#                   levels=c("id"),
#                   family="gaussian",
#                   data=pbc.merlin,
#                   timevar="year")
#   modres <- as.numeric(c(mod$coefftable[,1],mod$loglikelihood))
#   expect_equal((abs(modres-lmemodres)/(abs(lmemodres)+1)),comp,tolerance=5e-2)
#   pbc.merlin$year <- pbc.merlin$year - 0.001
# })
#
# test_that("Test 1.5a", {
#   statares <- c(.0124268,.0030361,-.0011979,.000164,2.368558,log(.0846013),log(.0711746),1802.8308)
#   comp <- rep(0,length(statares))
#   mod <- merlin(model=list(logp ~ rcs(year,df=4) + M1[id]*1),
#                 ip=25,
#                 levels=c("id"),
#                 family="gaussian",
#                 data=pbc.merlin,
#                 timevar="year")
#   modres <- as.numeric(c(mod$coefftable[,1],mod$loglikelihood))
#   expect_equal((abs(modres-statares)/(abs(statares)+1)),comp,tolerance=5e-2)
# })
#
#
# # BERNOULLI
# ###############################################################################
# test_that("Test 2.1", {
#   pbc.merlin$group <- round(pbc.merlin$age/10)
#   statares <- c(.0141224,log(1.121833),-205.85846)
#   comp <- rep(0,length(statares))
#   mod <- merlin(model=list(died ~ M1[group]*1),
#                   ip=15,
#                   levels=c("group"),
#                   family="bernoulli",
#                   covariance="identity",
#                   data=pbc.merlin)
#   modres <- as.numeric(c(mod$coefftable[,1],mod$loglikelihood))
#   expect_equal((abs(modres-statares)/(abs(statares)+1)),comp,tolerance=1e-2)
# })
#
# test_that("Test 2.2", {
#   pbc.merlin$group <- round(pbc.merlin$age/10)
#   statares <- c(14.39803,-34.05126,log(1.051053),-171.97422)
#   comp <- rep(0,length(statares))
#   mod <- merlin(model=list(died ~ logp + M1[group]*1),
#                 ip=15,
#                 levels=c("group"),
#                 family="bernoulli",
#                 covariance="identity",
#                 data=pbc.merlin)
#   modres <- as.numeric(c(mod$coefftable[,1],mod$loglikelihood))
#   expect_equal((abs(modres-statares)/(abs(statares)+1)),comp,tolerance=1e-2)
# })
#
# test_that("Test 2.3", {
#   pbc.merlin$group <- round(pbc.merlin$age/10)
#   statares <- c(12.3279,2.888777,-.7888563,-29.56543,log(1.364638),-150.64338)
#   comp <- rep(0,length(statares))
#   mod <- merlin(model=list(died ~ logp + logb + logp:logb + M1[group]*1),
#                 ip=15,
#                 levels=c("group"),
#                 family="bernoulli",
#                 covariance="identity",
#                 data=pbc.merlin)
#   modres <- as.numeric(c(mod$coefftable[,1],mod$loglikelihood))
#   expect_equal((abs(modres-statares)/(abs(statares)+1)),comp,tolerance=1e-2)
# })
#
#
#
# # EXPONENTIAL
# ###############################################################################
# test_that("Test 8.1a", {
#   pbc.merlin$group <- round(pbc.merlin$age/10)
#   statares <- c(-2.567219,log(.6763707),-504.46228)
#   comp <- rep(0,length(statares))
#   mod <- merlin(model=list(Surv(stime,died) ~ M1[group]*1),
#                   ip=21,
#                   levels=c("group"),
#                   family="exponential",
#                   covariance="identity",
#                   data=pbc.merlin)
#   modres <- as.numeric(c(mod$coefftable[,1],mod$loglikelihood))
#   expect_equal((abs(modres-statares)/(abs(statares)+1)),comp,tolerance=5e-2)
# })
#
# test_that("Test 8.2a", {
#   pbc.merlin$trt <- as.numeric(pbc.merlin$trt)
#   pbc.merlin$group <- round(pbc.merlin$age/10)
#   statares <- c(-.1259977,-2.438703,log(.9471302),-504.30085)
#   comp <- rep(0,length(statares))
#   mod <- merlin(model=list(Surv(stime,died) ~ trt + M1[group]*1),
#                   ip=15,
#                   levels=c("group"),
#                   family="exponential",
#                   covariance="identity",
#                   data=pbc.merlin)
#   modres <- as.numeric(c(mod$coefftable[,1],mod$loglikelihood))
#   expect_equal((abs(modres-statares)/(abs(statares)+1)),comp,tolerance=1e-2)
# })
#
# # # GOMPERTZ
# # ###############################################################################
# # # test_that("Test 9.1", { # CAN'T DO INTERCEPT ONLY
# # #   statares <- c(-2.608133,.2697497,log(.2006814),-2902.1221)
# # #   mod <- merlin(model=list(Surv(stime,status) ~ M1[practice]*1),
# # #                   ip=5,
# # #                   levels=c("practice"),
# # #                   family="gompertz",
# # #                   covariance="identity",
# # #                   data=data_surv3)
# # #   modres <- as.numeric(c(mod$coefftable[,1],mod$loglikelihood))
# # #   expect_equal(modres, statares, tolerance=1e-4)
# # # })
# #
# # # test_that("Test 9.2", { # doesn't run
# # #   statares <- c(-2.408634,-.4532081,.2776478,log(.1825546),-2877.0077)
# # #   mod <- merlin(model=list(Surv(stime,status) ~ trt + M1[practice]*1),
# # #                   ip=25,
# # #                   levels=c("practice"),
# # #                   family="gompertz",
# # #                   covariance="identity",
# # #                   data=data_surv3)
# # #   modres <- as.numeric(c(mod$coefftable[,1],mod$loglikelihood))
# # #   expect_equal(modres, statares, tolerance=1e-4)
# # # })
# #
# #
# # # WEIBULL
# # ###############################################################################
# # # test_that("Test 11.1", { # CAN'T DO INTERCEPT ONLY
# # #   statares <- c(-2.698135,.4166527,log(.194694),-2885.7883)
# # #   comp <- rep(0,length(statares))
# # #   mod <- merlin(model=list(surv(stime,status) ~ M1[practice]*1),
# # #                   nodes=5,
# # #                   levels=c("practice"),
# # #                   family="weibull",
# # #                   covariance="identity",
# # #                   data=data_surv3)
# # #   modres <- as.numeric(c(mod$coefftable[,1],mod$loglikelihood))
# # #   expect_equal((abs(modres-statares)/(abs(statares)+1)),comp,tolerance=1e-2)
# # # })
# #
# # test_that("Test 11.2", {
# #   statares <- c(-.4497289,-2.497396,.4248214,log(.1761942),-2861.0073)
# #   comp <- rep(0,length(statares))
# #   mod <- merlin(model=list(Surv(stime,status) ~ trt + M1[practice]*1),
# #                   ip=5,
# #                   levels=c("practice"),
# #                   family="weibull",
# #                   covariance="identity",
# #                   data=data_surv3)
# #   modres <- as.numeric(c(mod$coefftable[,1],mod$loglikelihood))
# #   expect_equal((abs(modres-statares)/(abs(statares)+1)),comp,tolerance=1e-2)
# # })
# #
# #
# # # ROYSTON-PALMER MODELS
# # ###############################################################################
# # # test_that("Test 13.1", { # CAN'T DO INTERCEPT ONLY
# # #   statares <- c(-1.0880669,.94136462,.02136717,-.02597223,-354.85334)
# # #   comp <- rep(0,length(statares))
# # #   mod <- merlin(model=list(Surv(stime,died) ~ 1),
# # #                 ip=25,
# # #                 family=c("rp"),
# # #                 data=data_jm)
# # #   modres <- as.numeric(c(mod$coefftable[,1],mod$loglikelihood))
# # #   expect_equal((abs(modres-statares)/(abs(statares)+1))[1:4],comp[1:4],tolerance=1e-2)
# # # })
# #
# # # test_that("Test 13.2", { # not working
# # #   statares <- c(.04453543,.95872581,.01529192,-.02923702,-3.3843425,-340.38592)
# # #   comp <- rep(0,length(statares))
# # #   mod <- merlin(model=list(Surv(stime,died) ~ age + rcs(stime,df=3,orthog=T)),
# # #                 ip=11,
# # #                 family=c("rp"),
# # #                 timevar="stime",
# # #                 data=data_jm)
# # #   modres <- as.numeric(c(mod$coefftable[,1],mod$loglikelihood))
# # #   expect_equal((abs(modres-statares)/(abs(statares)+1))[1:5],comp[1:5],tolerance=1e-2)
# # # })
# #
# # # test_that("Test 13.3", {
# # #   statares <- c(-2.3727601,.01593183,.22151683,.00158001,-.02484696,-345.72029)
# # #   comp <- rep(0,length(statares))
# # #   mod <- merlin(model=list(Surv(stime,died) ~ age:fp(stime,powers=c(0)) + rcs(stime,df=3,orthog=F)),
# # #                 ip=25,
# # #                 timevar="stime",
# # #                 family=c("rp"),
# # #                 data=data_jm)
# # #   modres <- as.numeric(c(mod$coefftable[,1],mod$loglikelihood))
# # #   expect_equal((abs(modres-statares)/(abs(statares)+1))[1:5],comp[1:5],tolerance=1e-2)
# # # })
# #
# #
# # # GAUSSIAN - GAUSSIAN
# # ###############################################################################
# # # test_that("Test 14.1", { # CAN'T DO INTERCEPT ONLY
# # #   statares <- c(2.394502,.8521971,-2.382173,-.561932,log(.0620281),log(.9758374),-418.43076)
# # #   comp <- rep(0,length(statares))
# # #   mod <- merlin(model=list(logp ~ M1[id]*1,
# # #                            logb ~ M2[id]*1),
# # #                   ip=25,
# # #                   family=c("gaussian","gaussian"),
# # #                   levels=c("id"),
# # #                   covariance="identity",
# # #                   data=data_jm)
# # #   expect_equal((abs(mod$checkcode-statares)/(abs(statares)+1)),comp,tolerance=1e-2)
# # # })
# #
# #
# # # 15 - WEIBULL GAUSSIAN
# # ###############################################################################
# # # test_that("Test 15.1", {
# # #   data_jm$trt <- as.numeric(data_jm$trt) - 1
# # #   statares <- c(2.394502,.8521971,-2.382173,-.561932,log(.0620281),log(.9758374),-418.43076)
# # #   comp <- rep(0,length(statares))
# # #   mod <- merlin(model=list(Surv(stime,died) ~ trt + M1[id],
# # #                            logb ~ time + M1[id]*1),
# # #                 ip=25,
# # #                 family=c("weibull","gaussian"),
# # #                 levels=c("id"),
# # #                 covariance="identity",
# # #                 data=data_jm)
# # #   expect_equal((abs(mod$checkcode-statares)/(abs(statares)+1)),comp,tolerance=1e-2)
# # # })
# #
