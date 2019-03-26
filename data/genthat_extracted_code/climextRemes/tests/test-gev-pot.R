require(testthat)


context("Testing basic functionality.")

library(extRemes)
data(Fort)
FortMax <- aggregate(Prec ~ year, data = Fort, max)

fitg <- fit_gev(FortMax$Prec, returnPeriod = 20, returnValue = 3.5,
         getParams = TRUE, bootSE = TRUE)

firstBlock <- min(Fort$year)
years <- min(Fort$year):max(Fort$year)
nYears <- length(years)
threshold <- 0.395
ord <- order(Fort$year, Fort$month, Fort$day) 
Fort <- Fort[ord, ]
ind <- Fort$Prec > threshold
FortExc <- Fort[ind, ]

fitp <- fit_pot(FortExc$Prec, threshold = threshold, nBlocks = nYears, 
        blockIndex = FortExc$year, firstBlock = firstBlock,
        returnPeriod = 20, returnValue = 3.5,
        getParams = TRUE, bootSE = TRUE)

test_that(paste0("test return value estimates with GEV vs. POT"), {
    expect_lt(max(abs(fitg$mle - fitp$mle)), 0.05) 
})
test_that(paste0("test analytic and bootstrap SEs for GEV"), {
    expect_lt(max(abs(fitg$se_mle - fitg$se_mle_boot)), 0.018) 
})
test_that(paste0("test analytic and bootstrap SEs for GEV"), {
    expect_lt(max(abs(fitp$se_mle - fitp$se_mle_boot)), 0.008) 
})


context("Testing multiple return periods / values.")

fitg2 <- fit_gev(FortMax$Prec, returnPeriod = 50, returnValue = 3,
         getParams = TRUE, bootSE = TRUE)

fitp2 <- fit_pot(FortExc$Prec, threshold = threshold, nBlocks = nYears, 
        blockIndex = FortExc$year, firstBlock = firstBlock,
        returnPeriod = 50, returnValue = 3,
        getParams = TRUE, bootSE = TRUE)

fitgMult <- fit_gev(FortMax$Prec, returnPeriod = c(20,40, 50),
                 returnValue = c(3.5, 3.2, 3),
         getParams = TRUE, bootSE = TRUE)

fitpMult <- fit_pot(FortExc$Prec, threshold = threshold, nBlocks = nYears, 
        blockIndex = FortExc$year, firstBlock = firstBlock,
        returnPeriod = c(20, 40, 50), returnValue = c(3.5, 3.2, 3),
        getParams = TRUE, bootSE = TRUE)

test_that("test single/multi return values for GEV", {
    expect_equivalent(c(fitg$returnValue, fitg2$returnValue),
                     fitgMult$returnValue[c(1,3)])})

test_that("test single/multi return probs for GEV", {
    expect_equivalent(c(fitg$logReturnProb, fitg2$logReturnProb),
                     fitgMult$logReturnProb[c(1,3)])})

test_that("test single/multi return value std errors for GEV", {
    expect_equivalent(c(fitg$se_returnValue, fitg2$se_returnValue),
                     fitgMult$se_returnValue[c(1,3)])})

test_that("test single/multi return prob std errors for GEV", {
    expect_equivalent(c(fitg$se_logReturnProb, fitg2$se_logReturnProb),
                     fitgMult$se_logReturnProb[c(1,3)])})

test_that("test single/multi return value bootstrap std errors for GEV", {
    expect_equivalent(c(fitg$se_returnValue_boot, fitg2$se_returnValue_boot),
                     fitgMult$se_returnValue_boot[c(1,3)])})

test_that("test single/multi return prob bootstrap std errors for GEV", {
    expect_equivalent(c(fitg$se_logReturnProb_boot, fitg2$se_logReturnProb_boot),
                     fitgMult$se_logReturnProb_boot[c(1,3)])})

test_that("test single/multi return values for POT", {
    expect_equivalent(c(fitp$returnValue, fitp2$returnValue),
                     fitpMult$returnValue[c(1,3)])})

test_that("test single/multi return probs for POT", {
    expect_equivalent(c(fitp$logReturnProb, fitp2$logReturnProb),
                     fitpMult$logReturnProb[c(1,3)])})

test_that("test single/multi return value std errors for POT", {
    expect_equivalent(c(fitp$se_returnValue, fitp2$se_returnValue),
                     fitpMult$se_returnValue[c(1,3)])})

test_that("test single/multi return prob std errors for POT", {
    expect_equivalent(c(fitp$se_logReturnProb, fitp2$se_logReturnProb),
                     fitpMult$se_logReturnProb[c(1,3)])})

test_that("test single/multi return value bootstrap std errors for POT", {
    expect_equivalent(c(fitp$se_returnValue_boot, fitp2$se_returnValue_boot),
                     fitpMult$se_returnValue_boot[c(1,3)])})

test_that("test single/multi return prob bootstrap std errors for POT", {
    expect_equivalent(c(fitp$se_logReturnProb_boot, fitp2$se_logReturnProb_boot),
                     fitpMult$se_logReturnProb_boot[c(1,3)])})

context("Testing normalization and scaling in pot_fit() and gev_fit().")

mult <-  5

set.seed(1)
nT <- 500
nObs <- 100
y <- matrix(rnorm(nT*nObs, mult),  nrow = nObs)
blockIndex <- matrix(rep(1:nT, nObs), nrow = nObs, byrow = TRUE)
thr <- quantile(y, 0.98)
wh <- y > thr
yExc <- y[wh]
blockIndexObs <- blockIndex[wh]
index <- (1:(nT*nObs))[wh]
yMax <- apply(y, 2, max)

x <- rnorm(nT, 10, 10)
w <- rnorm(nT)
z <- rnorm(nT)
xNew <- rnorm(3, 10, 10)
wNew <- rnorm(3)
zNew <- rnorm(3)
xContrast <- rnorm(3, 10, 10)
wContrast <- rnorm(3)
zContrast <- rnorm(3)

rv <- 8

fitg = fit_gev(yMax, x = data.frame(x=x, w = w, z = z), locationFun = ~x, scaleFun = ~x+w,
              shapeFun = ~x+w+z, scaling = 1/5,
              returnPeriod = 20, returnValue = rv, getParams = TRUE,
              xNew = data.frame(x=xNew, w = wNew, z = zNew),
              xContrast = data.frame(x=xContrast, w = wContrast, z = zContrast),
              optimArgs = list(method = 'BFGS'))
fitgn = fit_gev(yMax, x = data.frame(x=x, w = w, z = z), locationFun = ~x, scaleFun = ~x+w,
              shapeFun = ~x+w+z,
              returnPeriod = 20, returnValue = rv, getParams = TRUE,
              xNew = data.frame(x=xNew, w = wNew, z = zNew), .normalizeX = FALSE,
              xContrast = data.frame(x=xContrast, w = wContrast, z = zContrast),
              optimArgs = list(method = 'BFGS'))                                      

test_that(paste0("test parameter estimates with normalization and scaling for GEV"), {
    expect_lt(max(abs(fitg$mle - fitgn$mle)), 5e-5) 
})
test_that(paste0("test parameter estimates with normalization and scaling for GEV"), {
    expect_lt(max(abs(fitg$se_mle - fitgn$se_mle)), 1e-3) 
})


# current fevd error with len(scale) != len(shape) so modifying to have z be two covars
fitp = fit_pot(yExc, x = data.frame(x=x, w = w, z = z), threshold = thr, locationFun = ~x, scaleFun = ~x+w,
              shapeFun = ~x+w, scaling = 1/5,
                nBlocks = nT, blockIndex = blockIndexObs, index = index,
              returnPeriod = 20, returnValue = rv, getParams = TRUE,
              xNew = data.frame(x=xNew, w = wNew, z = zNew),
              xContrast = data.frame(x=xContrast, w = wContrast, z = zContrast),
              optimArgs = list(method = 'BFGS'))
fitpn = fit_pot(yExc, x = data.frame(x=x, w = w, z = z), threshold = thr, locationFun = ~x, scaleFun = ~x+w,
              shapeFun = ~x+w,
               nBlocks = nT, blockIndex = blockIndexObs, index = index,
              returnPeriod = 20, returnValue = rv, getParams = TRUE,
              xNew = data.frame(x=xNew, w = wNew, z = zNew), .normalizeX = FALSE,
              xContrast = data.frame(x=xContrast, w = wContrast, z = zContrast),
              optimArgs = list(method = 'BFGS'))                                      

test_that(paste0("test parameter estimates with normalization and scaling for POT"), {
    expect_lt(max(abs(fitp$mle - fitpn$mle)), 5e-5) 
})
test_that(paste0("test parameter estimates with normalization and scaling for POT"), {
    expect_lt(max(abs(fitp$se_mle - fitpn$se_mle)), 1e-3) 
})


