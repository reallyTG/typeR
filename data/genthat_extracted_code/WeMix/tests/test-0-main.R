require(testthat)

# for sleepstudy, calls in here to lmer
library(lme4)
# for grad function

options(width = 500)
options(useFancyQuotes = FALSE)

### Data Used: sleepstudy
tolerance <- 2E-5
data("sleepstudy")
### Unweigted =====================================
sleepstudyU <- sleepstudy
sleepstudyU$weight1L1 <- 1
sleepstudyU$weight1L2 <- 1


context("model runs")
test_that("mix agrees with lme4 1", {

  system.time(wm0 <- mix(Reaction ~ Days + (1|Subject), data=sleepstudyU, weights=c("weight1L1", "weight1L2"), nQuad=13, verbose=FALSE, fast=TRUE,run=TRUE))
  wm1 <- mix(Reaction ~ Days + (1|Subject), data=sleepstudyU, weights=c("weight1L1", "weight1L2"), nQuad=13, verbose=FALSE, run=FALSE)
  expect_equal(wm0$lnl, -897.039321502613, tolerance=tolerance*897) # value from  lmer(Reaction ~ Days + (1 | Subject), data=sleepstudy, REML=FALSE)

  expect_equal(unname(c(wm0$coef, wm0$vars)), unname(wm1$parlme), tolerance=tolerance*wm1$parlme)
  # agrees with lme4
  # check coef
  lme1 <- lmer(Reaction ~ Days + (1|Subject), data=sleepstudy, REML=FALSE)
  expect_equal(coef(wm0),
               expected = getME(lme1, "fixef"),
               tolerance = tolerance * coef(wm0))
  # check vars
  lmevars1 <- data.frame(summary(lme1)$varcor)$sdcor
  expect_equal(unname(wm0$vars),
               expected = unname(lmevars1)^2,
               tolerance = tolerance * wm0$vars)
  # agrees with GLLAMM
  #source: logit_command.do
  gllamm_model1 <- c("(Intercept)" = 251.4051,
                     "Days"         = 10.46729,
                     "Residual"     = 1296.8768,
                     "Subject"      = 954.52789,
                     "lnl"          = -897.03932)
  expect_equal(unname(coef(wm0)),
               expected = unname(gllamm_model1[1:2]),
               tolerance = abs(tolerance * gllamm_model1[1:2]))
  expect_equal(unname(wm0$vars),
               expected = unname(gllamm_model1[3:4]),
               tolerance = tolerance * wm0$vars)
  expect_equal(unname(wm0$lnl),
               expected=unname(gllamm_model1[5]),
               tolerance=abs(tolerance*wm0$lnl))
})

context("unweighted model with 1 random effect")
test_that("lnl agrees with lme4 2", {
  wm1 <- mix(Reaction ~ Days + (1|Subject), data=sleepstudyU, weights=c("weight1L1", "weight1L2"), nQuad=13, verbose=FALSE, run=FALSE)
  system.time(wm1lnl <- wm1$lnlf(wm1$parlme)) # speed test 1, for a longer test, increase nQuad on prev line
  expect_equal(wm1lnl, -897.039321502613, tolerance=tolerance*897) # value from  lmer(Reaction ~ Days + (1 | Subject), data=sleepstudy, REML=FALSE)
})

context("unweighted model with 2 random effects")
test_that("agrees with lme4 3", {
  lme2 <- lmer(Reaction ~ Days + (1 | Subject) + (0 + Days | Subject), data=sleepstudyU, REML=FALSE)
  wm2 <- mix(Reaction ~ Days + (1 | Subject) + (0 + Days | Subject), data=sleepstudyU, weights=c("weight1L1", "weight1L2"), nQuad=13L,fast=TRUE, verbose=FALSE, run=FALSE)
  expect_equal(wm2$lnlf(wm2$parlme), as.numeric(logLik(lme2)), tol=1E-7*abs(as.numeric(logLik(lme2))))
  system.time(grad <- grad(wm2$lnlf,wm2$parlme))
  expect_equal(grad, rep(0, length(wm2$parlme)), tolerance=1E-5)

  #test actal values on data subset for speed
  ss_sample <- sleepstudyU[row.names(sleepstudy) %in% seq(1,60),]

  lme2Sample <- lmer(Reaction ~ Days + (1 | Subject) + (0 + Days | Subject), data=ss_sample, REML=FALSE)
  wm2Sample <- mix(Reaction ~ Days + (1 | Subject) + (0 + Days | Subject), data=ss_sample, weights=c("weight1L1", "weight1L2"), fast=TRUE, nQuad=13, verbose=FALSE, run=TRUE)
  # check coef
  expect_equal(coef(wm2Sample),
               expected = getME(lme2Sample, "fixef"),
               tolerance = tolerance * coef(wm2Sample))
  # check vars
  lmewm2vars <- data.frame(summary(lme2Sample)$varcor)$sdcor
  expect_equal(unname(wm2Sample$vars),
               expected = unname(lmewm2vars)^2,
               tolerance = tolerance * wm2Sample$vars)
})
 
