library(testthat)

context("transition probabilities")

models_fn <- tempfile()

setup({
    library(mstate)
    library(flexsurv)

    data(ebmt3)
    tmat <- trans.illdeath()
    long <- msprep(time=c(NA, 'prtime', 'rfstime'),
                   status=c(NA, 'prstat', 'rfsstat'),
                   data=ebmt3,
                   trans=tmat,
                   keep=c('age', 'dissub'))
    models <- lapply(1:3, function(i) {
        flexsurvreg(Surv(time, status) ~ age + dissub, data=long, dist='weibull')
    })

    saveRDS(models, models_fn)
})

teardown({
    unlink(models_fn)
})

test_that("predict_transitions is within 1% of pmatrix.simfs", {
    tmat <- trans.illdeath()
    newdata <- data.frame(age="20-40", dissub="AML")
    models <- readRDS(models_fn)

    rdes <- predict_transitions(models, newdata, tmat, times = 100)
    pmat <- pmatrix.simfs(models, tmat, newdata=newdata, t=100)

    diff <- unname(pmat - as.matrix(rdes[, 6:8]))

    # Lower diagonal in both should be 0
    expect_equal(diff[2, 1], 0)
    expect_equal(diff[3, 1], 0)
    expect_equal(diff[3, 2], 0)
    expect_equal(diff[3, 3], 0)

    # Then remainder of matrix is where have actual probs that want to be within 1%
    expect_equal(all(diff[1, ] > -1 & diff[1, ] < 1), TRUE)
    expect_equal(all(diff[2, 2:3] > -1 & diff[2, 2:3] < 1), TRUE)

})

test_that("predict_transitions is within 1% of pmatrix.simfs for a single categorical covariate", {
    library(mstate)
    library(flexsurv)

    data(ebmt3)
    tmat <- trans.illdeath()
    long <- msprep(time=c(NA, 'prtime', 'rfstime'),
                   status=c(NA, 'prstat', 'rfsstat'),
                   data=ebmt3,
                   trans=tmat,
                   keep=c('age'))
    models <- lapply(1:3, function(i) {
        flexsurvreg(Surv(time, status) ~ age, data=long, dist='weibull')
    })
    tmat <- trans.illdeath()
    newdata <- data.frame(age="20-40")

    rdes <- predict_transitions(models, newdata, tmat, times = 100)
    pmat <- pmatrix.simfs(models, tmat, newdata=newdata, t=100)

    diff <- unname(pmat - as.matrix(rdes[, 5:7]))

    # Lower diagonal in both should be 0
    expect_equal(diff[2, 1], 0)
    expect_equal(diff[3, 1], 0)
    expect_equal(diff[3, 2], 0)
    expect_equal(diff[3, 3], 0)

    # Then remainder of matrix is where have actual probs that want to be within 1%
    expect_equal(all(diff[1, ] > -1 & diff[1, ] < 1), TRUE)
    expect_equal(all(diff[2, 2:3] > -1 & diff[2, 2:3] < 1), TRUE)

})

test_that("predict_transitions is within 1% of pmatrix.simfs for a single continuous covariate", {
    library(mstate)
    library(flexsurv)

    data(ebmt3)
    ebmt3$age_cont <- runif(nrow(ebmt3), 20, 85)
    tmat <- trans.illdeath()
    long <- msprep(time=c(NA, 'prtime', 'rfstime'),
                   status=c(NA, 'prstat', 'rfsstat'),
                   data=ebmt3,
                   trans=tmat,
                   keep=c('age_cont'))
    models <- lapply(1:3, function(i) {
        flexsurvreg(Surv(time, status) ~ age_cont, data=long, dist='weibull')
    })
    tmat <- trans.illdeath()
    newdata <- data.frame(age_cont=65)

    rdes <- predict_transitions(models, newdata, tmat, times = 100)
    pmat <- pmatrix.simfs(models, tmat, newdata=newdata, t=100)

    diff <- unname(pmat - as.matrix(rdes[, 5:7]))

    # Lower diagonal in both should be 0
    expect_equal(diff[2, 1], 0)
    expect_equal(diff[3, 1], 0)
    expect_equal(diff[3, 2], 0)
    expect_equal(diff[3, 3], 0)

    # Then remainder of matrix is where have actual probs that want to be within 1%
    expect_equal(all(diff[1, ] > -1 & diff[1, ] < 1), TRUE)
    expect_equal(all(diff[2, 2:3] > -1 & diff[2, 2:3] < 1), TRUE)

})


test_that("predict_transitions guards work", {
    tmat <- trans.illdeath()
    newdata <- data.frame(age="20-40", dissub="AML")
    models <- readRDS(models_fn)

    # Not flexsurvreg objects
    expect_error(predict_transitions(list(5, 20), newdata, tmat, times = 365))
    # covariate names wrong
    expect_error(predict_transitions(models, data.frame(disease='CML'), tmat, times = 365))
    # Not supplying all covariates used by models
    expect_error(predict_transitions(models, data.frame(age='20-40'), tmat, times = 365))

    # Incorrect tmat
    expect_error(predict_transitions(list(5, 20), newdata, tmat[-1, ], times = 365))
    expect_error(predict_transitions(list(5, 20), newdata, tmat[, -1], times = 365))

    # Incorrect times
    expect_error(predict_transitions(list(5, 20), newdata, tmat, times = -365))
    expect_error(predict_transitions(list(5, 20), newdata, tmat, times = 'stu'))
})

test_that("predict_transitions age limit works", {
    tmat <- trans.illdeath()
    newdata <- data.frame(age="20-40", dissub="AML")
    models <- readRDS(models_fn)

    nsims <- 1000
    rdes <- predict_transitions(models, newdata, tmat, times = 36525, N=nsims)
    # Test that without age limits the probabilities of non-death are non-zero
    expect_equal(all(rdes[1:2, 8] < 1), TRUE)

    # Now with age limit added these probabilities should be 0
    with_agelimit <- predict_transitions(models, cbind(newdata, agecont=39), tmat, times = 36525,
                                         agelimit=36525, agecol = 'agecont', agescale = 365.25,
                                         N=nsims)
    expect_equal(all(with_agelimit[1, 7:8] == 0), TRUE)
    expect_equal(with_agelimit[2, 8] == 0, TRUE)

})