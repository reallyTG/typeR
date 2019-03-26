context("Test on CDF")

test_that("CDF in [0,1]", {

  tVect <-seq(from = -10, to = 200, by = 1)

  expect_cdfRange_01 <- function(t, m, devel, thres) {
    cdfValue <- givitiStatCdf(t, m, devel, thres)
    expect_equal(cdfValue >= 0 & cdfValue <= 1, T)
  }

  for (t in tVect) {
    expect_cdfRange_01(t,1,"external",0.95)
    expect_cdfRange_01(t,2,"external",0.95)
    expect_cdfRange_01(t,3,"external",0.95)
    expect_cdfRange_01(t,4,"external",0.95)

    expect_cdfRange_01(t,2,"internal",0.95)
    expect_cdfRange_01(t,3,"internal",0.95)
    expect_cdfRange_01(t,4,"internal",0.95)

    expect_cdfRange_01(t,1,"external",0.8)
    expect_cdfRange_01(t,2,"external",0.8)
    expect_cdfRange_01(t,3,"external",0.8)
    expect_cdfRange_01(t,4,"external",0.8)

    expect_cdfRange_01(t,2,"internal",0.8)
    expect_cdfRange_01(t,3,"internal",0.8)
    expect_cdfRange_01(t,4,"internal",0.8)
  }


})