context("Mean Centering Matches HLM results")
test_that("mean centering agrees with HLM", {
 wm1 <- mix(Reaction ~ Days + (1|Subject), data=sleepstudyU, weights=c("weight1L1", "weight1L2"), nQuad=13,center_group=list("Subject"= as.formula(~Days)), verbose=FALSE)
 expect_equal(unname(wm1$coef), c(298.507892, 10.467286), tolerance=1E-1)
 expect_equal(wm1$lnl, -897.0393, tolerance=tolerance*897) # value from  lmer(Reaction ~ Days + (1 | Subject), data=sleepstudy, REML=FALSE)
})




ss <- sleepstudy
ss1 <- ss
ss2 <- ss
doubles <- c(308, 309, 310) # subject with double obs
ss2 <- rbind(ss, subset(ss, Subject %in% doubles))

ss1$W1 <- ifelse(ss1$Subject %in% doubles, 2, 1)
ss1$W2 <- 1
ss1$bin <- ifelse(sleepstudy$Reaction<300,0,1) #for the binomial test



ss2$W2 <- ss2$W1 <- 1

doubles <- c(308, 309, 310) # subject with double obs
ss30 <- subset(ss, Subject %in% doubles)
ss30$Subject <- as.numeric(as.character(ss30$Subject)) + 1000
ss0 <- ss
ss0$Subject <- as.numeric(as.character(ss$Subject))
ss3 <- rbind(ss0, ss30)
ss3$Subject <- as.factor(ss3$Subject)

ss3$W2 <- 1
ss3$W1 <- 1

ss4 <- ss
ss4$W2 <- ifelse(ss4$Subject %in% doubles, 2, 1)
ss4$W1 <- 1

#context("GLM works: Binomial")
#test_that("GLM works: Binomial", {
  
  
  #full test for binomial 
#  bi_1 <- mix(bin~Days + (1|Subject),data=ss1,family=binomial(link="logit"),verbose=F,weights=c("W1", "W2"),nQuad=13)
#  expect_equal(unname(bi_1$coef),c(-3.3448,.5928),tolerance=1E-3)
#  expect_equal(bi_1$lnl,-93.751679,tolerance=1E-5*abs(bi_1$lnl))
  
#  })

# context("repeating is the same as weighting: L1 replicate vs weigting")
# test_that("L1 replicate vs weigting", {
#   # mix for L1, weighted
#   wmeL1W <- mix(formula=Reaction ~ Days + (1 | Subject), data=ss1,
#                 weights=c("W1", "W2"), nQuad=13, run=FALSE, fast=TRUE, verbose=FALSE)
# 
#   # mix for L1, duplicated
#   system.time(wmeL1D <- mix(formula=Reaction ~ Days + (1 | Subject), data=ss2,
#                             weights=c("W1", "W2"), nQuad=13, run=FALSE,fast=TRUE,  verbose=FALSE))
# 
#   # check weighted agrees with duplicated lme4 results
#   expect_equal(wmeL1W$lnlf(wmeL1D$parlme), -1048.34318418762, tolerance=1050*tolerance)
#   grd <- WeMix:::getGrad(wmeL1W$lnlf, wmeL1D$parlme, highAccuracy=TRUE)
#   expect_equal(grd, rep(0,length(wmeL1D$parlme)), tolerance=tolerance)
# 
#   # check duplicated agrees with duplicated lme4 results
#   expect_equal(wmeL1D$lnlf(wmeL1D$parlme), -1048.34318418762, tolerance=1050*tolerance)
#   grd <- WeMix:::getGrad(wmeL1D$lnlf, wmeL1D$parlme, highAccuracy=TRUE)
#   expect_equal(grd, rep(0,length(wmeL1D$parlme)), tolerance=tolerance)
# })

context("grouping factor not sorted")
test_that("grouping factor not sorted", {
  ss1_mixed <- ss1[c(125:180,1,100,2:99,101:124),]
  row.names(ss1_mixed) <- NULL
  # mix for L1, weighted
  wmeL1W <- mix(formula=Reaction ~ Days + (1 | Subject), data=ss1_mixed,
                weights=c("W1", "W2"), nQuad=13, run=FALSE,fast=TRUE,  verbose=FALSE)

  # mix for L1, duplicated
  system.time(wmeL1D <- mix(formula=Reaction ~ Days + (1 | Subject), data=ss2,
                            weights=c("W1", "W2"), nQuad=13, run=FALSE,fast=TRUE,  verbose=FALSE))
  #statares <- c(251.4619, 10.40726, 1000.7466, 1338.0865) # not used

  # check weighted agrees with duplicated lme4 results
  expect_equal(wmeL1W$lnlf(wmeL1D$parlme), -1048.34318418762, tolerance=1050*tolerance)
  grd <- WeMix:::getGrad(wmeL1W$lnlf, wmeL1D$parlme, highAccuracy=TRUE)
  expect_equal(grd, rep(0,length(wmeL1D$parlme)), tolerance=tolerance)

  # check final results
  suppressWarnings(mix1 <-  mix(formula=Reaction ~ Days + (1 | Subject), data=ss1_mixed,
                                weights=c("W1", "W2"), nQuad=13, run=TRUE, verbose=FALSE, fast = TRUE))
  suppressWarnings(mix1REF <-  mix(formula=Reaction ~ Days + (1 | Subject), data=ss1,
                                   weights=c("W1", "W2"), nQuad=13, run=TRUE, verbose=FALSE, fast = TRUE))
  expect_equal(mix1$coef, mix1REF$coef, tolerance=1e3)
  expect_equal(mix1$vars, mix1REF$vars, tolerance=1e-3)
  expect_equal(mix1$lnl, mix1REF$lnl, tolerance=1e-3)

})

