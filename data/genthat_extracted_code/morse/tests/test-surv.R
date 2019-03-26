datasets <- c("cadmium1",
              "cadmium2",
              "copper",
              "chlordan",
              "dichromate",
              "propiconazole",
              "zinc")
data(list=datasets)

failswith_id <- function(dataset, id) {
    gen_failswith_id(survDataCheck, dataset, id)
}

failswith_ids <- function(dataset, id) {
    gen_failswith_ids(survDataCheck, dataset, id)
}


test_that("survDataCheck", {
  skip_on_cran()

  check_all_datasets(datasets, survDataCheck)

  zinc0 <- as.list(zinc)
  expect_named(survDataCheck(zinc0,
                             diagnosis.plot = FALSE), c("id", "msg"))
  failswith_id(zinc0, "dataframeExpected")

  zinc1 <- zinc
  colnames(zinc1) <- c("replica", "con", "time", "Nsur", "Nrepro")
  failswith_ids(zinc1, rep("missingColumn", 3))

  zinc2 <- zinc
  zinc2[46, "time"] <- 1
  zinc2$time <- as.integer(zinc2$time)
  failswith_id(zinc2, "firstTime0")

  zinc3 <- zinc
  zinc3$conc <- as.character(zinc3$conc)
  failswith_id(zinc3, "concNumeric")

  zinc4 <- zinc
  zinc4$Nsurv <- as.numeric(zinc4$Nsurv)
  failswith_id(zinc4, "NsurvInteger")

  zinc5 <- zinc
  zinc5[69, "Nsurv"] <- -248
  zinc5$Nsurv <- as.integer(zinc5$Nsurv)
  failswith_id(zinc5, "tablePositive")

  zinc6 <- zinc
  zinc6[1, "Nsurv"] <- 0
  zinc6$Nsurv <- as.integer(zinc6$Nsurv)
  failswith_id(zinc6, "Nsurv0T0")

  zinc7 <- zinc
  zinc7[107, "replicate"] <- "1"
  failswith_id(zinc7, "duplicatedID")
# failswith_id(zinc7, "missingReplicate")

  zinc8 <- zinc
  zinc8[25, "Nsurv"] <- 20
  zinc8$Nsurv <- as.integer(zinc8$Nsurv)
  failswith_id(zinc8, "NsurvIncrease")

  zinc9 <- zinc
  zinc9[, "replicate"] <- as.character(zinc9[, "replicate"])
  zinc9[12, "replicate"] <- "D"
  zinc9[, "replicate"] <- as.factor(zinc9[, "replicate"])
#  failswith_id(zinc9, "missingReplicate")
  failswith_id(zinc9, "firstTime0")

  zinc10 <- zinc
  zinc10[46, "time"] <- "A"
  failswith_id(zinc10, "timeNumeric")

  cadmium19 <- cadmium1
  cadmium19[12, "replicate"] <- 5
#  failswith_id(cadmium19, "missingReplicate")
  failswith_id(cadmium19, "firstTime0")
})

#
# Test survData_join
#
data("propiconazole_pulse_exposure")

test_that("survData_join", {
  skip_on_cran()

  exposure <- propiconazole_pulse_exposure[,c("replicate", "time", "conc")]
  survival <- propiconazole_pulse_exposure[,c("replicate", "time", "Nsurv")]

  check_all_datasets("propiconazole_pulse_exposure", survDataCheck)

  survData_join <- survData(survData_join(exposure, survival))
  survData_origin <- survData(propiconazole_pulse_exposure)

  expect_equal(survData_join, survData_origin)

})


## test_that("survData", {
##   skip_on_cran()
##   lapply(d, function(x) {
##     dat <- survData(x)
##     expect_is(dat, c("survData", "data.frame"))
##     expect_is(dat$conc, "numeric")
##     expect_true(!is.null(dat))
##     expect_true(any(!is.na(dat)))
##     expect_true(all(dat[-1] >= 0))
##   })
## })

## test_that("survFitTT", {
##   skip_on_cran()
##   d_without_cadmium1 <- d
##   d_without_cadmium1[["cadmium1"]] <- NULL
##   lapply(d_without_cadmium1, function(x) {
##     dat <- survData(x)
##     # select Data at target.time
##     dataTT <- morse:::selectDataTT(dat, max(dat$time))
##     # Test mortality in the control
##     control <- filter(dataTT, conc == 0)
##     out <- survFitTT(dat, quiet = T)
##     expect_is(out, "survFitTT")
##     expect_equal(typeof(out), "list")
##     expect_true(!is.null(out))
##     expect_true(any(!is.na(out)))
##     if (any(control$Nsurv < control$Ninit)) {
##       expect_true(out$det.part == "loglogisticbinom_3")
##     } else {
##       expect_true(out$det.part == "loglogisticbinom_2")
##     }
##   })
##   dat <- survData(cadmium1)
##   expect_warning(survFitTT(dat, quiet = T))
## })

## test_that("survFitTKTD", {
##   skip_on_cran()
##   d.tktd <- list(cadmium1 = d[["cadmium1"]],
##                  chlordan = d[["chlordan"]])
##   lapply(d.tktd, function(x) {
##     dat <- survData(x)
##     expect_warning(out <- survFitTKTD(dat, quiet = T))
##     expect_is(out, "survFitTKTD")
##     expect_equal(typeof(out), "list")
##     expect_true(!is.null(out))
##     expect_true(any(!is.na(out)))
##   })
## })
