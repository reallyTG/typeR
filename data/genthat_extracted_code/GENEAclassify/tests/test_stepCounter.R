# Date of last change: 2016-05-11
# Last changed by: csweetland
#
# Original author: ccampbell
# Copyright Activinsights, Cambridge UK 2013-2017
###############################################################################

context("check step counter")

###############################################################################

test_that("stepCounter", {

    # test 1
    d1 <- matrix(c(100, 101, -0.79, -0.86, -0.17, -0.14, 0.53, 0.46),
        nrow = 2, ncol = 4)
    expect_that(stepCounter(data = d1, samplefreq = 100, smlen = 1, method="longrun"),
        equals(c(count = 0, sd = NA, mad = 0)))

    # test 2
    d2 <- matrix(c(100, 101, 102, 103, 104,
        -0.79, -0.36, 0.03, -0.16, 0.54,
        -0.27, -0.14, -0.25, -0.10, 0.21,
        -0.53, -0.46, 0.13, 0.97, 0.43), nrow = 5, ncol = 4)
    expect_that(stepCounter(data = d2, samplefreq = 100, smlen = 2, method="longrun"),
        equals(c(count = 1, sd = 0, mad = 0)))

    # test 3
    load(file.path(system.file(package = "GENEAclassify"),
        "testdata", "stepData_allTimes.RData"))

    cutpoint <- cut(stepData[, "timestamp"], allTimes)
    xyzStepData <- split(stepData, cutpoint)
    xyzStepData <- lapply(xyzStepData, matrix, ncol = 4)

    stepNumber <- lapply(xyzStepData, stepCounter, samplefreq = 10, smlen = 7, method="longrun")
    pred <- unname(sapply(stepNumber, function(x) x["count"]))
    expect_that(pred, equals(c(0, 3, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0)))

    # test4
    set.seed(435524)
    rawd <- cbind(seq(from = 1, to = 10, length.out = 100), matrix(rnorm(300), ncol = 3))
    colnames(rawd) <- c("timestamp", "x", "y", "z")
    expect_that(stepCounter(data = rawd, samplefreq = 100, smlen = 30L, method="longrun"),
        equals(c(count = 0, sd = NA, mad = 0)))


    rm(list = c("d1", "d2", "cutpoint", "xyzStepData", "stepNumber", "pred"))
})
