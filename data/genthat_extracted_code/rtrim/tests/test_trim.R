
# compare TRIM model m against trim output string to.
trimtest <- function(m, to, tc, vcv=NULL) {

  version <- get_version(to)

  # data basics
  expect_equal(m$nsite, get_n_site(to))
  expect_equal(m$ntime, get_n_time(to))

  # Overdispersion and serial correlation
  if (tc$overdisp) expect_true(abs(overdispersion(m) - get_overdispersion(to)) < 1e3)
  if (tc$serialcor) expect_true(abs(serial_correlation(m) - get_serial_correlation(to)) < 1e-3)

  # time index check
  tgt <- get_time_indices(to)
  out <- index(m,"both")
  for ( i in seq_len(ncol(tgt)) ){
    expect_true( max(abs(out[,i]-tgt[,i]), na.rm=TRUE) < 1e-4
      , info=sprintf("Time index column %d",i)
    )
  }

  # time totals check
  tgt <- get_time_totals(to)
  out <- totals(m,"both")
  for ( i in seq_len(ncol(tgt)) ){
    expect_true( max(abs(out[,i]-tgt[,i]), na.rm=TRUE) < 1e-4
      , info=sprintf("Time totals column %d",i)
    )
  }

  # Overall slope
  tgt <- get_overal_imputed_slope(to)
  out <- overall(m,"imputed")$slope[1,]
  for (i in seq_len(ncol(tgt))) {
    expect_true(max(abs(out[,i+2] - tgt[,i])) < 1e-4,
                info = sprintf("Overall slope column %d", i))
  }

  # Overall slope (changepoints) [optional]
  if (length(tc$overallchangepoints)>0) {
    tgt <- get_overal_cp_imputed_slope(to)
    out <- overall(m, "imputed", tc$overallchangepoints)
    for (i in seq_len(ncol(tgt))) {
      expect_true(max(abs(out$slope[,i]-tgt[,i]), na.rm=TRUE) < 1e-4,
                  info=sprintf("Overall slope (changepts) column %d",i))
    }
  }

  # goodness-of-fit
  tgt <- get_gof(to)
  out <- gof(m)
  expect_equal(out$chi2$chi2, tgt$chi2$chi2, tol = 1e-3, info="chi2 value")
  expect_equal(out$chi2$df, tgt$chi2$df, info="chi2 df")
  if (version=="3.61") expect_equal(out$chi2$p, tgt$chi2$p, tol= 1e-4, info="chi2 p-value")
  expect_equal(out$LR$LR, tgt$LR$LR, tol=1e-3, info="Likelihood ratio")
  expect_equal(out$LR$df, tgt$LR$df,info="Likelihood ratio df")
  if (version=="3.61") expect_equal(out$LR$p, tgt$LR$p, tol= 1e-4, info="Likelihood ratio p-value")
  expect_equal(abs(out$AIC), abs(tgt$AIC), tol=1e-4, info="AIC value")

  # wald test
  tgt <- get_wald(to)
  out <- wald(m)
  if ( !is.null(tgt$dslope) ){
    expect_equal(out$dslope$W, tgt$dslope$W, tol=1e-2)
  }
  if(!is.null(tgt$slope)){
    expect_equal(out$slope$W,tgt$slope$W,tol=1e-2, info="Wald test value")
    expect_true(all(out$slope$df==tgt$slope$df), info="Wald test df")
    expect_equal(out$slope$p, tgt$slope$p, tol=1e-4, info="Wald test p-value")
  }
  if (!is.null(tgt$deviations)){
    expect_equal(out$deviations$W,tgt$deviations$W,1e-2)
    expect_equal(out$deviations$df,tgt$deviations$df)
    expect_equal(out$deviations$p,tgt$deviations$p,1e-4)
  }
  if (!is.null(tgt$covar)){
    expect_equal(out$covar$W,tgt$covar$W,1e-2)
    expect_equal(out$covar$df,tgt$covar$df)
    expect_equal(out$covar$p,tgt$covar$p,1e-4)
  }
  # coefficients
  tgt <- get_coef(to,tc$labels)
  out <- coefficients(m)
  v <- c("add","se_add","mul","se_mul")
  expect_equal(tgt$add,out$add,tol=1e-4)
  expect_equal(tgt$mul,out$mul,tol=1e-4)
  expect_equal(tgt$se_add,out$se_add,tol=1e-4)
  expect_equal(tgt$se_mul,out$se_mul,tol=1e-4)
  if(!is.null(tgt$from)) expect_equal(tgt$from,out$from)
  if(!is.null(tgt$from)) expect_equal(tgt$upto,out$upto)
  if(!is.null(tgt$time)) expect_equal(tgt$time,out$time)
  if(!is.null(tgt$cat)) expect_equal(tgt$cat,out$cat)
  if(!is.null(tgt$covar)) expect_equal(tgt$covar, as.character(out$covar))

  # Variance-covariance
  if (!is.null(vcv)) {
    src = vcov(m,"imputed")
    expect_equal(src, vcv, tol=1e-3, info="Variance-covariance")
  }
}

