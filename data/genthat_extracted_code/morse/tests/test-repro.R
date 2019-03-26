datasets <- c("cadmium1",
              "cadmium2",
              "copper",
              "chlordan",
              "zinc")
data(list=datasets)

failswith_id <- function(dataset, id) {
    gen_failswith_id(reproDataCheck, dataset, id)
}

failswith_ids <- function(dataset, id) {
    gen_failswith_ids(reproDataCheck, dataset, id)
}

test_that("reproDataCheck", {
  skip_on_cran()

  check_all_datasets(datasets, reproDataCheck)
  
  zinc0 <- as.list(zinc)
  expect_named(reproDataCheck(zinc0,
                              diagnosis.plot = FALSE), c("id", "msg"))
  failswith_id(zinc0, "dataframeExpected")
  
  zinc1 <- zinc
  colnames(zinc1) <- c("replica","con","time","Nsur","Nrepro")
  failswith_ids(zinc1, rep("missingColumn", 3))
  
  zinc2 <- zinc[,c("replicate", "conc", "time", "Nsurv")]
  failswith_id(zinc2, "missingColumn")
  
  zinc3 <- zinc
  zinc3$Nrepro <- as.numeric(zinc3$Nrepro)
  failswith_id(zinc3, "NreproInteger")
  
  zinc4 <- zinc
  zinc4[91, "Nrepro"] <- 1
  zinc4$Nrepro <- as.integer(zinc4$Nrepro)
  failswith_id(zinc4, "Nrepro0T0")
  
  zinc5 <- zinc
  zinc5[107, "Nsurv"] <- 0
  zinc5Nsurv <- as.integer(zinc5$Nsurv)
  failswith_id(zinc5, "Nsurvt0Nreprotp1P")
  
})

test_that("reproData", {
  skip_on_cran()
  
  lapply(datasets, function(x) {
    dat <- reproData(get(x))
    expect_is(dat, c("reproData", "survDataCstExp", "survData", "tbl_df", "tbl", "data.frame"))
    expect_true(!is.null(dat))
    expect_true(any(!is.na(dat)))
    expect_is(dat$Ninit, "integer")
    expect_is(dat$Nindtime, "numeric")
    expect_is(dat$Nreprocumul, "integer")
    expect_true(all(dat$Nindtime >= 0))
    expect_true(all(dat$Nreprocumul >= 0))
    
    T <- sort(unique(dat$time))
    for (i in 2:length(T)) {
      now <- dat$time == T[i]
      before <- dat$time == T[i - 1]
      expect_true(all(dat$Nindtime[before] <= dat$Nindtime[now]))
      expect_true(all(dat$Nreprocumul[before] <= dat$Nreprocumul[now]))
    }
  })
})

## test_that("reproFitTT", {
##   skip_on_cran()
##   lapply(d, function(x) {
##     dat <- reproData(x)
##     out <- reproFitTT(dat, quiet = T)
##     expect_is(out, "reproFitTT")
##     expect_equal(typeof(out), "list")
##     expect_true(!is.null(out))
##     expect_true(any(!is.na(out)))
##   })
## })