context("Testing multiple return periods / values with covariates.")

fitg = fit_gev(yMax, x = data.frame(x=x, w = w, z = z), locationFun = ~x, scaleFun = ~x+w,
              shapeFun = ~x+w+z, scaling = 1/5,
              returnPeriod = 20, returnValue = rv, getParams = TRUE,
              xNew = data.frame(x=xNew, w = wNew, z = zNew),
              xContrast = data.frame(x=xContrast, w = wContrast, z = zContrast),
              optimArgs = list(method = 'BFGS'), bootSE = TRUE, bootControl = list(n = 100))

fitp = fit_pot(yExc, x = data.frame(x=x, w = w, z = z), threshold = thr, locationFun = ~x, scaleFun = ~x+w,
              shapeFun = ~x+w, scaling = 1/5,
                nBlocks = nT, blockIndex = blockIndexObs, index = index,
              returnPeriod = 20, returnValue = rv, getParams = TRUE,
              xNew = data.frame(x=xNew, w = wNew, z = zNew),
              xContrast = data.frame(x=xContrast, w = wContrast, z = zContrast),
              optimArgs = list(method = 'BFGS'), bootSE = TRUE, bootControl = list(n = 100))

fitg2 = fit_gev(yMax, x = data.frame(x=x, w = w, z = z), locationFun = ~x, scaleFun = ~x+w,
              shapeFun = ~x+w+z, scaling = 1/5,
              returnPeriod = 50, returnValue = rv-1, getParams = TRUE,
              xNew = data.frame(x=xNew, w = wNew, z = zNew),
              xContrast = data.frame(x=xContrast, w = wContrast, z = zContrast),
              optimArgs = list(method = 'BFGS'), bootSE = TRUE, bootControl = list(n = 100))


fitp2 = fit_pot(yExc, x = data.frame(x=x, w = w, z = z), threshold = thr, locationFun = ~x, scaleFun = ~x+w,
              shapeFun = ~x+w, scaling = 1/5,
                nBlocks = nT, blockIndex = blockIndexObs, index = index,
              returnPeriod = 50, returnValue = rv-1, getParams = TRUE,
              xNew = data.frame(x=xNew, w = wNew, z = zNew),
              xContrast = data.frame(x=xContrast, w = wContrast, z = zContrast),
              optimArgs = list(method = 'BFGS'), bootSE = TRUE, bootControl = list(n = 100))

fitgMulti = fit_gev(yMax, x = data.frame(x=x, w = w, z = z), locationFun = ~x, scaleFun = ~x+w,
              shapeFun = ~x+w+z, scaling = 1/5,
              returnPeriod = c(20, 40, 50), returnValue = c(rv, rv+1, rv-1), getParams = TRUE,
              xNew = data.frame(x=xNew, w = wNew, z = zNew),
              xContrast = data.frame(x=xContrast, w = wContrast, z = zContrast),
              optimArgs = list(method = 'BFGS'), bootSE = TRUE, bootControl = list(n = 100))

fitpMulti = fit_pot(yExc, x = data.frame(x=x, w = w, z = z), threshold = thr, locationFun = ~x, scaleFun = ~x+w,
              shapeFun = ~x+w, scaling = 1/5,
                nBlocks = nT, blockIndex = blockIndexObs, index = index,
              returnPeriod = c(20, 40, 50), returnValue = c(rv, rv+1, rv-1), getParams = TRUE,
              xNew = data.frame(x=xNew, w = wNew, z = zNew),
              xContrast = data.frame(x=xContrast, w = wContrast, z = zContrast),
              optimArgs = list(method = 'BFGS'), bootSE = TRUE, bootControl = list(n = 100))


test_that("test single/multi return values for GEV with covars", {
    expect_equivalent(c(fitg$returnValue, fitg2$returnValue),
                     c(fitgMulti$returnValue[ , c(1,3)]))})

test_that("test single/multi return probs for GEV with covars", {
    expect_equivalent(c(fitg$logReturnProb, fitg2$logReturnProb),
                     c(fitgMulti$logReturnProb[ , c(1,3)]))})

test_that("test single/multi return value std errors for GEV with covars", {
    expect_equivalent(c(fitg$se_returnValue, fitg2$se_returnValue),
                     c(fitgMulti$se_returnValue[ , c(1,3)]))})

test_that("test single/multi return prob std errors for GEV with covars", {
    expect_equivalent(c(fitg$se_logReturnProb, fitg2$se_logReturnProb),
                     c(fitgMulti$se_logReturnProb[ , c(1,3)]))})

test_that("test single/multi return value bootstrap std errors for GEV with covars", {
    expect_equivalent(c(fitg$se_returnValue_boot, fitg2$se_returnValue_boot),
                     c(fitgMulti$se_returnValue_boot[ , c(1,3)]))})

test_that("test single/multi return prob bootstrap std errors for GEV with covars", {
    expect_equivalent(c(fitg$se_logReturnProb_boot, fitg2$se_logReturnProb_boot),
                     c(fitgMulti$se_logReturnProb_boot[ , c(1,3)]))})

test_that("test single/multi return values for GEV with covars", {
    expect_equivalent(c(fitg$returnValueDiff, fitg2$returnValueDiff),
                     c(fitgMulti$returnValueDiff[ , c(1,3)]))})

test_that("test single/multi return probs for GEV with covars", {
    expect_equivalent(c(fitg$logReturnProbDiff, fitg2$logReturnProbDiff),
                     c(fitgMulti$logReturnProbDiff[ , c(1,3)]))})

test_that("test single/multi return value std errors for GEV with covars", {
    expect_equivalent(c(fitg$se_returnValueDiff, fitg2$se_returnValueDiff),
                     c(fitgMulti$se_returnValueDiff[ , c(1,3)]))})

test_that("test single/multi return prob std errors for GEV with covars", {
    expect_equivalent(c(fitg$se_logReturnProbDiff, fitg2$se_logReturnProbDiff),
                     c(fitgMulti$se_logReturnProbDiff[ , c(1,3)]))})

test_that("test single/multi return value bootstrap std errors for GEV with covars", {
    expect_equivalent(c(fitg$se_returnValueDiff_boot, fitg2$se_returnValueDiff_boot),
                     c(fitgMulti$se_returnValueDiff_boot[ , c(1,3)]))})

test_that("test single/multi return prob bootstrap std errors for GEV with covars", {
    expect_equivalent(c(fitg$se_logReturnProbDiff_boot, fitg2$se_logReturnProbDiff_boot),
                     c(fitgMulti$se_logReturnProbDiff_boot[ , c(1,3)]))})

test_that("test single/multi return values for POT with covars", {
    expect_equivalent(c(fitp$returnValue, fitp2$returnValue),
                     c(fitpMulti$returnValue[ , c(1,3)]))})

test_that("test single/multi return probs for POT with covars", {
    expect_equivalent(c(fitp$logReturnProb, fitp2$logReturnProb),
                     c(fitpMulti$logReturnProb[ , c(1,3)]))})

test_that("test single/multi return value std errors for POT with covars", {
    expect_equivalent(c(fitp$se_returnValue, fitp2$se_returnValue),
                     c(fitpMulti$se_returnValue[ , c(1,3)]))})

test_that("test single/multi return prob std errors for POT with covars", {
    expect_equivalent(c(fitp$se_logReturnProb, fitp2$se_logReturnProb),
                     c(fitpMulti$se_logReturnProb[ , c(1,3)]))})

test_that("test single/multi return value bootstrap std errors for POT with covars", {
    expect_equivalent(c(fitp$se_returnValue_boot, fitp2$se_returnValue_boot),
                     c(fitpMulti$se_returnValue_boot[ , c(1,3)]))})

test_that("test single/multi return prob bootstrap std errors for POT with covars", {
    expect_equivalent(c(fitp$se_logReturnProb_boot, fitp2$se_logReturnProb_boot),
                     c(fitpMulti$se_logReturnProb_boot[ , c(1,3)]))})

test_that("test single/multi return values for POT with covars", {
    expect_equivalent(c(fitp$returnValueDiff, fitp2$returnValueDiff),
                     c(fitpMulti$returnValueDiff[ , c(1,3)]))})

test_that("test single/multi return probs for POT with covars", {
    expect_equivalent(c(fitp$logReturnProbDiff, fitp2$logReturnProbDiff),
                     c(fitpMulti$logReturnProbDiff[ , c(1,3)]))})

test_that("test single/multi return value std errors for POT with covars", {
    expect_equivalent(c(fitp$se_returnValueDiff, fitp2$se_returnValueDiff),
                     c(fitpMulti$se_returnValueDiff[ , c(1,3)]))})

