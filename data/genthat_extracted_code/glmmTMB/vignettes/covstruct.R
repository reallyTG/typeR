params <-
list(EVAL = FALSE)

## ----setup, include=FALSE, message=FALSE---------------------------------
library(knitr)
library(glmmTMB)
library(MASS)  ## for mvrnorm()
library(TMB) ## for tmbprofile()
## devtools::install_github("kaskr/adcomp/TMB")  ## get development version
knitr::opts_chunk$set(echo = TRUE, eval=if (isTRUE(exists("params"))) params$EVAL else FALSE)
## turned off caching for now: got error in chunk 'fit.us.2'
## Error in retape() : 
##   Error when reading the variable: 'thetaf'. Please check data and parameters.
## In addition: Warning message:
## In retape() : Expected object. Got NULL.
set.seed(1)

## ----sim1, eval=TRUE-----------------------------------------------------
n <- 6                                              ## Number of time points
x <- mvrnorm(mu = rep(0,n),
             Sigma = .7 ^ as.matrix(dist(1:n)) )    ## Simulate the process using the MASS package
y <- x + rnorm(n)                                   ## Add measurement noise

## ----simtimes------------------------------------------------------------
#  times <- factor(1:n)
#  levels(times)

## ----simgroup------------------------------------------------------------
#  group <- factor(rep(1,n))

## ----simcomb-------------------------------------------------------------
#  dat0 <- data.frame(y,times,group)

## ----fitar1, eval=FALSE--------------------------------------------------
#  glmmTMB(y ~ ar1(times + 0 | group), data=dat0)

## ----ar0fit,echo=FALSE---------------------------------------------------
#  glmmTMB(y ~ ar1(times + 0 | group), data=dat0)

## ----simGroup------------------------------------------------------------
#  simGroup <- function(g) {
#      x <- mvrnorm(mu = rep(0,n),
#               Sigma = .7 ^ as.matrix(dist(1:n)) )    ## Simulate the process
#      y <- x + rnorm(n)                               ## Add measurement noise
#      times <- factor(1:n)
#      group <- factor(rep(g,n))
#      data.frame(y, times, group)
#  }
#  simGroup(1)

## ----simGroup2-----------------------------------------------------------
#  dat1 <- do.call("rbind", lapply(1:1000, simGroup) )

## ----fit.ar1-------------------------------------------------------------
#  (fit.ar1 <- glmmTMB(y ~ ar1(times + 0 | group), data=dat1))

## ----fit.us--------------------------------------------------------------
#  fit.us <- glmmTMB(y ~ us(times + 0 | group), data=dat1, dispformula=~0)
#  fit.us$sdr$pdHess ## Converged ?

## ----fit.us.vc-----------------------------------------------------------
#  VarCorr(fit.us)

## ----fit.toep------------------------------------------------------------
#  fit.toep <- glmmTMB(y ~ toep(times + 0 | group), data=dat1, dispformula=~0)
#  fit.toep$sdr$pdHess ## Converged ?

## ----fit.toep.vc---------------------------------------------------------
#  VarCorr(fit.toep)

## ----fit.cs--------------------------------------------------------------
#  fit.cs <- glmmTMB(y ~ cs(times + 0 | group), data=dat1, dispformula=~0)
#  fit.cs$sdr$pdHess ## Converged ?

## ----fit.cs.vc-----------------------------------------------------------
#  VarCorr(fit.cs)

## ----anova1--------------------------------------------------------------
#  anova(fit.ar1, fit.toep, fit.us)

## ----anova2--------------------------------------------------------------
#  anova(fit.cs, fit.toep)

## ----sample2-------------------------------------------------------------
#  x <- sample(1:2, 10, replace=TRUE)
#  y <- sample(1:2, 10, replace=TRUE)

## ----numFactor-----------------------------------------------------------
#  (pos <- numFactor(x,y))

## ----parseNumLevels------------------------------------------------------
#  parseNumLevels(levels(pos))

## ----numFactor2----------------------------------------------------------
#  dat1$times <- numFactor(dat1$times)
#  levels(dat1$times)

## ----fit.ou--------------------------------------------------------------
#  fit.ou <- glmmTMB(y ~ ou(times + 0 | group), data=dat1)
#  fit.ou$sdr$pdHess ## Converged ?

## ----fit.ou.vc-----------------------------------------------------------
#  VarCorr(fit.ou)

## ----fit.mat-------------------------------------------------------------
#  fit.mat <- glmmTMB(y ~ mat(times + 0 | group), data=dat1, dispformula=~0)
#  fit.mat$sdr$pdHess ## Converged ?