context("TRIM Model 3 [vanilla]")
test_that("skylark-1a",{
  tc <- read_tcf("outfiles/skylark-1a.tcf")
  m <- trim(tc)
  to <- read_tof("outfiles/skylark-1a.out")
  trimtest(m, to, tc)
})

context("TRIM Model 3 [overdisp]")
test_that("skylark-1b",{
  tc <- read_tcf("outfiles/skylark-1b.tcf")
  m <- trim(tc)
  to <- read_tof("outfiles/skylark-1b.out")
  trimtest(m, to,tc)
})

context("TRIM Model 3 [overdisp, ser.corr]")
test_that("skylark 1c",{
  tc <- read_tcf("outfiles/skylark-1c.tcf")
  m <- trim(tc)
  to <- read_tof("outfiles/skylark-1c.out")
  trimtest(m, to,tc)
})


context("TRIM Model 2 [overdisp, ser.cor]")
test_that("skylark 1d",{
  tc <- read_tcf("outfiles/skylark-1d.tcf")
  m <- trim(tc)
  to <- read_tof("outfiles/skylark-1d.out")
  trimtest(m, to,tc)
})


context("TRIM Model 2 [overdisp, ser.cor, all ch.points]")
test_that("skylark-1e",{
  tc <- read_tcf("outfiles/skylark-1e.tcf")
  m <- trim(tc)
  to <- read_tof("outfiles/skylark-1e.out")
  trimtest(m,to,tc)
})


context("TRIM Model 2 [overdisp, ser.cor, 2 ch.points]")
test_that("skylark-1f",{
  tc <- read_tcf("outfiles/skylark-1f.tcf")
  m <- trim(tc)
  to <- read_tof("outfiles/skylark-1f.out")
  trimtest(m,to,tc)
})

context("TRIM Model 2 [overdisp, ser.cor, covar, ch.points]")
test_that("skylark-2a",{
  tc <- read_tcf("outfiles/skylark-2a.tcf")
  m <- trim(tc)
  to <- read_tof("outfiles/skylark-2a.out")
  trimtest(m,to,tc)
})

context("TRIM Model 3 [overdisp, ser.cor, covar]")
test_that("skylark-2b",{
  tc <- read_tcf("outfiles/skylark-2b.tcf")
  m <- trim(tc)
  to <- read_tof("outfiles/skylark-2b.out")
  trimtest(m,to,tc)
})

context("TRIM Model 2 [overdisp, ser.cor, covar, stepwise]")
test_that("skylark-3a",{
  tc <- read_tcf("outfiles/skylark-3a.tcf")
  m <- trim(tc)
  to <- read_tof("outfiles/skylark-3a.out")
  trimtest(m,to,tc)
})

context("TRIM skylark-4 [weights, no changepoints, Poisson]")
test_that("skylark-4a",{
  tc <- read_tcf("outfiles/skylark-4a.tcf")
  m <- trim(tc)
  to <- read_tof("outfiles/skylark-4a.out")
  trimtest(m,to,tc)
})

context("TRIM skylark-4 [weights, cp 1+2, poison]")
test_that("skylark-4b",{
  tc <- read_tcf("outfiles/skylark-4b.tcf")
  m <- trim(tc)
  to <- read_tof("outfiles/skylark-4b.out")
  trimtest(m,to,tc)
})

context("TRIM skylark-4 [weights, cp 1+2, overdisp]")
test_that("skylark-4c",{
  tc <- read_tcf("outfiles/skylark-4c.tcf")
  m <- trim(tc)
  to <- read_tof("outfiles/skylark-4c.out")
  trimtest(m,to,tc)
})

context("TRIM skylark-4 [weights, cp 1+2, serialcor]")
test_that("skylark-4d",{
  tc <- read_tcf("outfiles/skylark-4d.tcf")
  m <- trim(tc)
  to <- read_tof("outfiles/skylark-4d.out")
  trimtest(m,to,tc)
})