test_that("test single/multi return prob std errors for POT with covars", {
    expect_equivalent(c(fitp$se_logReturnProbDiff, fitp2$se_logReturnProbDiff),
                     c(fitpMulti$se_logReturnProbDiff[ , c(1,3)]))})

test_that("test single/multi return value bootstrap std errors for POT with covars", {
    expect_equivalent(c(fitp$se_returnValueDiff_boot, fitp2$se_returnValueDiff_boot),
                     c(fitpMulti$se_returnValueDiff_boot[ , c(1,3)]))})

test_that("test single/multi return prob bootstrap std errors for POT with covars", {
    expect_equivalent(c(fitp$se_logReturnProbDiff_boot, fitp2$se_logReturnProbDiff_boot),
                     c(fitpMulti$se_logReturnProbDiff_boot[ , c(1,3)]))})

# test NAs or illegit values in blockIndex
blockIndexBad <- blockIndexObs + 200
test_that("test that bad blockIndex values trigger error",
    expect_error(fit_pot(yExc, x = data.frame(x=x, w = w, z = z), threshold = thr, locationFun = ~x, scaleFun = ~x+w,
              shapeFun = ~x+w, scaling = 1/5,
                nBlocks = nT, blockIndex = blockIndexBad, index = index,
              returnPeriod = 20, returnValue = rv, getParams = TRUE,
              xNew = data.frame(x=xNew, w = wNew, z = zNew),
              xContrast = data.frame(x=xContrast, w = wContrast, z = zContrast),
              optimArgs = list(method = 'BFGS'))))
             
blockIndexBad <- blockIndexObs
blockIndexBad[1] <- NA
test_that("test that NA blockIndex values trigger error",
    expect_error(fit_pot(yExc, x = data.frame(x=x, w = w, z = z), threshold = thr, locationFun = ~x, scaleFun = ~x+w,
              shapeFun = ~x+w, scaling = 1/5,
                nBlocks = nT, blockIndex = blockIndexBad, index = index,
              returnPeriod = 20, returnValue = rv, getParams = TRUE,
              xNew = data.frame(x=xNew, w = wNew, z = zNew),
              xContrast = data.frame(x=xContrast, w = wContrast, z = zContrast),
              optimArgs = list(method = 'BFGS'))))


# assess return_calcs values - compare std errors to bootstrap for moderate dataset size
# compare return quantities to truth for large dataset size
# GEV and POT
# do for 3 values - low,med,high x
# and for contrast of low,high

# basic assessment of quantities for two groups

context("Testing standard error estimates.")

set.seed(1)
nT <- 3000
nObs <- 300
mn <- rep(c(-0.25,.25), each = nT*nObs/2)
y <- matrix(rnorm(nT*nObs, mn),  nrow = nObs)

grps <- rep(c(1,2), each = nT*nObs/2)
yrgrps <- rep(c(1,2), each = nT/2)
yMax <- apply(y, 2, max)

blockIndex <- matrix(rep(1:nT, nObs), nrow = nObs, byrow = TRUE)
thr <- quantile(y, 0.98)
wh <- y > thr
yExc <- y[wh]
blockIndexObs <- blockIndex[wh]
index <- (1:(nT*nObs))[wh]

cutoff <- 3.25
p1 = mean(yMax[yrgrps==1] > cutoff)
p2 = mean(yMax[yrgrps==2] > cutoff)
se1 = sqrt(p1*(1-p1)/(nT/2))
se2 = sqrt(p2*(1-p2)/(nT/2))

rp = 20
rv1 = quantile(yMax[yrgrps==1], 1-1/rp)
rv2 = quantile(yMax[yrgrps==2], 1-1/rp)

x <- rep(c(0,1), each = nT/2)
w <- rnorm(nT)

xNew = c(0,1)
wNew = c(0,0)
xContrast = rev(xNew)
wContrast = wNew
    
fitg = fit_gev(yMax, x = data.frame(x=x, w = w), locationFun = ~x + w, scaleFun = ~x+w,
              shapeFun = ~x + w, scaling = 1/2,
              returnPeriod = rp, returnValue = cutoff,
              xNew = data.frame(x=xNew, w = wNew), getParams = TRUE,
              xContrast = data.frame(x=xContrast, w = wContrast),
              optimArgs = list(method = "BFGS"))

# note these test against empirical estimates, and not accounting for error in 'truth'
test_that(paste0("test returnValue for GEV"), {
    expect_lt(max(abs(fitg$returnValue - c(rv1,rv2))), .03) 
})

test_that(paste0("test returnValue for GEV"), {
    expect_lt(max(abs(fitg$returnValue - c(rv1,rv2)) / fitg$se_returnValue), 2) 
})
test_that(paste0("test returnValue for GEV"), {
    expect_lt(max(abs(exp(fitg$logReturnProb) - c(p1,p2))), .007) 
})
test_that(paste0("test returnValue for GEV"), {
    expect_lt(max(abs(fitg$logReturnProb - log(c(p1,p2))) / fitg$se_logReturnProb), 2) 
})

fitp = fit_pot(yExc, x = data.frame(x=x, w = w), threshold = thr, locationFun = ~x + w, scaleFun = ~x+w,
              shapeFun = ~x + w, scaling = 1/2, nBlocks = nT, blockIndex = blockIndexObs, index = index,
              returnPeriod = rp, returnValue = cutoff, getParams = TRUE,
              xNew = data.frame(x=xNew, w = wNew),
              xContrast = data.frame(x=xContrast, w = wContrast),
              optimArgs = list(method = "BFGS"))

test_that(paste0("test returnValue for POT"), {
    expect_lt(max(abs(fitp$returnValue - c(rv1,rv2))), .03) 
})

test_that(paste0("test returnValue for POT"), {
    expect_lt(max(abs(fitp$returnValue - c(rv1,rv2)) / fitp$se_returnValue), 2) 
})
test_that(paste0("test returnValue for POT"), {
    expect_lt(max(abs(exp(fitp$logReturnProb) - c(p1,p2))), .009) 
})
test_that(paste0("test returnValue for POT"), {
    expect_lt(max(abs(fitp$logReturnProb - log(c(p1,p2))) / fitp$se_logReturnProb), (2)) 
})

test_that(paste0("test params for GEV vs. POT"), {
    expect_lt(max(abs(fitg$mle - fitp$mle)), .07) 
})

# assessment of std error via massive simulation

set.seed(1)
m <- 500
outg <- list()
raw <- list()
NAval <- as.numeric(NA)
outg$rp <- matrix(NAval, m, 2)
outg$rv <- matrix(NAval, m, 2)
outg$rpd <- outg$rvd <- rep(NAval, m)
outg$par <- matrix(NAval, m, 9)

outg$se_rp <- matrix(NAval, m, 2)
outg$se_rv <- matrix(NAval, m, 2)
outg$se_rpd <- outg$rvd <- rep(NAval, m)
outg$se_par <- matrix(NAval, m, 9)

raw$rp <- matrix(NAval, m, 2)
raw$rv <- matrix(NAval, m, 2)
raw$rpd <- rep(NAval,m)
raw$rvd <- rep(NAval, m)

outp <- outg

