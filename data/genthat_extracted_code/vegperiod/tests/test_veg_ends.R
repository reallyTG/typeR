context("veg_ends")


#--  set up data.frame for tests  ---------------------------------------------
data(goe)
df <- data.frame(year  = as.integer(format(goe$date, "%Y")),
                 month = as.integer(format(goe$date, "%m")),
                 DOY   = as.integer(format(goe$date, "%j")),
                 Tavg=goe$t)


#-- von Wilpert  --------------------------------------------------------------
test_that("von Wilpert works", {
  # canonical
  expect_equal(vegperiod:::.end_vonWilpert(df, Treshold=10, LastDOY=279),
               c(274L, 279L, 279L, 279L, 279L, 271L, 279L, 279L, 279L, 279L))

  # change threshold
  expect_equal(vegperiod:::.end_vonWilpert(df, Treshold=7, LastDOY=279),
               c(279L, 279L, 279L, 279L, 279L, 279L, 279L, 279L, 279L, 279L))
  expect_equal(vegperiod:::.end_vonWilpert(df, Treshold=15, LastDOY=279),
               c(262L, 255L, 278L, 252L, 273L, 255L, 252L, 277L, 259L, 266L))

  # change LastDOY
  expect_equal(vegperiod:::.end_vonWilpert(df, Treshold=10, LastDOY=200),
               c(200L, 200L, 200L, 200L, 200L, 200L, 200L, 200L, 200L, 200L))
  expect_equal(vegperiod:::.end_vonWilpert(df, Treshold=10, LastDOY=300),
               c(274L, 300L, 292L, 300L, 300L, 271L, 300L, 291L, 295L, 300L))
})


#-- LWF-BROOK90  --------------------------------------------------------------
test_that("LWF-BROOK90 works", {
  # canonical
  expect_equal(vegperiod:::.end_LWF_BROOK90(df, Tmin=10, LastDOY=279),
               c(277L, 279L, 279L, 279L, 279L, 274L, 279L, 279L, 279L, 279L))

  # change threshold
  expect_equal(vegperiod:::.end_LWF_BROOK90(df, Tmin=7, LastDOY=279),
               c(279L, 279L, 279L, 279L, 279L, 279L, 279L, 279L, 279L, 279L))
  expect_equal(vegperiod:::.end_LWF_BROOK90(df, Tmin=15, LastDOY=279),
               c(265L, 258L, 279L, 255L, 276L, 269L, 255L, 279L, 262L, 269L))

  # change LastDOY
  expect_equal(vegperiod:::.end_LWF_BROOK90(df, Tmin=10, LastDOY=200),
               c(200L, 200L, 200L, 200L, 200L, 200L, 200L, 200L, 200L, 200L))
  expect_equal(vegperiod:::.end_LWF_BROOK90(df, Tmin=10, LastDOY=300),
               c(288L, 300L, 295L, 300L, 300L, 274L, 300L, 294L, 298L, 300L))
})


#-- Nuske-Albert  -------------------------------------------------------------
test_that("Nuske-Albert works", {
  # Menzel with est.prev=3
  vegstart <- list(
    c( 96L, 102L, 102L,  88L, 100L, 101L, 105L, 102L,  93L,  95L),
    c(119L, 127L, 125L, 116L, 124L, 126L, 124L, 125L, 115L, 116L),
    c(128L, 134L, 131L, 125L, 131L, 135L, 132L, 130L, 121L, 121L),
    c(131L, 134L, 133L, 125L, 133L, 137L, 136L, 133L, 123L, 123L),
    c(140L, 140L, 141L, 132L, 139L, 147L, 142L, 142L, 133L, 128L),
    c(133L, 137L, 135L, 128L, 137L, 140L, 138L, 135L, 126L, 125L),
    c(106L, 110L, 112L,  96L, 106L, 108L, 113L, 112L,  98L, 108L),
    c(119L, 126L, 125L, 115L, 124L, 125L, 124L, 124L, 115L, 116L),
    c(120L, 126L, 126L, 116L, 125L, 126L, 125L, 125L, 116L, 117L),
    c(128L, 133L, 128L, 124L, 128L, 133L, 126L, 128L, 119L, 120L))

  truth <- list(
    c(278L, 278L, 278L, 279L, 278L, 278L, 278L, 279L, 278L, 278L),
    c(278L, 278L, 278L, 279L, 278L, 278L, 278L, 279L, 278L, 278L),
    c(278L, 278L, 278L, 279L, 278L, 278L, 278L, 279L, 278L, 278L),
    c(278L, 278L, 278L, 279L, 278L, 278L, 278L, 279L, 278L, 278L),
    c(278L, 278L, 278L, 279L, 278L, 278L, 278L, 279L, 278L, 278L),
    c(278L, 278L, 278L, 279L, 278L, 278L, 278L, 279L, 278L, 278L),
    c(278L, 278L, 278L, 279L, 278L, 278L, 278L, 279L, 278L, 278L),
    c(278L, 278L, 278L, 279L, 278L, 278L, 278L, 279L, 278L, 278L),
    c(278L, 278L, 278L, 279L, 278L, 278L, 278L, 279L, 278L, 278L),
    c(278L, 278L, 278L, 279L, 278L, 278L, 278L, 279L, 278L, 278L)
  )
  for(i in seq_along(vegstart)){
    expect_equal(vegperiod:::.end_NuskeAlbert(df, start=vegstart[[i]], Tmin=5),
                 truth[[i]])
  }

  # change start
  expect_equal(vegperiod:::.end_NuskeAlbert(df, start = 200, Tmin = 5),
               c(278L, 278L, 278L, 279L, 278L, 278L, 278L, 279L, 278L, 278L))
  expect_equal(vegperiod:::.end_NuskeAlbert(df, start = 100, Tmin = 5),
               c(278L, 278L, 278L, 279L, 278L, 278L, 278L, 279L, 278L, 278L))
  expect_equal(vegperiod:::.end_NuskeAlbert(df, start = NA, Tmin = 5),
               c(278L, 278L, 278L, 279L, 278L, 278L, 278L, 279L, 278L, 278L))

  # change Tmin
  expect_equal(vegperiod:::.end_NuskeAlbert(df, start = NA, Tmin = 2),
               c(278L, 278L, 278L, 279L, 278L, 278L, 278L, 279L, 278L, 278L))
  expect_equal(vegperiod:::.end_NuskeAlbert(df, start = NA, Tmin = 10),
               c(274L, 278L, 278L, 279L, 278L, 271L, 278L, 279L, 278L, 278L))
  expect_equal(vegperiod:::.end_NuskeAlbert(df, start = NA, Tmin = 15),
               c(186L, 255L, 237L, 252L, 218L, 186L, 217L, 236L, 187L, 193L))
})


#-- StdMeteo  -----------------------------------------------------------------
test_that("StdMeteo works", {
  # canonical
  expect_equal(vegperiod:::.end_std_meteo(df, Tmin = 5),
               c(347L, 329L, 323L, 333L, 327L, 308L, 354L, 322L, 321L, 356L))

  # low Tmin
  expect_equal(vegperiod:::.end_std_meteo(df, Tmin = 3),
               c(348L, 348L, 324L, 347L, 327L, 0L, 357L, 323L, 326L, 357L))

  # high Tmin
  expect_equal(vegperiod:::.end_std_meteo(df, Tmin = 10),
               c(288L,310L, 293L, 302L, 283L, 279L, 288L, 292L, 280L, 314L))
})


#--  clean up  ----------------------------------------------------------------
rm(df)
