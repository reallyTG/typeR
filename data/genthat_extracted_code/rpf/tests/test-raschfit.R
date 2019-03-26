#options(error = utils::recover)
library(testthat)
library(rpf)

context("outfit/infit")

test_that("kct", {
  data(kct)
  responses <- kct.people[,paste("V",2:19, sep="")]
  rownames(responses) <- kct.people$NAME
  colnames(responses) <- kct.items$NAME

  scores <- kct.people$MEASURE
  params <- cbind(1, kct.items$MEASURE, logit(0), logit(1))
  rownames(params) <- kct.items$NAME
  items<-list()
  items[1:18] <- list(rpf.drm())
  params[,2] <- -params[,2]

  expect_warning(fit <- rpf.1dim.fit(items, t(params), responses, scores, 2, wh.exact=TRUE),
                 "Excluding response Helen")

  expect_equal(fit$infit, kct.items$IN.MSQ[4:17], tolerance=.002)
  expect_equal(fit$infit.z, kct.items$IN.ZSTD[4:17], tolerance=.01)
  expect_equal(fit$outfit, kct.items$OUT.MSQ[4:17], tolerance=.002)
  expect_equal(fit$outfit.z, kct.items$OUT.ZSTD[4:17], tolerance=.01)

  expect_warning(fit <- rpf.1dim.fit(items, t(params), responses, scores, 1, wh.exact=TRUE),
                 "Excluding item 1= 1-4")
  
  expect_equal(fit$infit, kct.people$IN.MSQ[1:34], tolerance=.002)
  expect_equal(fit$infit.z, kct.people$IN.ZSTD[1:34], tolerance=.005)
  expect_equal(fit$outfit, kct.people$OUT.MSQ[1:34], tolerance=.002)
  expect_equal(fit$outfit.z, kct.people$OUT.ZSTD[1:34], tolerance=.005)
})

plot.icc <- function(ii, ii.p, width=7) {
  require(ggplot2)
  require(reshape2)
  grid <- expand.grid(theta=seq(-width,width,.1))
  grid <- cbind(grid, t(rpf.prob(ii, ii.p, grid$theta)))
  grid2 <- melt(grid, id.vars=c("theta"), variable.name="category", value.name="p")
  ggplot(grid2, aes(theta, p, color=category)) + geom_line() +
    ylim(0,1) + xlim(-width, width)
}

test_that("sf", {
  data(science)
  spec <- list()
  spec[1:25] <- list(rpf.nrm(outcomes=3, T.c = lower.tri(diag(2),TRUE) * -1))
  
  param <- rbind(a=1, alf1=1, alf2=0,
        gam1=sfif$MEASURE + sfsf[sfsf$CATEGORY==1,"Rasch.Andrich.threshold.MEASURE"],
        gam2=sfif$MEASURE + sfsf[sfsf$CATEGORY==2,"Rasch.Andrich.threshold.MEASURE"])
  colnames(param) <- sfif$NAME
  
  iorder <- match(sfif$NAME, colnames(sfpf))
  responses <- sfpf[,iorder]
  rownames(responses) <- sfpf$NAME
  
  expect_warning(fit <- rpf.1dim.fit(spec, param, responses, sfpf$MEASURE, 2, wh.exact=TRUE),
                 "Excluding item GO TO MUSEUM")
  
  expect_equal(fit$infit, sfif$IN.MSQ[-12], tolerance=.002)
  expect_equal(fit$infit.z, sfif$IN.ZSTD[-12], tolerance=.005)
  expect_equal(fit$outfit, sfif$OUT.MSQ[-12], tolerance=.002)
  expect_equal(fit$outfit.z, sfif$OUT.ZSTD[-12], tolerance=.005)

  expect_warning(fit <- rpf.1dim.fit(spec, param, responses, sfpf$MEASURE, 1, wh.exact=TRUE),
                 "Excluding response ROSSNER, LAWRENCE")
  
  expect_equal(fit$infit, sfpf$IN.MSQ[-2], tolerance=.02)
  expect_equal(fit$infit.z, sfpf$IN.ZSTD[-2], tolerance=.05)
  expect_equal(fit$outfit, sfpf$OUT.MSQ[-2], tolerance=.05)
  expect_equal(fit$outfit.z, sfpf$OUT.ZSTD[-2], tolerance=.075)
})
