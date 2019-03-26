library(vortexR)
library(vortexRdata)
context("test Ne_Nadults")


test_that("test Ne", {
  # dir
  pac.dir <- system.file("extdata", "pacioni", package="vortexRdata")

  # load data
  data(pac.clas.Ne, pac.clas)
  suppressMessages(NeAll <- Ne(data=pac.clas, scenarios="all", gen=2.54, yr0=50,
                               yrt=120, save2disk=FALSE))

expect_equal(pac.clas.Ne , NeAll)
})

test_that("test Nadults", {
  # dir
  pac.dir <- system.file("extdata", "pacioni", package="vortexRdata")

  # load data
  data(pac.clas.Nadults, pac.yr)
  suppressMessages(NadultAll <- Nadults(data=pac.yr[[2]], scenarios="all",
                                        gen=2.54, yr0=50, yrt=120,
                                        save2disk=FALSE))

  expect_equal(pac.clas.Nadults, NadultAll)
})