for(i in 1:m) {
    nT <- 200
    nObs <- 300
    mn <- rep(c(-0.15,.15), each = nT*nObs/2)
    y <- matrix(rnorm(nT*nObs, mn),  nrow = nObs)
    
    grps <- rep(c(1,2), each = nT*nObs/2)
    yrgrps <- rep(c(1,2), each = nT/2)
    yMax <- apply(y, 2, max)
    
    blockIndex <- matrix(rep(1:nT, nObs), nrow = nObs, byrow = TRUE)
    thr <- quantile(y, 0.98)
    wh <- y > thr
    yExc <- y[wh]
    blockIndexObs <- blockIndex[wh]
    index <- (1:(nT*nObs))[wh]
    
    cutoff <- 3.25
    raw$rp[i,1] = mean(yMax[yrgrps==1] > cutoff)
    raw$rp[i,2] = mean(yMax[yrgrps==2] > cutoff)
    raw$rpd[i] = log(raw$rp[i,1])-log(raw$rp[i,2])
    #se1 = sqrt(p1*(1-p1)/(nT/2))
    #se2 = sqrt(p2*(1-p2)/(nT/2))
    
    rper = 20
    raw$rv[i,1] = quantile(yMax[yrgrps==1], 1-1/rper)
    raw$rv[i,2] = quantile(yMax[yrgrps==2], 1-1/rper)
    raw$rvd[i] = raw$rv[i,1]-raw$rv[i,2]

    x <- rep(c(0,1), each = nT/2)
    w <- rnorm(nT)
    
    xNew = c(0,1)
    wNew = c(0,0)
    xContrast = rev(xNew)
    wContrast = wNew
    
    fitg = fit_gev(yMax, x = data.frame(x=x, w = w), locationFun = ~x + w, scaleFun = ~x+w,
                   shapeFun = ~x + w, scaling = 1/2,
                   returnPeriod = rper, returnValue = cutoff,
                   xNew = data.frame(x=xNew, w = wNew), getParams = TRUE,
                   xContrast = data.frame(x=xContrast, w = wContrast),
                   optimArgs = list(method = "BFGS"))
    
   
    fitp = fit_pot(yExc, x = data.frame(x=x, w = w), threshold = thr, locationFun = ~x + w, scaleFun = ~x+w,
                   shapeFun = ~x + w, scaling = 1/2, nBlocks = nT, blockIndex = blockIndexObs, index = index,
                   returnPeriod = rper, returnValue = cutoff, getParams = TRUE,
                   xNew = data.frame(x=xNew, w = wNew),
                   xContrast = data.frame(x=xContrast, w = wContrast),
                   optimArgs = list(method = "BFGS"))

    if(!fitg$info$failure) {
        outg$rv[i,] <- fitg$returnValue
        outg$rp[i,] <- fitg$logReturnProb
        outg$rpd[i] <- fitg$logReturnProbDiff[1]
        outg$rvd[i] <- fitg$returnValueDiff[1]
        outg$par[i,] <- fitg$mle
        outg$se_rv[i,] <- fitg$se_returnValue
        outg$se_rp[i,] <- fitg$se_logReturnProb
        outg$se_rpd[i] <- fitg$se_logReturnProbDiff[1]
        outg$se_rvd[i] <- fitg$se_returnValueDiff[1]
        outg$se_par[i,] <- fitg$se_mle
    }
    if(!fitp$info$failure){
        outp$rv[i,] <- fitp$returnValue
        outp$rp[i,] <- fitp$logReturnProb
        outp$rpd[i] <- fitp$logReturnProbDiff[1]
        outp$rvd[i] <- fitp$returnValueDiff[1]
        outp$par[i,] <- fitp$mle
        outp$se_rv[i,] <- fitp$se_returnValue
        outp$se_rp[i,] <- fitp$se_logReturnProb
        outp$se_rpd[i] <- fitp$se_logReturnProbDiff[1]
        outp$se_rvd[i] <- fitp$se_returnValueDiff[1]
        outp$se_par[i,] <- fitp$se_mle
    }
}

# now assess var(values) against avg var
sd <- apply(outg$par, 2, sd, na.rm = TRUE)
se <- apply(outg$se_par, 2, mean, na.rm = TRUE)
test_that(paste0("test se(mle) for GEV"), {
    expect_lt(max(sd - se), .01) 
})

sd <- apply(outg$rv, 2, sd, na.rm = TRUE)
se <- apply(outg$se_rv, 2, mean, na.rm = TRUE)
test_that(paste0("test se(returnValue) for GEV"), {
    expect_lt(max(abs(sd - se)), .02) 
})

sd <- sd(outg$rvd, na.rm = TRUE)
se <- mean(outg$se_rvd, na.rm = TRUE)
test_that(paste0("test se(returnValueDiff) for GEV"), {
    expect_lt(abs(sd - se), .015) 
})

sd <- apply(outg$rp, 2, sd, na.rm = TRUE)
se <- apply(outg$se_rp, 2, mean, na.rm = TRUE)
test_that(paste0("test se(returnProb) for smaller prob for GEV"), {
    expect_lt(abs(sd[1] - se[1]), .04) 
})

sd <- sd(outg$rpd, na.rm = TRUE)
se <- mean(outg$se_rpd, na.rm = TRUE)
test_that(paste0("test se(returnProbDiff) for GEV"), {
    expect_lt(abs(sd - se), .04) 
})

sd <- apply(outp$par, 2, sd, na.rm = TRUE)
se <- apply(outp$se_par, 2, mean, na.rm = TRUE)
test_that(paste0("test se(mle) for POT"), {
    expect_lt(max(abs(sd - se)), .007) 
})

sd <- apply(outp$rv, 2, sd, na.rm = TRUE)
se <- apply(outp$se_rv, 2, mean, na.rm = TRUE)
test_that(paste0("test se(returnValue) for POT"), {
    expect_lt(max(abs(sd - se)), .015) 
})

sd <- sd(outp$rvd, na.rm = TRUE)
se <- mean(outp$se_rvd, na.rm = TRUE)
test_that(paste0("test se(returnValueDiff) for POT"), {
    expect_lt(abs(sd - se), .015) 
})

sd <- apply(outp$rp, 2, sd, na.rm = TRUE)
se <- apply(outp$se_rp, 2, mean, na.rm = TRUE)
test_that(paste0("test se(returnProb) for smaller prob for POT"), {
    expect_lt(abs(sd[1] - se[1]), .03) 
})

sd <- sd(outp$rpd, na.rm = TRUE)
se <- mean(outp$se_rpd, na.rm = TRUE)
test_that(paste0("test se(returnProbDiff) for POT"), {
    expect_lt(abs(sd - se), .05) 
})
  

# comparison of bootstrap and asymptotic std error

set.seed(1)
nT <- 500
nObs <- 300
mn <- rep(c(-0.25,.25), each = nT*nObs/2)
y <- matrix(rnorm(nT*nObs, mn),  nrow = nObs)

grps <- rep(c(1,2), each = nT*nObs/2)
yrgrps <- rep(c(1,2), each = nT/2)
yMax <- apply(y, 2, max)

blockIndex <- matrix(rep(1:nT, nObs), nrow = nObs, byrow = TRUE)
thr <- quantile(y, 0.98)
wh <- y > thr
yExc <- y[wh]
blockIndexObs <- blockIndex[wh]
index <- (1:(nT*nObs))[wh]

cutoff <- 3.25
p1 = mean(yMax[yrgrps==1] > cutoff)
p2 = mean(yMax[yrgrps==2] > cutoff)
rpd = log(p1)-log(p2)
se1 = sqrt(p1*(1-p1)/(nT/2))
se2 = sqrt(p2*(1-p2)/(nT/2))

rp = 20
rv1 = quantile(yMax[yrgrps==1], 1-1/rp)
rv2 = quantile(yMax[yrgrps==2], 1-1/rp)
rvd = rv1 - rv2

x <- rep(c(0,1), each = nT/2)
w <- rnorm(nT)

xNew = c(0,1)
wNew = c(0,0)
xContrast = rev(xNew)
wContrast = wNew

