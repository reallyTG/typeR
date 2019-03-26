library(testthat)
context("PeakSegFPOP")
library(PeakSegOptimal)
data.vec <- as.integer(c(1, 10, 14, 13))
fit <- PeakSegFPOP(data.vec, rep(1L, 4), 0)
test_that("no penalty is OK", {
  best.cost <- min(fit$cost.mat[2,4])
  mean.vec <- c(1, rep(37/3, 3))
  exp.cost <- PoissonLoss(data.vec, mean.vec)
  expect_equal(best.cost, exp.cost)
})

data.vec <- as.integer(c(1, 10, 14, 5))
weight.vec <- rep(1L, 4)
pdpa <- PeakSegPDPA(data.vec, weight.vec, 3L)
fpop <- PeakSegFPOP(data.vec, weight.vec, 0)
test_that("FPOP computes same model as PDPA", {
  pdpa.cost <- min(pdpa$cost.mat)
  fpop.cost <- min(fpop$cost.mat)
  expect_equal(fpop.cost, pdpa.cost)
})

fit <- PeakSegFPOP(data.vec, rep(1L, 4), 1e6)
test_that("huge penalty recovers no changes", {
  exp.mean <- mean(data.vec)
  exp.mean.vec <- c(exp.mean, Inf, Inf, Inf)
  expect_equal(fit$mean.vec, exp.mean.vec)
  exp.loss <- PoissonLoss(data.vec, exp.mean)
  expect_equal(min(fit$cost.mat), exp.loss)
})

data(H3K4me3_XJ_immune_chunk1)
H3K4me3_XJ_immune_chunk1$count <- H3K4me3_XJ_immune_chunk1$coverage
by.sample <- split(
  H3K4me3_XJ_immune_chunk1, H3K4me3_XJ_immune_chunk1$sample.id)

one.name <- "McGill0004"
one <- by.sample[[one.name]]
one$bases <- with(one, chromEnd-chromStart)
wmean <- function(df){
  with(df, sum(bases*count)/sum(bases))
}
max.peaks <- as.integer((nrow(one)-1)/2)
pdpa <- PeakSegPDPAchrom(one, max.peaks)
segs.by.peaks <- split(pdpa$segments, pdpa$segments$peaks)
test_that("PDPA segment means are feasible", {
  for(peaks.str in names(segs.by.peaks)){
    pdpa.segs <- segs.by.peaks[[peaks.str]]
    rownames(pdpa.segs) <- NULL
    sign.diff <- sign(diff(pdpa.segs$mean))*c(1,-1)
    right.sign <- sign.diff %in% c(0, 1)
    expect_true(all(right.sign))
  }
})

some.models <- pdpa$modelSelection.decreasing
test_that("FPOP recovers the same models as PDPA", {
  model.i <- 147
  for(model.i in 1:nrow(some.models)){
    model.row <- some.models[model.i,]
    lambda <- with(model.row, if(max.lambda==Inf){
      min.lambda+1
    }else{
      (min.lambda+max.lambda)/2
    })
    exp.segs <- segs.by.peaks[[paste(model.row$peaks)]]
    rownames(exp.segs) <- NULL
    ##print(lambda)
    fpop <- PeakSegFPOPchrom(one, lambda)
    fpop.mean.vec <- with(fpop$segments, rep(mean, last-first+1))
    pdpa.mean.vec <- with(exp.segs, rep(mean, last-first+1))
    if(sum(abs(fpop.mean.vec-pdpa.mean.vec)) > 1e-6){
      print(model.row)
      print(sum(abs(fpop.mean.vec-pdpa.mean.vec)))
    }
    expect_equal(fpop.mean.vec, pdpa.mean.vec)
  }
})

## some.models <- pdpa$modelSelection.decreasing[144:148,]
## lambda.vec <- with(some.models, ceiling(min(min.lambda)):floor(max(max.lambda)))
## some.loss <- subset(pdpa$loss, peaks %in% some.models$peaks)
## loss.list <- list()
## for(lambda.i in seq_along(lambda.vec)){
##   lambda <- lambda.vec[[lambda.i]]
##   fit <- PeakSegFPOPchrom(one, lambda)
##   loss.list[[lambda.i]] <- data.frame(lambda, fit$loss)
## }
## loss <- do.call(rbind, loss.list)
## ggplot()+
##   geom_abline(aes(slope=peaks, intercept=PoissonLoss), data=some.loss)+
##   geom_point(aes(lambda, penalized.loss, color=factor(peaks)), data=loss)

## ## lambda=150 should select 3-segment model, but buggy code selects
## ## 2-segment model.
## lambda <- 150
## data.i <- 3
## some <- one[1:data.i,]
## fpop <- PeakSegFPOPchrom(some, lambda)
## pdpa <- PeakSegPDPAchrom(some, 1L)
## loss <- pdpa$loss
## loss$penalized.cost <- with(loss, peaks*lambda+PoissonLoss)
## loss
## fpop$loss

test_that("error for less than 3 data points", {
  expect_error({
    PeakSegFPOP(data.vec[1:2], weight.vec[1:2], 0)
  })
  expect_error({
    PeakSegFPOPchrom(one[1:2,])
  })
})

test_that("error for negative data", {
  count <- as.integer(c(1, 2, -3))
  expect_error({
    PeakSegFPOP(count, penalty=0)
  })
  df <- data.frame(count,chromStart=0:2, chromEnd=1:3)
  expect_error({
    PeakSegFPOPchrom(df, 0)
  })
})
