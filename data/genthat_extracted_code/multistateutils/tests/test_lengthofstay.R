library(testthat)

context("length of stay")

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
    newdata <- data.frame(age="20-40", dissub="AML")

    saveRDS(models, models_fn)
})

teardown({
    unlink(models_fn)

})

test_that("length_of_stay is consistent with totlos.simfs", {
    models <- readRDS(models_fn)
    newdata <- data.frame(age="20-40", dissub="AML")
    tmat <- trans.illdeath()

    # Test with everyone in starting state
    los <- length_of_stay(models, newdata, tmat, 365, start_state=1)
    simfs <- totlos.simfs(models, tmat, t=365, start=1, newdata=newdata)
    diff <- unname(as.matrix(los[1, 5:7] / simfs))

    # 5% tolerance
    expect_equal(all(diff > 0.95 & diff < 1.05), TRUE)

    # Test with everyone starting in state 2
    los <- length_of_stay(models, newdata, tmat, 365*2, start_state=2)
    simfs <- totlos.simfs(models, tmat, t=365*2, start=2, newdata=newdata)
    expect_equal(as.numeric(los[5]), 0)
    expect_equal(as.numeric(simfs[1]), 0)

    diff <- unname(as.matrix(los[1, 6:7] / simfs[2:3]))

    # Again 5% tolerance
    expect_equal(all(diff > 0.95 & diff < 1.05), TRUE)
})

test_that("length_of_stay guards work", {
    models <- readRDS(models_fn)
    newdata <- data.frame(age="20-40", dissub="AML")
    tmat <- trans.illdeath()

    # Models not specified
    expect_error(length_of_stay(list(3, 2), newdata, tmat, 36525, start_state=1))

    # Various issues with newdata, including wrong column names, not all covariates used by models (or
    # by agelimit) in newdata
    expect_error(length_of_stay(models, newdata[, -1], tmat, 36525, start_state=1))
    expect_error(length_of_stay(models, data.frame(disease='CML'), tmat, 36525, start_state=1))
    expect_error(length_of_stay(models, data.frame(age='20-40'), tmat, 36525, start_state=1))
    expect_error(length_of_stay(models, data.frame(age='20-40', dissub='CML'),
                                tmat, 36525, start_state=1, agelimit=36525, agecol='agecont', agescale=365.25))

    # Problems with transition matrix
    expect_error(length_of_stay(models, newdata, tmat[-1, ], 36525, start_state=1))
    expect_error(length_of_stay(models, newdata, tmat[, -1], 36525, start_state=1))

    # Problems with times
    expect_error(length_of_stay(models, newdata, tmat, -3, start_state=1))
    expect_error(length_of_stay(models, newdata, tmat, 'starttime', start_state=1))

    # Problems with starting state
    expect_error(length_of_stay(models, newdata, tmat, 365, start_state=-1))
    expect_error(length_of_stay(models, newdata, tmat, 365, start_state=1.3))
    expect_error(length_of_stay(models, newdata, tmat, 365, start_state='not real'))

})


test_that("length_of_stay age limit works", {
    models <- readRDS(models_fn)
    newdata <- data.frame(age="20-40", dissub="AML")
    tmat <- trans.illdeath()

    nsims <- 1000
    los1 <- length_of_stay(models, newdata, tmat, 36525, start_state=1,
                           N=nsims)
    los2 <- length_of_stay(models, cbind(newdata, agecont=39), tmat, 365, start_state=1,
                           agelimit=36525, agecol='agecont', agescale=365.25,
                           N=nsims)
    los3 <- length_of_stay(models, cbind(newdata, agecont=39), tmat, 36525, start_state=1,
                           agelimit=36525, agecol='agecont', agescale=365.25,
                           N=nsims)

    # First model shouldnt have old age field because dont ask for it
    expect_equal("oldage" %in% colnames(los1), FALSE)
    # Second model shouldn't have it since asking for LoS at t < agelimit
    expect_equal(los2$oldage, 0)
    # Third model should be affected by it
    expect_equal("oldage" %in% colnames(los3) && los3$oldage > 0, TRUE)

})