## ----fit.mat.vc----------------------------------------------------------
#  VarCorr(fit.mat)

## ----fit.gau-------------------------------------------------------------
#  fit.gau <- glmmTMB(y ~ gau(times + 0 | group), data=dat1, dispformula=~0)
#  fit.gau$sdr$pdHess ## Converged ?

## ----fit.gau.vc----------------------------------------------------------
#  VarCorr(fit.gau)

## ----fit.exp-------------------------------------------------------------
#  fit.exp <- glmmTMB(y ~ exp(times + 0 | group), data=dat1)
#  fit.exp$sdr$pdHess ## Converged ?

## ----fit.exp.vc----------------------------------------------------------
#  VarCorr(fit.exp)

## ----spatial_data--------------------------------------------------------
#  d <- data.frame(z = as.vector(volcano),
#                  x = as.vector(row(volcano)),
#                  y = as.vector(col(volcano)))

## ----spatial_sub_sample--------------------------------------------------
#  set.seed(1)
#  d$z <- d$z + rnorm(length(volcano), sd=15)
#  d <- d[sample(nrow(d), 100), ]

## ----volcano_data_image--------------------------------------------------
#  volcano.data <- array(NA, dim(volcano))
#  volcano.data[cbind(d$x, d$y)] <- d$z
#  image(volcano.data, main="Spatial data")

## ----spatial_add_pos_and_group-------------------------------------------
#  d$pos <- numFactor(d$x, d$y)
#  d$group <- factor(rep(1, nrow(d)))

## ----fit_spatial_model---------------------------------------------------
#  f <- glmmTMB(z ~ 1 + exp(pos + 0 | group), data=d)

## ----confint_sigma-------------------------------------------------------
#  confint(f, "sigma")

## ----newdata_corner------------------------------------------------------
#  newdata <- data.frame( pos=numFactor(expand.grid(x=1:3,y=1:3)) )
#  newdata$group <- factor(rep(1, nrow(newdata)))
#  newdata

## ----predict_corner------------------------------------------------------
#  predict(f, newdata, type="response", allow.new.levels=TRUE)

## ----predict_column------------------------------------------------------
#  predict_col <- function(i) {
#      newdata <- data.frame( pos = numFactor(expand.grid(1:87,i)))
#      newdata$group <- factor(rep(1,nrow(newdata)))
#      predict(f, newdata=newdata, type="response", allow.new.levels=TRUE)
#  }

## ----predict_all---------------------------------------------------------
#  pred <- sapply(1:61, predict_col)

## ----image_results-------------------------------------------------------
#  image(pred, main="Reconstruction")

## ----fit.us.2------------------------------------------------------------
#  vv0 <- VarCorr(fit.us)
#  vv1 <- vv0$cond$group          ## extract 'naked' V-C matrix
#  n <- nrow(vv1)
#  rpars <- getME(fit.us,"theta") ## extract V-C parameters
#  ## first n parameters are log-std devs:
#  all.equal(unname(diag(vv1)),exp(rpars[1:n])^2)
#  ## now try correlation parameters:
#  cpars <- rpars[-(1:n)]
#  length(cpars)==n*(n-1)/2      ## the expected number
#  cc <- diag(n)
#  cc[upper.tri(cc)] <- cpars
#  L <- crossprod(cc)
#  D <- diag(1/sqrt(diag(L)))
#  D %*% L %*% D
#  unname(attr(vv1,"correlation"))

## ----other_check---------------------------------------------------------
#  all.equal(c(cov2cor(vv1)),c(fit.us$obj$env$report(fit.us$fit$parfull)$corr[[1]]))

## ----fit.us.profile,cache=TRUE-------------------------------------------
#  ## want $par, not $parfull: do NOT include conditional modes/'b' parameters
#  ppar <- fit.us$fit$par
#  length(ppar)
#  range(which(names(ppar)=="theta")) ## the last n*(n+1)/2 parameters
#  ## only 1 fixed effect parameter
#  tt <- tmbprofile(fit.us$obj,2,trace=FALSE)

## ----fit.us.profile.plot-------------------------------------------------
#  plot(tt)
#  confint(tt)

## ----fit.cs.profile,cache=TRUE-------------------------------------------
#  ppar <- fit.cs$fit$par
#  length(ppar)
#  range(which(names(ppar)=="theta")) ## the last n*(n+1)/2 parameters
#  ## only 1 fixed effect parameter, 1 dispersion parameter
#  tt2 <- tmbprofile(fit.cs$obj,3,trace=FALSE)

## ----fit.cs.profile.plot-------------------------------------------------
#  plot(tt2)

