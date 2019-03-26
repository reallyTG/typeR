library(testthat)
context("PeakSegPDPA")
library(PeakSegDP)
library(PeakSegOptimal)
data.vec <- as.integer(c(1, 10, 14, 13))
fit <- PeakSegPDPA(data.vec, rep(1L, 4), 3L)
test_that("first segment is OK", {
  cumsum.vec <- cumsum(data.vec)
  n.vec <- seq_along(data.vec)
  mean.vec <- cumsum.vec/n.vec
  expect_equal(fit$mean.mat[1, 1], mean.vec[4])
  for(i in n.vec){
    expected.loss <- PoissonLoss(data.vec[1:i], mean.vec[i])
    expect_equal(fit$cost.mat[1,i], expected.loss)
  }
})

test_that("second segment is OK", {
  expected22 <- PoissonLoss(c(1,10), c(1,10))
  expect_equal(fit$cost.mat[2,2], expected22)
  expected23 <- PoissonLoss(c(1,10,14), c(1,12,12))
  expect_equal(fit$cost.mat[2,3], expected23)
  mean3 <- (10+14+13)/3
  mean24.vec <- c(1, rep(mean3, 3))
  expected24 <- PoissonLoss(data.vec, mean24.vec)
  expect_equal(fit$cost.mat[2,4], expected24)
  expect_equal(fit$ends.mat[2,2], 1)
  expect_equal(fit$mean.mat[2,1:2], c(1, mean3))
})

test_that("third segment is OK", {
  expected33 <- PoissonLoss(c(1,10,14), c(1,12,12))
  expect_equal(fit$cost.mat[3,3], expected33)
  mean3 <- (10+14+13)/3
  mean34.vec <- c(1, rep(mean3, 3))
  expected34 <- PoissonLoss(c(1,10,14,13), mean34.vec)
  expect_equal(fit$cost.mat[3,4], expected34)
  expect_equal(fit$mean.mat[3,], c(1, mean3, mean3))
})

test_that("segment mean 0 before is OK", {
  fit <- PeakSegPDPA(as.integer(c(0, 10, 14, 13)), rep(1L, 4), 3L)
  expect_identical(fit$mean.mat[3,], c(0, 37/3, 37/3))
})

test_that("segment mean 0 after is OK", {
  fit <- PeakSegPDPA(as.integer(c(1, 10, 14, 0)), rep(1L, 4), 3L)
  expect_identical(fit$mean.mat[3,], c(1, 12, 0))
})

test_that("weighted loss same as duplicated loss", {
  fit.id <- PeakSegPDPA(
    as.integer(c(1, 10, 14, 0)), as.integer(c(1, 1, 1, 1)), 3L)
  fit.weighted <- PeakSegPDPA(
    as.integer(c(1, 10, 14, 0)), as.integer(c(2, 1, 1, 1)), 3L)
  fit.duplicated <- PeakSegPDPA(
    as.integer(c(1, 1, 10, 14, 0)), as.integer(c(1, 1, 1, 1, 1)), 3L)
  expect_equal(fit.weighted$cost.mat[, 4], fit.duplicated$cost.mat[, 5])
})

test_that("non-integer weights are fine", {
  fit <- PeakSegPDPA(
    as.integer(c(1, 10, 14, 0)), c(1, 0.5, 1, 1), 3L)
})

test_that("one argument is an error", {
  expect_error({
    fit <- PeakSegPDPA(as.integer(c(1, 10, 14, 0)))
  })
})

test_that("non-integer data is an error", {
  expect_error({
    fit <- PeakSegPDPA(c(1, 10, 14, 0))
  })
})

test_that("no second argument is fine", {
  fit <- PeakSegPDPA(as.integer(c(1, 10, 14, 0)), max.segments=3L)
})

test_that("non-integer max.segments is an error", {
  expect_error({
    fit <- PeakSegPDPA(as.integer(c(1, 10, 14, 0)), max.segments=3)
  })
})

test_that("small max.segments is an error", {
  expect_error({
    fit <- PeakSegPDPA(as.integer(c(1, 10, 14, 0)), max.segments=1L)
  })
  expect_error({
    fit <- PeakSegPDPA(as.integer(c(1, 10, 14, 0)), max.segments=0L)
  })
  expect_error({
    fit <- PeakSegPDPA(as.integer(c(1, 10, 14, 0)), max.segments=-1L)
  })
})

test_that("large max.segments is an error", {
  expect_error({
    fit <- PeakSegPDPA(as.integer(c(1, 10, 14, 0)), max.segments=5L)
  })
})

data.vec <- as.integer(c(0, 10, 14, 13))
fit <- PeakSegPDPA(data.vec, rep(1L, 4), 3L)
test_that("segment mean 0 is OK", {
  exp.mat <- rbind(
    c(9.25, Inf, Inf),
    c(0, 37/3, Inf),
    c(0, 37/3, 37/3))
  expect_equal(fit$mean.mat, exp.mat)
})

real.data.names <- c(
  "H3K4me3_PGP_immune_chunk24",
  "H3K4me3_XJ_immune_chunk1")
data(list=real.data.names)
## library(ggplot2)
## ggplot()+
##   theme_bw()+
##   theme(panel.margin=grid::unit(0, "lines"))+
##   facet_grid(sample.id ~ ., scales="free", labeller=function(df){
##     df$sample.id <- sub("McGill0", "", df$sample.id)
##     df
##   })+
##   geom_step(aes(chromStart/1e3, coverage),
##             data=H3K4me3_XJ_immune_chunk1, color="grey")
real.name <- "H3K4me3_PGP_immune_chunk24"
one.name <- "McGill0001"

test_that("PeakSegPDPA is as good as PeakSegDP on real data", {
  for(real.name in real.data.names){
    counts <- get(real.name)
    by.sample <- split(counts, counts$sample.id)
    for(one.name in names(by.sample)){
      one <- by.sample[[one.name]]
      count.vec <- one$coverage
      weight.vec <- with(one, chromEnd-chromStart)
      max.segments <- 19L
      pdpa <- PeakSegPDPA(count.vec, weight.vec, max.segments)
      cdpa <- cDPA(count.vec, weight.vec, max.segments)
      cdpa$loss[cdpa$ends==0] <- Inf
      both.loss <- data.frame(
        segments=as.integer(row(cdpa$loss)),
        data.i=as.integer(col(cdpa$loss)),
        cdpa=as.numeric(cdpa$loss),
        pdpa=as.numeric(pdpa$cost.mat))
      bad <- subset(both.loss, cdpa < pdpa-1e-5)
      if(nrow(bad)){
        cat("Problems for", real.name, one.name, "\n")
        print(bad)
      }
      expect_equal(nrow(bad), 0)
    }
  }
})

test_that("error for negative data", {
  count <- as.integer(c(1, 2, -3))
  expect_error({
    PeakSegPDPA(count, max.segments=3L)
  })
  df <- data.frame(count,chromStart=0:2, chromEnd=1:3)
  expect_error({
    PeakSegPDPAchrom(df, 1L)
  })
})