context("TRIM skylark-4 [weights, cp 1+2, overdisp+serialcor]")
test_that("skylark-4e",{
  tc <- read_tcf("outfiles/skylark-4e.tcf")
  m <- trim(tc)
  to <- read_tof("outfiles/skylark-4e.out")
  trimtest(m,to,tc)
})

context("TRIM skylark-4 [weights, overdisp+serialcor, stepwise refinement]")
test_that("skylark-4f",{
  tc <- read_tcf("outfiles/skylark-4f.tcf")
  m <- trim(tc)
  to <- read_tof("outfiles/skylark-4f.out")
  trimtest(m,to,tc)
})

context("TRIM skylark-x [output of variance-covariance matrix]")
test_that("skylark-x1",{
  tc <- read_tcf("outfiles/skylark-x1.tcf")
  m <- trim(tc)
  to <- read_tof("outfiles/skylark-x1.out")
  vcv <- read_vcv("outfiles/skylark-x1.ocv")
  trimtest(m,to,tc,vcv)
})

context("TRIM skylark-x [actual years 1984--1991 instead 1--8]")
test_that("skylark-x2",{
  tc <- read_tcf("outfiles/skylark-x2.tcf")
  m <- trim(tc)
  to <- read_tof("outfiles/skylark-x2.out")
  trimtest(m,to,tc)
})

context("TRIM skylark-x [overall changepoints]")
test_that("skylark-x3",{
  tc <- read_tcf("outfiles/skylark-x3.tcf")
  m <- trim(tc)
  to <- read_tof("outfiles/skylark-x3.out")
  trimtest(m,to,tc)
})




context("Calling trim the R-way (smoketests)")

test_that("testing skylark-2a",{
  tc <- read_tcf("outfiles/skylark-2a.tcf")
  dat <- read_tdf(tc)

  m <- trim(count ~ site + time + Habitat, data=dat
            , serialcor=TRUE, overdisp = TRUE, model=2
            , changepoints=1:7, autodelete=FALSE)
  to <- read_tof("outfiles/skylark-2a.out")

  # formula-data interface
  trimtest(m,to,tc)

  # data-formula interface: note: nothing should be auto-deleted.
  m <- trim(dat, count_col="count", site_col="site", year_col="time"
            , covar_cols="Habitat"
            , serialcor=TRUE, overdisp = TRUE, model=2
            , changepoints=1:7,autodelete=TRUE)
  trimtest(m,to,tc)


})

context("Error handling")

test_that("invalid model specs",{
  data(skylark)
  expect_error(
    trim(count ~ site + time, data=skylark, model=3
         ,changepoints=c(3,5),stepwise = TRUE)
    , regexp = "Stepwise refinement requires model 2"
  )

  expect_error(
    trim(count ~ site + time, data=skylark, model=3
         ,changepoints=c(3,5))
    , regexp = "Changepoints cannot be specified for model 3"
  )

})

test_that("Zero expected count", {
  load("testdata/131183.RData")
  suppressWarnings(
    expect_error(
      trim(count ~ site + year, data=df, model=2, overdisp=TRUE, serialcor=TRUE, changepoints="all", autodelete=TRUE),
           regexp = "Zero expected value at year 2014"
      )
    )
})

test_that("tcf checker",{

  # bug reported by Henk Sierdsema (SOVON)
x <- "
FILE trim_15720_V.txt
TITLE Corvus corax
NTIMES 34
NCOVARS 0
MISSING -1
WEIGHT Absent
SERIALCOR on
OVERDISP on
BASETIME 1
MODEL 2
OUTPUTFILES S F
RUN
"
expect_null(check_tcf(x))
})


context("Output printers")
test_that("S3 output printers", {
  data(skylark)
  m2 <- trim(count ~ site + time, data=skylark, model=2, overdisp=TRUE, serialcor = TRUE)
  expect_output(print(m2))
  expect_output(print(coef(m2)))
  expect_output(print(wald(m2)))
  expect_output(print(overall(m2)))
  expect_output(print(totals(m2)))
  expect_output(print(index(m2)))
  expect_output(print(summary(m2)))
})

context("predicted results")
test_that("results",{
  data(skylark)
  m <- trim(count ~ site + time, data=skylark, model=2)
  out <- as.data.frame(results(m))
  out$site<- as.integer(as.character(out$site))
  target <- read.csv("outfiles/skylark-model2-f.csv")
  expect_equal(out, target)
})