fitg = fit_gev(yMax, x = data.frame(x=x, w = w), locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1/2,
               returnPeriod = rp, returnValue = cutoff,
               xNew = data.frame(x=xNew, w = wNew), getParams = TRUE,
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"), bootSE = TRUE, bootControl = list(n=500))

fitp = fit_pot(yExc, x = data.frame(x=x, w = w), threshold = thr, locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1/2, nBlocks = nT, blockIndex = blockIndexObs, index = index,
               returnPeriod = rp, returnValue = cutoff, getParams = TRUE,
               xNew = data.frame(x=xNew, w = wNew),
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"), bootSE = TRUE, bootControl = list(n=500))

# for one dataset of reasonable size compare boot and asympt std error

test_that(paste0("test bootstrap se(mle) for GEV"), {
    expect_lt(max(abs(fitg$se_mle - fitg$se_mle_boot)), .02) 
})
test_that(paste0("test bootstrap se(returnValue) for GEV"), {
    expect_lt(max(abs(fitg$se_returnValue - fitg$se_returnValue_boot)), .007) 
})
test_that(paste0("test bootstrap se(returnValueDiff) for GEV"), {
    expect_lt(max(abs(fitg$se_returnValueDiff - fitg$se_returnValueDiff_boot)), .005) 
})
test_that(paste0("test bootstrap se(returnProb) for GEV"), {
    expect_lt(max(abs(fitg$se_logReturnProb - fitg$se_logReturnProb_boot)), .03) 
})
test_that(paste0("test bootstrap se(returnProbDiff) for GEV"), {
    expect_lt(max(abs(fitg$se_logReturnProbDiff - fitg$se_logReturnProbDiff_boot)), .02) 
})

test_that(paste0("test bootstrap se(mle) for POT"), {
    expect_lt(max(abs(fitp$se_mle - fitp$se_mle_boot)), .005) 
})
test_that(paste0("test bootstrap se(returnValue) for POT"), {
    expect_lt(max(abs(fitp$se_returnValue - fitp$se_returnValue_boot)), .01) 
})
test_that(paste0("test bootstrap se(returnValueDiff) for POT"), {
    expect_lt(max(abs(fitp$se_returnValueDiff - fitp$se_returnValueDiff_boot)), .004) 
})
test_that(paste0("test bootstrap se(returnProb) for POT"), {
    expect_lt(max(abs(fitp$se_logReturnProb - fitp$se_logReturnProb_boot)), .05) 
})
test_that(paste0("test bootstrap se(returnProbDiff) for POT"), {
    expect_lt(max(abs(fitp$se_logReturnProbDiff - fitp$se_logReturnProbDiff_boot)), .05) 
})

# removal of runs

context("Testing declustering with fitting.")

cutoff <- 3.25
rp = 20

set.seed(1)
nT <- 24
nObs <- 50
mn <- rep(c(-0.25,.25), each = nT*nObs/2)
y <- matrix(rnorm(nT*nObs, mn),  nrow = nObs)
y[(nObs-2):nObs,nT] <- runif(3, cutoff, cutoff + .1)

grps <- rep(c(1,2), each = nT*nObs/2)
yrgrps <- rep(c(1,2), each = nT/2)
yMax <- apply(y, 2, max)

blockIndex <- matrix(rep(1:nT, nObs), nrow = nObs, byrow = TRUE)
thr <- quantile(y, 0.93)
wh <- y > thr
yExc <- y[wh]
blockIndexObs <- blockIndex[wh]
index <- (1:(nT*nObs))[wh]


x <- rep(c(0,1), each = nT/2)
w <- rnorm(nT)

xNew = c(0,1)
wNew = c(0,0)
xContrast = rev(xNew)
wContrast = wNew

fitp1 = fit_pot(yExc, x = data.frame(x=x, w = w), threshold = thr, locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1/2, nBlocks = nT, blockIndex = blockIndexObs, index = index,
               returnPeriod = rp, returnValue = cutoff, getParams = TRUE,
               xNew = data.frame(x=xNew, w = wNew), declustering = 'noruns',
               xContrast = data.frame(x=xContrast, w = wContrast), optimArgs = list(method = 'BFGS'))


rms <- c(17, 26, 32, 34, 35, 40, 61, 82, 83) # c(31,43,61,76,83,84) for set.seed(0)
nnew <- length(yExc) - length(rms)
smp = sample(1:nnew, nnew, replace = FALSE)
yExc2 <- yExc[-rms][smp]
blockIndexObs2 <- blockIndexObs[-rms][smp]
index2 <- index[-rms][smp]

fitp2 = fit_pot(yExc2, x = data.frame(x=x, w = w), threshold = thr, locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1/2, nBlocks = nT, blockIndex = blockIndexObs2, index = index2,
               returnPeriod = rp, returnValue = cutoff, getParams = TRUE,
               xNew = data.frame(x=xNew, w = wNew), declustering = 'noruns',
               xContrast = data.frame(x=xContrast, w = wContrast), optimArgs = list(method = 'BFGS'))

test_that(paste0("test use of 'noruns' for POT"), {
    expect_identical(fitp1, fitp2)
})


fitp3 = fit_pot(yExc, x = data.frame(x=x, w = w), threshold = thr, locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1/2, nBlocks = nT, blockIndex = blockIndexObs, index = index,
               returnPeriod = rp, returnValue = cutoff, getParams = TRUE,
               xNew = data.frame(x=xNew, w = wNew), declustering = 10,
               xContrast = data.frame(x=xContrast, w = wContrast), optimArgs = list(method = 'BFGS'))


rms <- c(3, 8, 17, 19, 22, 26, 27, 32, 33, 34, 35, 38, 40, 43, 48, 50, 55, 57, 61, 64, 70, 74, 77, 80, 81, 82, 83) # c(8,27,31,35,43,47,49,51,54,58,61,65,72,73,75,76,80,83,84) for set.seed(0)
nnew <- length(yExc) - length(rms)
smp = seq_len(nnew) # sample(1:nnew, nnew, replace = FALSE)  # with seed of 1, shuffling gives very slightly different numerical values
yExc4 <- yExc[-rms][smp]
blockIndexObs4 <- blockIndexObs[-rms][smp]
index4 <- index[-rms][smp]

fitp4 = fit_pot(yExc4, x = data.frame(x=x, w = w), threshold = thr, locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1/2, nBlocks = nT, blockIndex = blockIndexObs4, index = index4,
               returnPeriod = rp, returnValue = cutoff, getParams = TRUE,
               xNew = data.frame(x=xNew, w = wNew), declustering = 'noruns',
               xContrast = data.frame(x=xContrast, w = wContrast), optimArgs = list(method = 'BFGS'))

test_that(paste0("test use of screen within block for POT"), {
    expect_identical(fitp3, fitp4)
})

# test of weights

context("Testing use of weights.")

set.seed(1)
nT <- 100
nObs <- 100
mn <- rep(c(-0.25,.25), each = nT*nObs/2)
y <- matrix(rnorm(nT*nObs, mn),  nrow = nObs)

grps <- rep(c(1,2), each = nT*nObs/2)
yrgrps <- rep(c(1,2), each = nT/2)
yMax <- apply(y, 2, max)

blockIndex <- matrix(rep(1:nT, nObs), nrow = nObs, byrow = TRUE)
thr <- quantile(y, 0.98)
wh <- y > thr
yExc <- y[wh]
blockIndexObs <- blockIndex[wh]
index <- (1:(nT*nObs))[wh]

cutoff <- 3.25
p1 = mean(yMax[yrgrps==1] > cutoff)
p2 = mean(yMax[yrgrps==2] > cutoff)
rpd = log(p1)-log(p2)
se1 = sqrt(p1*(1-p1)/(nT/2))
se2 = sqrt(p2*(1-p2)/(nT/2))

rp = 20
rv1 = quantile(yMax[yrgrps==1], 1-1/rp)
rv2 = quantile(yMax[yrgrps==2], 1-1/rp)
rvd = rv1 - rv2

x <- rep(c(0,1), each = nT/2)
w <- rnorm(nT)

xNew = c(0,1)
wNew = c(0,0)
xContrast = rev(xNew)
wContrast = wNew

weights <- c(rep(1,10), rep(2, nT-10))

# need initial values as weights/propMiss not used in initial param estimation in fevd
inits = list(location = c(2, 0, 0), scale = c(-1.2, 0, 0), shape = c(.04, 0, 0))

fitg = fit_gev(yMax, x = data.frame(x=x, w = w), locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1, weights = weights,
               returnPeriod = rp, returnValue = cutoff,
               xNew = data.frame(x=xNew, w = wNew), getParams = TRUE,
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"), .normalizeX = FALSE, initial = inits)

fitp = fit_pot(yExc, x = data.frame(x=x, w = w), threshold = thr, locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1, nBlocks = nT, blockIndex = blockIndexObs,
               returnPeriod = rp, returnValue = cutoff, getParams = TRUE,
               xNew = data.frame(x=xNew, w = wNew), weights = weights,
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"), .normalizeX = FALSE, initial = inits)

yExc2 <- c(yExc, yExc[weights[blockIndexObs] == 2])
blockIndexObs2 <- c(blockIndexObs, blockIndexObs[weights[blockIndexObs] == 2])
x2 <- c(x, x[weights==2])
w2 <- c(w, w[weights==2])
nT2 <- nT + sum(weights==2)
yMax2 <- c(yMax , yMax[weights==2])

fitg2 = fit_gev(yMax2, x = data.frame(x=x2, w = w2), locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1, 
               returnPeriod = rp, returnValue = cutoff,
               xNew = data.frame(x=xNew, w = wNew), getParams = TRUE,
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"), .normalizeX = FALSE, initial = inits)

fitp2 = fit_pot(yExc2, x = data.frame(x=x2, w = w2), threshold = thr, locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1, nBlocks = nT2, blockIndex = blockIndexObs2,
               returnPeriod = rp, returnValue = cutoff, getParams = TRUE,
               xNew = data.frame(x=xNew, w = wNew), 
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"), .normalizeX = FALSE, initial = inits)

test_that(paste0("test weights for GEV"), {
    expect_equal(fitg, fitg2)
})
test_that(paste0("test weights for POT"), {
    expect_equal(fitp, fitp2)
})

# min/max and upper/lower tail

context("Testing use of lower tail.")

set.seed(1)
nT <- 100
nObs <- 100
mn <- rep(c(-0.25,.25), each = nT*nObs/2)
y <- matrix(rnorm(nT*nObs, mn),  nrow = nObs)

grps <- rep(c(1,2), each = nT*nObs/2)
yrgrps <- rep(c(1,2), each = nT/2)
yMin <- apply(y, 2, min)

blockIndex <- matrix(rep(1:nT, nObs), nrow = nObs, byrow = TRUE)
thr <- quantile(y, .02)
wh <- y < thr
yExc <- y[wh]
blockIndexObs <- blockIndex[wh]
index <- (1:(nT*nObs))[wh]

cutoff <- -3.25
p1 = mean(yMax[yrgrps==1] > cutoff)
p2 = mean(yMax[yrgrps==2] > cutoff)
rpd = log(p1)-log(p2)
se1 = sqrt(p1*(1-p1)/(nT/2))
se2 = sqrt(p2*(1-p2)/(nT/2))

rp = 20
rv1 = quantile(yMax[yrgrps==1], 1-1/rp)
rv2 = quantile(yMax[yrgrps==2], 1-1/rp)
rvd = rv1 - rv2

x <- rep(c(0,1), each = nT/2)
w <- rnorm(nT)

xNew = c(0,1)
wNew = c(0,0)
xContrast = rev(xNew)
wContrast = wNew

fitg = fit_gev(yMin, x = data.frame(x=x, w = w), locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1,
               returnPeriod = rp, returnValue = cutoff,
               xNew = data.frame(x=xNew, w = wNew), getParams = TRUE,
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"), .normalizeX = FALSE, maxes = FALSE)

fitg2 = fit_gev(-yMin, x = data.frame(x=x, w = w), locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1,
               returnPeriod = rp, returnValue = -cutoff,
               xNew = data.frame(x=xNew, w = wNew), getParams = TRUE,
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"), .normalizeX = FALSE)

fitp = fit_pot(yExc, x = data.frame(x=x, w = w), threshold = thr, locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1, nBlocks = nT, blockIndex = blockIndexObs,
               returnPeriod = rp, returnValue = cutoff, getParams = TRUE,
               xNew = data.frame(x=xNew, w = wNew),
               xContrast = data.frame(x=xContrast, w = wContrast), upperTail = FALSE,
               optimArgs = list(method = "BFGS"), .normalizeX = FALSE, initial = inits)

fitp2 = fit_pot(-yExc, x = data.frame(x=x, w = w), threshold = -thr, locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1, nBlocks = nT, blockIndex = blockIndexObs,
               returnPeriod = rp, returnValue = -cutoff, getParams = TRUE,
               xNew = data.frame(x=xNew, w = wNew),
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"), .normalizeX = FALSE, initial = inits)

fitg2$mle[1:3] <- -fitg2$mle[1:3]
test_that(paste0("test min/lower for GEV"), {
    expect_identical(fitg, fitg2)
})

fitp2$mle[1:3] <- -fitp2$mle[1:3]
test_that(paste0("test min/lower for GEV"), {
    expect_identical(fitp, fitp2)
})

# test of proportionMissing

context("Testing use of proportionMissing.")

set.seed(1)
nT <- 100
nObs <- 100
mn <- rep(c(-0.25,.25), each = nT*nObs/2)
y <- matrix(rnorm(nT*nObs, mn),  nrow = nObs)

grps <- rep(c(1,2), each = nT*nObs/2)
yrgrps <- rep(c(1,2), each = nT/2)
yMax <- apply(y, 2, max)

blockIndex <- matrix(rep(1:nT, nObs), nrow = nObs, byrow = TRUE)
thr <- quantile(y, 0.98)
wh <- y > thr
yExc <- y[wh]
blockIndexObs <- blockIndex[wh]
index <- (1:(nT*nObs))[wh]

cutoff <- 3.25
p1 = mean(yMax[yrgrps==1] > cutoff)
p2 = mean(yMax[yrgrps==2] > cutoff)
rpd = log(p1)-log(p2)
se1 = sqrt(p1*(1-p1)/(nT/2))
se2 = sqrt(p2*(1-p2)/(nT/2))

rp = 20
rv1 = quantile(yMax[yrgrps==1], 1-1/rp)
rv2 = quantile(yMax[yrgrps==2], 1-1/rp)
rvd = rv1 - rv2

x <- rep(c(0,1), each = nT/2)
w <- rnorm(nT)

xNew = c(0,1)
wNew = c(0,0)
xContrast = rev(xNew)
wContrast = wNew

# need initial values as weights/propMiss not used in initial param estimation in fevd
inits = list(location = c(2, 0, 0), scale = c(-1.2, 0, 0), shape = c(.04, 0, 0))

fitp = fit_pot(yExc, x = data.frame(x=x, w = w), threshold = thr, locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1, nBlocks = nT, blockIndex = blockIndexObs,
               returnPeriod = rp, returnValue = cutoff, getParams = TRUE,
               xNew = data.frame(x=xNew, w = wNew), proportionMissing = 0.5,
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"), .normalizeX = FALSE, initial = inits)

yExc2 <- c(yExc, yExc)
blockIndexObs2 <- c(blockIndexObs, blockIndexObs)
weights = rep(0.5, nT)

fitp2 = fit_pot(yExc2, x = data.frame(x=x, w = w), threshold = thr, locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1, nBlocks = nT, blockIndex = blockIndexObs2,
               returnPeriod = rp, returnValue = cutoff, getParams = TRUE,
               xNew = data.frame(x=xNew, w = wNew), weights = weights,
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"), .normalizeX = FALSE, initial = inits)

test_that(paste0("test proportionMissing for POT"), {
    expect_equal(fitp, fitp2)
})

# just test it runs with vector proportionMissing
fitp = fit_pot(yExc, x = data.frame(x=x, w = w), threshold = thr, locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1, nBlocks = nT, blockIndex = blockIndexObs,
               returnPeriod = rp, returnValue = cutoff, getParams = TRUE,
               xNew = data.frame(x=xNew, w = wNew), proportionMissing = runif(nT, 0, 0.2),
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"), .normalizeX = FALSE, initial = inits)

test_that(paste0("test vector proportionMissing for POT"), {
    expect_equal(length(fitp$mle), 9)
})

# test of replication 

context("Testing use of replication.")

set.seed(1)
nT <- 100
nObs <- 100
mn <- rep(c(-0.25,.25), each = nT*nObs/2)
y <- matrix(rnorm(nT*nObs, mn),  nrow = nObs)

grps <- rep(c(1,2), each = nT*nObs/2)
yrgrps <- rep(c(1,2), each = nT/2)
yMax <- apply(y, 2, max)

blockIndex <- matrix(rep(1:nT, nObs), nrow = nObs, byrow = TRUE)
thr <- quantile(y, 0.98)
wh <- y > thr
yExc <- y[wh]
blockIndexObs <- blockIndex[wh]
index <- (1:(nT*nObs))[wh]

cutoff <- 3.25
p1 = mean(yMax[yrgrps==1] > cutoff)
p2 = mean(yMax[yrgrps==2] > cutoff)
rpd = log(p1)-log(p2)
se1 = sqrt(p1*(1-p1)/(nT/2))
se2 = sqrt(p2*(1-p2)/(nT/2))

rp = 20
rv1 = quantile(yMax[yrgrps==1], 1-1/rp)
rv2 = quantile(yMax[yrgrps==2], 1-1/rp)
rvd = rv1 - rv2

x <- rep(c(0,1), each = nT/2)
w <- rnorm(nT)

xNew = c(0,1)
wNew = c(0,0)
xContrast = rev(xNew)
wContrast = wNew

yExc4 <- rep(yExc, 4)
blockIndexObs4 <- rep(blockIndexObs, 4)
x4 <- rep(x,4)
w4 <- rep(w,4)
yMax4 <- rep(yMax, 4)
replicateIndex <- rep(1:4, each = length(yExc))

weights = runif(nT, 0.5, 1.5)
pm = runif(nT, 0, 0.3)

fitg = fit_gev(yMax, x = data.frame(x=x, w = w), locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1,
               returnPeriod = rp, returnValue = cutoff,
               xNew = data.frame(x=xNew, w = wNew), getParams = TRUE,
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"), .normalizeX = FALSE)

fitg2 = fit_gev(yMax4, x = data.frame(x=x, w = w), locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1, nReplicates = 4,
               returnPeriod = rp, returnValue = cutoff, 
               xNew = data.frame(x=xNew, w = wNew), getParams = TRUE,
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"), .normalizeX = FALSE)

fitg3 = fit_gev(yMax4, x = data.frame(x=x4, w = w4), locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1, nReplicates = 4,
               returnPeriod = rp, returnValue = cutoff, 
               xNew = data.frame(x=xNew, w = wNew), getParams = TRUE,
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"), .normalizeX = FALSE)


# MLEs should be same with duplicated data
test_that(paste0("test replication MLE equivalence for GEV"), {
    expect_lt(max(abs(fitg$mle - fitg2$mle)), 1e-4)
})
test_that(paste0("test replication MLE equivalence for GEV"), {
    expect_lt(max(abs(fitg$returnValue - fitg2$returnValue)), 1e-4)
})
test_that(paste0("test replication MLE equivalence for GEV"), {
    expect_lt(max(abs(fitg$logReturnProb - fitg2$logReturnProb)), 3e-4)
})

# SE should scale by 2
tmp <- round(fitg$se_mle/fitg2$se_mle, 3)
names(tmp) <- NULL
test_that(paste0("test replication SE scales for GEV"), {
    expect_equal(tmp, rep(2, 9))
})
tmp <- round(fitg$se_returnValue/fitg2$se_returnValue, 3)
names(tmp) <- NULL
test_that(paste0("test replication SE scales for GEV"), {
    expect_equal(tmp, rep(2, 2))
})
tmp <- round(fitg$se_logReturnProb/fitg2$se_logReturnProb, 3)
names(tmp) <- NULL
test_that(paste0("test replication SE scales for GEV"), {
    expect_equal(tmp, rep(2, 2))
})
test_that(paste0("test replication with and without replicated X for GEV"), {
    expect_identical(fitg2, fitg3)
})


fitp = fit_pot(yExc, x = data.frame(x=x, w = w), threshold = thr, locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1, nBlocks = nT, blockIndex = blockIndexObs,
               returnPeriod = rp, returnValue = cutoff, getParams = TRUE,
               xNew = data.frame(x=xNew, w = wNew), 
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"), .normalizeX = FALSE)

fitp2 = fit_pot(yExc4, x = data.frame(x=x, w = w), threshold = thr, locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1, nBlocks = nT, nReplicates = 4, blockIndex = blockIndexObs4,
               returnPeriod = rp, returnValue = cutoff, getParams = TRUE,
               xNew = data.frame(x=xNew, w = wNew), replicateIndex = replicateIndex,
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"), .normalizeX = FALSE)

blockIndexObs4a <- c(blockIndexObs,blockIndexObs+100,blockIndexObs+200,blockIndexObs+300)

fitp3 = fit_pot(yExc4, x = data.frame(x=x4, w = w4), threshold = thr, locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1, nBlocks = nT*4, blockIndex = blockIndexObs4a,
               returnPeriod = rp, returnValue = cutoff, getParams = TRUE,
               xNew = data.frame(x=xNew, w = wNew), 
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"), .normalizeX = FALSE)


# MLEs should be same with duplicated data
test_that(paste0("test replication MLE equivalence for POT"), {
    expect_lt(max(abs(fitp$mle - fitp2$mle)), 1e-4)
})
test_that(paste0("test replication MLE equivalence for POT"), {
    expect_lt(max(abs(fitp$returnValue - fitp2$returnValue)), 1e-4)
})
test_that(paste0("test replication MLE equivalence for POT"), {
    expect_lt(max(abs(fitp$logReturnProb - fitp2$logReturnProb)), 5e-4)
})

# SE should scale by 2
tmp <- round(fitp$se_mle/fitp2$se_mle, 3)
names(tmp) <- NULL
test_that(paste0("test replication SE scales for POT"), {
    expect_equal(tmp, rep(2, 9))
})
tmp <- round(fitp$se_returnValue/fitp2$se_returnValue, 2)
names(tmp) <- NULL
test_that(paste0("test replication SE scales for POT"), {
    expect_equal(tmp, rep(2, 2))
})
tmp <- round(fitp$se_logReturnProb/fitp2$se_logReturnProb, 3)
names(tmp) <- NULL
test_that(paste0("test replication SE scales for POT"), {
    expect_equal(tmp, rep(2, 2))
})
test_that(paste0("test replication with and without replicated X for POT"), {
    expect_identical(fitp2, fitp3)
})


# test of replication + weights + proportion missing with and without duplication

fitg = fit_gev(yMax4, x = data.frame(x=x, w = w), locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1, nReplicates = 4, weights = weights,
               returnPeriod = rp, returnValue = cutoff, 
               xNew = data.frame(x=xNew, w = wNew), getParams = TRUE,
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"), .normalizeX = FALSE)

fitg2 = fit_gev(yMax4, x = data.frame(x=x4, w = w4), locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1, nReplicates = 1, weights = rep(weights, 4),
               returnPeriod = rp, returnValue = cutoff, 
               xNew = data.frame(x=xNew, w = wNew), getParams = TRUE,
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"), .normalizeX = FALSE)

test_that(paste0("test replication with and without replicated X, weights for GEV"), {
    expect_identical(fitg, (fitg2))
})

fitp = fit_pot(yExc4, x = data.frame(x=x, w = w), threshold = thr, locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1, nBlocks = nT, nReplicates = 4, blockIndex = blockIndexObs4,
               weights = weights, proportionMissing = pm,
               returnPeriod = rp, returnValue = cutoff, getParams = TRUE,
               xNew = data.frame(x=xNew, w = wNew), replicateIndex = replicateIndex,
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"), .normalizeX = FALSE)

fitp2 = fit_pot(yExc4, x = data.frame(x=x, w = w), threshold = thr, locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1, nBlocks = nT, nReplicates =4, blockIndex = blockIndexObs4,
               weights = matrix(rep(weights, 4), ncol = 4), proportionMissing = matrix(rep(pm, 4), ncol = 4),
               replicateIndex = replicateIndex,
               returnPeriod = rp, returnValue = cutoff, getParams = TRUE,
               xNew = data.frame(x=xNew, w = wNew), 
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"), .normalizeX = FALSE)

fitp3 = fit_pot(yExc4, x = data.frame(x=x4, w = w4), threshold = thr, locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1, nBlocks = nT*4, blockIndex = blockIndexObs4a,
               weights = matrix(rep(weights, 4), ncol = 4), proportionMissing = matrix(rep(pm, 4), ncol = 4),
               returnPeriod = rp, returnValue = cutoff, getParams = TRUE,
               xNew = data.frame(x=xNew, w = wNew), 
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"), .normalizeX = FALSE)

test_that(paste0("test replication with and without weights, propMiss for POT"), {
    expect_identical(fitp, fitp2)
})
test_that(paste0("test replication with and without replicated X, weights, propMiss for POT"), {
    expect_identical(fitp, fitp3)
})
                                       
# check code works with multiple threshold values

context("Testing use of multiple thresholds.")

set.seed(1)
nT <- 100
nObs <- 100
mn <- rep(c(-0.25,.25), each = nT*nObs/2)
y <- matrix(rnorm(nT*nObs, mn),  nrow = nObs)

blockIndex <- matrix(rep(1:nT, nObs), nrow = nObs, byrow = TRUE)
thr <- quantile(y, 0.98)  
thr <- seq(thr - 0.1, thr + 0.1, length = nT)

wh <- y > thr[blockIndex]
yExc <- y[wh]
blockIndexObs <- blockIndex[wh]
index <- (1:(nT*nObs))[wh]

cutoff <- 3.25

rp = 20

x <- rep(c(0,1), each = nT/2)
w <- rnorm(nT)

xNew = c(0,1)
wNew = c(0,0)
xContrast = rev(xNew)
wContrast = wNew


fitp <- fit_pot(yExc, x = data.frame(x=x, w = w), threshold = thr, locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1, nBlocks = nT, blockIndex = blockIndexObs,
               returnPeriod = rp, returnValue = cutoff, getParams = TRUE,
               xNew = data.frame(x=xNew, w = wNew), 
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"), .normalizeX = FALSE)

test_that(paste0("test vector threshold for POT"), {
    expect_equal(length(fitp$mle), 9)
})

# test of bootstrapping with by='replicate' or by='joint'

context("Testing bootstrapping with various resampling patterns.")

set.seed(1)
nT <- 100
nObs <- 100
mn <- rep(c(-0.25,.25), each = nT*nObs/2)
y <- matrix(rnorm(nT*nObs, mn),  nrow = nObs)

grps <- rep(c(1,2), each = nT*nObs/2)
yrgrps <- rep(c(1,2), each = nT/2)
yMax <- apply(y, 2, max)

blockIndex <- matrix(rep(1:nT, nObs), nrow = nObs, byrow = TRUE)
thr <- quantile(y, 0.98)
wh <- y > thr
yExc <- y[wh]
blockIndexObs <- blockIndex[wh]
index <- (1:(nT*nObs))[wh]

cutoff <- 3.25
p1 = mean(yMax[yrgrps==1] > cutoff)
p2 = mean(yMax[yrgrps==2] > cutoff)
rpd = log(p1)-log(p2)
se1 = sqrt(p1*(1-p1)/(nT/2))
se2 = sqrt(p2*(1-p2)/(nT/2))

rp = 20
rv1 = quantile(yMax[yrgrps==1], 1-1/rp)
rv2 = quantile(yMax[yrgrps==2], 1-1/rp)
rvd = rv1 - rv2

x <- rep(c(0,1), each = nT/2)
w <- rnorm(nT)

xNew = c(0,1)
wNew = c(0,0)
xContrast = rev(xNew)
wContrast = wNew

yExc4 <- rep(yExc, 4)
blockIndexObs4 <- rep(blockIndexObs, 4)
x4 <- rep(x,4)
w4 <- rep(w,4)
yMax4 <- rep(yMax, 4)
replicateIndex <- rep(1:4, each = length(yExc))

weights = runif(nT, 0.5, 1.5)
pm = runif(nT, 0, 0.3)

fitg = fit_gev(yMax4, x = data.frame(x=x, w = w), locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1, nReplicates = 4, weights = weights,
               returnPeriod = rp, returnValue = cutoff, replicateIndex = rep(1:4, each = nT),
               xNew = data.frame(x=xNew, w = wNew), getParams = TRUE,
               xContrast = data.frame(x=xContrast, w = wContrast),
               bootSE = TRUE, bootControl = list(by = 'block', n = 50),
               optimArgs = list(method = "BFGS"))

fitg2 = fit_gev(yMax4, x = data.frame(x=x4, w = w4), locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1, nReplicates = 4, weights = rep(weights, 4), 
               returnPeriod = rp, returnValue = cutoff, replicateIndex = rep(1:4, each = nT),
               xNew = data.frame(x=xNew, w = wNew), getParams = TRUE,
               xContrast = data.frame(x=xContrast, w = wContrast),
               bootSE = TRUE, bootControl = list(by = 'block', n = 50),
               optimArgs = list(method = "BFGS"))

test_that(paste0("test by-block bootstrap with weights for GEV"), {
    expect_identical(fitg, (fitg2))
})

# by = 'replicate'
# should get zero as boot SEs as resampled datasets are same as original dataset
fitg = fit_gev(yMax4, x = data.frame(x=x, w = w), locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1, nReplicates = 4, weights = weights,
               returnPeriod = rp, returnValue = cutoff, replicateIndex = rep(1:4, each = nT),
               xNew = data.frame(x=xNew, w = wNew), getParams = TRUE,
               xContrast = data.frame(x=xContrast, w = wContrast),
               bootSE = TRUE, bootControl = list(by = 'replicate', n = 50),
               optimArgs = list(method = "BFGS"))


test_that(paste0("test by-block bootstrap with weights for GEV"), {
    expect_identical(range(fitg$se_mle_boot), c(0,0))
})

yMax4 <- yMax4 + rnorm(nT*4, 0, 0.1)
fitg = fit_gev(yMax4, x = data.frame(x=x, w = w), locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1, nReplicates = 4, weights = weights,
               returnPeriod = rp, returnValue = cutoff, replicateIndex = rep(1:4, each = nT),
               xNew = data.frame(x=xNew, w = wNew), getParams = TRUE,
               xContrast = data.frame(x=xContrast, w = wContrast),
               bootSE = TRUE, bootControl = list(by = 'replicate', n = 50),
               optimArgs = list(method = "BFGS"))

fitg2 = fit_gev(yMax4, x = data.frame(x=x4, w = w4), locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1, nReplicates = 4, weights = rep(weights, 4), 
               returnPeriod = rp, returnValue = cutoff, replicateIndex = rep(1:4, each = nT),
               xNew = data.frame(x=xNew, w = wNew), getParams = TRUE,
               xContrast = data.frame(x=xContrast, w = wContrast),
               bootSE = TRUE, bootControl = list(by = 'replicate', n = 50),
               optimArgs = list(method = "BFGS"))

test_that(paste0("test by-replicate bootstrap with weights for GEV"), {
    expect_identical(fitg, fitg2)
})

# by = 'joint'

fitg = fit_gev(yMax4, x = data.frame(x=x, w = w), locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1, nReplicates = 4, weights = weights,
               returnPeriod = rp, returnValue = cutoff, replicateIndex = rep(1:4, each = nT),
               xNew = data.frame(x=xNew, w = wNew), getParams = TRUE,
               xContrast = data.frame(x=xContrast, w = wContrast),
               bootSE = TRUE, bootControl = list(by = 'joint', n = 50),
               optimArgs = list(method = "BFGS"))

fitg2 = fit_gev(yMax4, x = data.frame(x=x4, w = w4), locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x + w, scaling = 1, nReplicates = 4, weights = rep(weights, 4), 
               returnPeriod = rp, returnValue = cutoff, replicateIndex = rep(1:4, each = nT),
               xNew = data.frame(x=xNew, w = wNew), getParams = TRUE,
               xContrast = data.frame(x=xContrast, w = wContrast),
               bootSE = TRUE, bootControl = list(by = 'joint', n = 50),
               optimArgs = list(method = "BFGS"))

test_that(paste0("test by-replicate bootstrap with weights for GEV"), {
    expect_identical(fitg, fitg2)
})

# by-block for POT
cutoff = 3 # instability leads to bounded tail
fitp = fit_pot(yExc4, x = data.frame(x=x, w = w), threshold = thr, locationFun = ~x+w, scaleFun = ~1,
               shapeFun = ~1, scaling = 1, nBlocks = nT, nReplicates = 4, blockIndex = blockIndexObs4,
               weights = weights, proportionMissing = pm,
               returnPeriod = rp, returnValue = cutoff, getParams = TRUE,
               xNew = data.frame(x=xNew, w = wNew), replicateIndex = replicateIndex,
               bootSE = TRUE, bootControl = list(by = 'block', n = 50),
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"))

fitp2 = fit_pot(yExc4, x = data.frame(x=x, w = w), threshold = thr, locationFun = ~x + w, scaleFun = ~1,
               shapeFun = ~1, scaling = 1, nBlocks = nT, nReplicates =4, blockIndex = blockIndexObs4,
               weights = matrix(rep(weights, 4), ncol = 4), proportionMissing = matrix(rep(pm, 4), ncol = 4),
               replicateIndex = replicateIndex,
               returnPeriod = rp, returnValue = cutoff, getParams = TRUE,
               xNew = data.frame(x=xNew, w = wNew), 
               bootSE = TRUE, bootControl = list(by = 'block', n = 50),
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"))

test_that(paste0("test by-block bootstrap with weights, propMiss for POT"), {
    expect_identical(fitp, fitp2)
})


# replicate
yExc4 <- yExc4 + abs(rnorm(nT*4, 0, 0.05)) # need replicates to vary

fitp = fit_pot(yExc4, x = data.frame(x=x, w = w), threshold = thr, locationFun = ~x+w, scaleFun = ~x+w,
               shapeFun = ~x+w, scaling = 1, nBlocks = nT, nReplicates = 4, blockIndex = blockIndexObs4,
               weights = weights, proportionMissing = pm,
               returnPeriod = rp, returnValue = cutoff, getParams = TRUE,
               xNew = data.frame(x=xNew, w = wNew), replicateIndex = replicateIndex,
               bootSE = TRUE, bootControl = list(by = 'replicate', n = 50),
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"))

fitp2 = fit_pot(yExc4, x = data.frame(x=x, w = w), threshold = thr, locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x+w, scaling = 1, nBlocks = nT, nReplicates =4, blockIndex = blockIndexObs4,
               weights = matrix(rep(weights, 4), ncol = 4), proportionMissing = matrix(rep(pm, 4), ncol = 4),
               replicateIndex = replicateIndex,
               returnPeriod = rp, returnValue = cutoff, getParams = TRUE,
               xNew = data.frame(x=xNew, w = wNew), 
               bootSE = TRUE, bootControl = list(by = 'replicate', n = 50),
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"))

test_that(paste0("test by-replicate bootstrap with weights, propMiss for POT"), {
    expect_identical(fitp, fitp2)
})

# joint

fitp = fit_pot(yExc4, x = data.frame(x=x, w = w), threshold = thr, locationFun = ~x+w, scaleFun = ~x+w,
               shapeFun = ~x+w, scaling = 1, nBlocks = nT, nReplicates = 4, blockIndex = blockIndexObs4,
               weights = weights, proportionMissing = pm,
               returnPeriod = rp, returnValue = cutoff, getParams = TRUE,
               xNew = data.frame(x=xNew, w = wNew), replicateIndex = replicateIndex,
               bootSE = TRUE, bootControl = list(by = 'joint', n = 50),
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"))

fitp2 = fit_pot(yExc4, x = data.frame(x=x, w = w), threshold = thr, locationFun = ~x + w, scaleFun = ~x+w,
               shapeFun = ~x+w, scaling = 1, nBlocks = nT, nReplicates =4, blockIndex = blockIndexObs4,
               weights = matrix(rep(weights, 4), ncol = 4), proportionMissing = matrix(rep(pm, 4), ncol = 4),
               replicateIndex = replicateIndex,
               returnPeriod = rp, returnValue = cutoff, getParams = TRUE,
               xNew = data.frame(x=xNew, w = wNew), 
               bootSE = TRUE, bootControl = list(by = 'joint', n = 50),
               xContrast = data.frame(x=xContrast, w = wContrast),
               optimArgs = list(method = "BFGS"))

test_that(paste0("test by-joint bootstrap with weights, propMiss for POT"), {
    expect_identical(fitp, fitp2)
})