#context("repeating is the same as weighting: L2 replicate vs weigting")
#test_that("L2 replicate vs weigting", {
  # mix for L2, duplicated
 # system.time(wmeL2D <- mix(formula=Reaction ~ Days + (1 | Subject),
 #                           data=ss3, weights=c("W1", "W2"),
 #                           nQuad=13, run=FALSE, verbose=FALSE))

  # mix for L2, weighted
#  system.time(wmeL2W <- mix(formula=Reaction ~ Days + (1 | Subject), data=ss4,
#                            weights=c("W1", "W2"), nQuad=13, run=FALSE, verbose=FALSE))

#  expect_equal(wmeL2W$lnlf(wmeL2D$parlme), -1055.34690957995, tolerance=1050*2E-7)
#  grd <- WeMix:::getGrad(wmeL2W$lnlf, wmeL2D$parlme, highAccuracy=TRUE)
 # expect_equal(grd, rep(0,length(grd)), tolerance=tolerance*100) # note larger tollerance
#  expect_equal(wmeL2D$lnlf(wmeL2D$parlme), -1055.34690957995, tolerance=1050*2E-7)
#  grd <- WeMix:::getGrad(wmeL2D$lnlf, wmeL2D$parlme, highAccuracy=TRUE)
#  expect_equal(grd, rep(0,length(grd)), tolerance=tolerance)
#})

context("repeating is the same as weighting: L1 replicate vs weigting, 2 REs")
test_that("L1 replicate vs weigting, 2 REs", {
  # mix for L1, weighted, 2 REs
  wmeL1WRE2 <- mix(formula=Reaction ~ Days + (1 | Subject) + (0+Days|Subject),
                   data=ss1, weights=c("W1", "W2"), nQuad=13, run=FALSE, verbose=FALSE)

  # mix for L1, duplicated, 2 REs
  wmeL1DRE2 <- mix(formula=Reaction ~ Days + (1 | Subject) + (0+Days|Subject),
                   data=ss2, weights=c("W1", "W2"),nQuad=13, run=FALSE, verbose=FALSE)

  expect_equal(wmeL1WRE2$lnlf(wmeL1DRE2$parlme), -1018.29298875158, tolerance=1050*2E-5)
  grd <- WeMix:::getGrad(wmeL1WRE2$lnlf, wmeL1DRE2$parlme, highAccuracy=TRUE)
  expect_equal(grd, rep(0,length(grd)), tolerance=1e-4)

  expect_equal(wmeL1DRE2$lnlf(wmeL1DRE2$parlme), -1018.29298875158, tolerance=1050*2E-5)
  grd <- WeMix:::getGrad(wmeL1DRE2$lnlf, wmeL1DRE2$parlme, highAccuracy=TRUE)
  expect_equal(grd, rep(0,length(grd)), tolerance=1e-4)
})


#ssB <- sleepstudy
#set.seed(2)
#ssB$Reaction <- ssB$Days * 3.141 + rnorm(nrow(ssB))
#ssB$W2 <- 1
#ssB$W1 <- 1:nrow(ssB)

# commented out to meet cran speed requirements
# context("Zero variance estimate in lmer")
# test_that("simple model with zero variance estimate", {
#   # this has 0 variance estimate in lmer
#   # lmeB <- summary(lmer(Reaction ~ Days + (1|Subject), data=ssB))
#   suppressWarnings(mixB <- mix(formula=Reaction ~ Days + (1 | Subject), data=ssB,
#                                weights=c("W1", "W2"),  nQuad=13, run=TRUE, fast=TRUE,  verbose=FALSE))
#   expect_equal(mixB$lnl, -11099.01935618288, tol=1e-5)
#   expect_equal(coef(mixB), c(`(Intercept)` = 0.590311605676277, Days = 3.04635244383408), tol=1e-5)
#   expect_equal(mixB$vars, c(`Subject:(Intercept)` = 0.0840273638768919, Residual = 1.03106531538434), tol=1e-5)
# })






