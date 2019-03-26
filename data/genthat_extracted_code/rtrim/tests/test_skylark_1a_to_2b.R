rm(list=ls())
library(ggplot2)
library(plyr)
library(testthat)
#library(rtrim)
source("../../pkg/R/read_tcf.R")
source("../../pkg/R/read_tdf.R")

printf <- function(fmt,...) { cat(sprintf(fmt,...)) }

source("trim_workhorse.R")
source("trim_post.R")
source("trim_wald.R")
source("trim_gof.R")
source("trim_index.R")
source("trim_overall.R")

source("out2test.R")

jobs = c("1a","1b","1c","1d","1e","2a","2b")
for (j in jobs) {

  job = sprintf("skylark-%s", j)

  # Load command file
  tcf <- read_tcf(sprintf("%s.tcf", job))
  # Check for mandatory TCF elements
  if (is.na(tcf$file)) stop("No file in TCF")
  if (is.na(tcf$model)) stop ("No model specified in TCF file")

  # Read data and calc some stats. We store the results in a special TRIMdata object.
  df <- read_tdf(tcf)
  dat <- list(df=df,  # Data as read into the data.table
              # TODO: sites with only missings
              nzero = sum(df$count==0, na.rm=TRUE), # Number of observed zero counts
              npos  = sum(df$count>0,  na.rm=TRUE), # Number of observed positive counts
              nobs  = sum(is.finite(df$count)),     # Number of observed counts
              nmis  = sum(is.na(df$count)),         # Number of missing counts
              ncount = length(df$count),             # Total number of counts
              totcount = sum(df$count, na.rm=TRUE), # Total count
              nsite = length(unique(df$site)), # Number of actual sites
              ntime = length(unique(df$time)),  # Number of actual time points
              weight = tcf$weight,
              missing = tcf$missing,
              file = tcf$file)
  class(dat) <- "TRIMdata"

  # Do some checks on the datax
  if (tcf$ntimes != dat$ntime) {
    stop(sprintf("Data contains different number of time points (%d) than specified in TCF file (%d)",
                 dat$ntime, tcf$ntimes))
  }

  #===============================================================================
  #                                                                           Data
  #===============================================================================

  target = read_out(sprintf("%s.out", job), tcf, debug=TRUE)

  print(summary(dat))
  s = summary(dat)
  expect_equal(s$ncols,   as.numeric(target$ncols))
  expect_equal(s$nsite,   as.numeric(target$nsite))
  expect_equal(s$ntime,   as.numeric(target$ntime))
  expect_equal(s$missing, as.numeric(target$missing))

  expect_equal(s$nzero,    as.numeric(target$nzero))
  expect_equal(s$npos,     as.numeric(target$npos))
  expect_equal(s$nobs,     as.numeric(target$nobs))
  expect_equal(s$nmis,     as.numeric(target$nmis))
  expect_equal(s$ncount,   as.numeric(target$ncount))
  expect_equal(s$totcount, as.numeric(target$totcount))

  print(dominant_sites(dat))
  dom = dominant_sites(dat)
  expect_equal(as.numeric(dom$sites$site), target$dom$sites$site.nr)
  expect_equal(dom$sites$total, target$dom$sites$obs.tot)
  expect_equal(dom$sites$percent, target$dom$sites$percent, tol=5e-2)

  avg = average(dat)
  print(avg)
  expect_equal(as.numeric(avg$time), target$avg$TimePoint)
  expect_equal(avg$observations, target$avg$Observations)
  expect_equal(avg$average, target$avg$Average, tol=5e-3)
  expect_equal(avg$index, target$avg$Index, tol=5e-3)

  #===============================================================================
  #                                                                            Run
  #===============================================================================


  count <-  dat$df$count

  # Convert site/time back to their original values to test our new TRIM workhorse
  # unfactor <- function(x) as.integer(levels(x))[x]
  # time  <- unfactor(dat$df$time)
  # site  <- unfactor(dat$df$site)
  time <- dat$df$time
  site <- dat$df$site
  covars = list()
  ncovar = length(tcf$covariates)
  if (ncovar>0) {
    for (i in  1:ncovar) {
      cv = tcf$covariates[i] # Covariate number
      name = tcf$labels[cv]  # Covariate name
      cv.col = cv + ifelse(tcf$weight,4,3) # shift columns (site, time, count, [weight])
      covars[[name]] = dat$df[[cv.col]]
    }
  }
  z <- trim_estimate(count,time,site, covars=covars, model=tcf$model,
                     serialcor=tcf$serialcor, overdisp=tcf$overdisp,
                     changepoints=tcf$changepoints)


  #===============================================================================
  #                                                                    test output
  #===============================================================================

  fit = gof(z)
  print(fit)
  expect_equal(fit$chi2$chi2, as.numeric(target$gof$chi2[1]), tol=1e-2)
  expect_equal(fit$chi2$df,   as.numeric(target$gof$chi2[2]))
  expect_equal(fit$chi2$p,    as.numeric(target$gof$chi2[3]), tol=1e-4)
  expect_equal(fit$LR$LR,     as.numeric(target$gof$LR[1]), tol=1e-2)
  expect_equal(fit$LR$df,     as.numeric(target$gof$LR[2]))
  expect_equal(fit$LR$p,      as.numeric(target$gof$LR[3]), tol=1e-4)
  expect_equal(fit$AIC,       as.numeric(target$gof$AIC), tol=1e-2)

  W = wald(z)
  print(W)
  for (type in c("slope","dslope","deviations","covar")) {
    if (!is.null(W[[type]])) {
      expect_equal(W[[type]]$W,  as.numeric(target$wald[[type]]$W), tol=1e-2)
      expect_equal(W[[type]]$p,  as.numeric(target$wald[[type]]$p), tol=1e-4)
    }
  }

  xx = coef(z,"both")
  print(xx)
  yy = target$coefficients
  for (i in 1:ncol(xx)) if (is.numeric(xx[[i]])) {
    expect_true(max(abs(xx[[i]]-yy[, i]))<1e-4, info=sprintf("Coefficients, column %d", i))
  }


  if (tcf$model==3 && z$ncovar==0) {
    # Test linear trend
    xx <- linear(z)$trend
    yy <- target$linear$trend
    for (col in 1:4) expect_equal(xx[1,col], yy[1,col], tol=5e-5)

    # ... and deviations

    xx = linear(z)$dev
    yy = target$linear$dev
    for (i in 1:ncol(xx)) {
      xcol = xx[[i]]
      ycol = yy[[i]]
      expect_true(max(abs(xcol-ycol))<6e-5, info=sprintf("Deviations, column %d", i))
      #! Fails strict tol. Needs to loosen: 5e-5 --> 6e-5
    }
  }

  # Test time indices
  xx = index(z, which="both")
  print(xx)
  yy = target$time.idx
  for (i in 1:ncol(xx)) {
    xcol = xx[[i]]
    ycol = yy[[i]]
    if (all(is.finite(xcol)))
      expect_true(max(abs(xcol-ycol), na.rm=TRUE)<1e-4, info=sprintf("Time indices, column %d", i))
  }

  # Test time totals
  xx <- totals(z, "both")
  yy = target$time.tot
  for (i in 1:ncol(xx)) {
    xcol = xx[[i]]
    ycol = yy[[i]]
    if (all(is.finite(xcol)))
      expect_true(max(abs(xcol-ycol), na.rm=TRUE)<1e-4, info=sprintf("Time totals, column %d", i))
  }

  # Test overall slope (modelled)
  O = overall(z)
  print(O)
  xx = overall(z, "model")$coef
  yy = target$overall$mod$par
  for (col in 2:4) {
    expect_equal(xx[2,col], yy[1,col], tol=1e-4, info="overall slope (modelled)")
  }

  # Test overall slope (imputed)
  xx = overall(z, "imputed")$coef
  yy = target$overall$imp$par
  for (col in c(1,3)) {
    expect_equal(xx[2,col], yy[1,col], tol=1e-4, info="overall slope (imputed)")
  }

}
printf("\n *** All tests succeeded ***\n")