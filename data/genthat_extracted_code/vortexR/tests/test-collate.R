library(vortexR)
library(vortexRdata)
context("test collate")


test_that("test collate_dat", {
  # dir
  camp.dir <- system.file("extdata", "campbell", package="vortexRdata")
  pac.dir <- system.file("extdata", "pacioni", package="vortexRdata")


  # load data
  data(sta.main)
	starling <- collate_dat("Starlingv3PopBased", 10000, dir_in=camp.dir,
                        save2disk=FALSE, verbose=FALSE)

  data(pac.clas)
	woylie.st.classic <- collate_dat("Pacioni_et_al", 3,
	                                 scenario = "ST_Classic", dir_in = pac.dir,
	                                 save2disk=FALSE, verbose=FALSE)

  expect_equal(starling , sta.main)
  expect_equal(woylie.st.classic, pac.clas)
})

test_that("test collate_run", {
  # dir
    pac.dir <- system.file("extdata", "pacioni", package="vortexRdata")

  # load data
  data(pac.run.lhs)
  woylie.st.run <- collate_run("Pacioni_et_al", scenario = "ST_LHS",
                               dir_in = pac.dir, save2disk=FALSE, verbose=FALSE)

  expect_equal(woylie.st.run, pac.run.lhs)
})

test_that("test collate_yr", {
  # dir
    pac.dir <- system.file("extdata", "pacioni", package="vortexRdata")

  # load data
  data(pac.yr)
  woylie.yr <- collate_yr("Pacioni_et_al", scenario = "ST_Classic",
                               dir_in = pac.dir, save2disk=FALSE, verbose=FALSE)

  expect_equal(woylie.yr, pac.yr)
})

test_that("test collate_proc_data", {
    data(sta.main, sta.evy5, sta.evy5.b11)
    dfs <- list(sta.main, sta.evy5, sta.evy5.b11)
    combined <- collate_proc_data(dfs, save2disk=FALSE)

    expect_is(combined, "data.frame")
    expect_equal(dim(combined), c(3672, 47))
})

test_that("test con_l_yr", {
    data(pac.yr)
    lyr.classic <- conv_l_yr(pac.yr[[1]] , yrs=c(60, 120), save2disk=FALSE)

    expect_is(lyr.classic, "data.frame")
    expect_equal(dim(lyr.classic), c(144, 27))
})
