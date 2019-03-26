context("veg_starts")

#--  set up data.frame for tests  ---------------------------------------------
data(goe)
df <- data.frame(year  = as.integer(format(goe$date, "%Y")),
                 month = as.integer(format(goe$date, "%m")),
                 DOY   = as.integer(format(goe$date, "%j")),
                 Tavg=goe$t)



#-- Menzel  -------------------------------------------------------------------
test_that("Menzel works", {
    spec <- c("Larix decidua", "Picea abies (frueh)", "Picea abies (spaet)",
             "Picea abies (noerdl.)", "Picea omorika", "Pinus sylvestris",
             "Betula pubescens", "Quercus robur", "Quercus petraea",
             "Fagus sylvatica")

    true0 <- list(c(102L, 102L,  88L, 100L, 101L, 105L, 102L,  93L,  95L),
                  c(127L, 125L, 116L, 124L, 126L, 124L, 125L, 115L, 116L),
                  c(134L, 131L, 125L, 131L, 135L, 132L, 130L, 121L, 121L),
                  c(134L, 133L, 125L, 133L, 137L, 136L, 133L, 123L, 123L),
                  c(140L, 141L, 132L, 139L, 147L, 142L, 142L, 133L, 128L),
                  c(137L, 135L, 128L, 137L, 140L, 138L, 135L, 126L, 125L),
                  c(110L, 112L,  96L, 106L, 108L, 113L, 112L,  98L, 108L),
                  c(126L, 125L, 115L, 124L, 125L, 124L, 124L, 115L, 116L),
                  c(126L, 126L, 116L, 125L, 126L, 125L, 125L, 116L, 117L),
                  c(133L, 128L, 124L, 128L, 133L, 126L, 128L, 119L, 120L)
    )
    for(i in seq_along(spec)){
      expect_equal(vegperiod:::.start_menzel(df, est.prev=0, species=spec[i]),
                   true0[[i]])
    }

    true1 <- list(
      c( 96L, 102L, 102L,  88L, 100L, 101L, 105L, 102L,  93L,  95L),
      c(119L, 127L, 125L, 116L, 124L, 126L, 124L, 125L, 115L, 116L),
      c(127L, 134L, 131L, 125L, 131L, 135L, 132L, 130L, 121L, 121L),
      c(130L, 134L, 133L, 125L, 133L, 137L, 136L, 133L, 123L, 123L),
      c(140L, 140L, 141L, 132L, 139L, 147L, 142L, 142L, 133L, 128L),
      c(132L, 137L, 135L, 128L, 137L, 140L, 138L, 135L, 126L, 125L),
      c(104L, 110L, 112L,  96L, 106L, 108L, 113L, 112L,  98L, 108L),
      c(118L, 126L, 125L, 115L, 124L, 125L, 124L, 124L, 115L, 116L),
      c(119L, 126L, 126L, 116L, 125L, 126L, 125L, 125L, 116L, 117L),
      c(126L, 133L, 128L, 124L, 128L, 133L, 126L, 128L, 119L, 120L)
    )
    for(i in seq_along(spec)){
      expect_equal(vegperiod:::.start_menzel(df, est.prev=1, species=spec[i]),
                   true1[[i]])
    }

    true3 <- list(
      c( 96L, 102L, 102L,  88L, 100L, 101L, 105L, 102L,  93L,  95L),
      c(119L, 127L, 125L, 116L, 124L, 126L, 124L, 125L, 115L, 116L),
      c(128L, 134L, 131L, 125L, 131L, 135L, 132L, 130L, 121L, 121L),
      c(131L, 134L, 133L, 125L, 133L, 137L, 136L, 133L, 123L, 123L),
      c(140L, 140L, 141L, 132L, 139L, 147L, 142L, 142L, 133L, 128L),
      c(133L, 137L, 135L, 128L, 137L, 140L, 138L, 135L, 126L, 125L),
      c(106L, 110L, 112L,  96L, 106L, 108L, 113L, 112L,  98L, 108L),
      c(119L, 126L, 125L, 115L, 124L, 125L, 124L, 124L, 115L, 116L),
      c(120L, 126L, 126L, 116L, 125L, 126L, 125L, 125L, 116L, 117L),
      c(128L, 133L, 128L, 124L, 128L, 133L, 126L, 128L, 119L, 120L)
    )
    for(i in seq_along(spec)){
      expect_equal(vegperiod:::.start_menzel(df, est.prev=3, species=spec[i]),
                   true3[[i]])
    }

    true10 <- list(
      c(103L, 102L, 102L,  88L, 100L, 101L, 105L, 102L,  93L,  95L),
      c(121L, 127L, 125L, 116L, 124L, 126L, 124L, 125L, 115L, 116L),
      c(130L, 134L, 131L, 125L, 131L, 135L, 132L, 130L, 121L, 121L),
      c(132L, 134L, 133L, 125L, 133L, 137L, 136L, 133L, 123L, 123L),
      c(144L, 140L, 141L, 132L, 139L, 147L, 142L, 142L, 133L, 128L),
      c(133L, 137L, 135L, 128L, 137L, 140L, 138L, 135L, 126L, 125L),
      c(109L, 110L, 112L,  96L, 106L, 108L, 113L, 112L,  98L, 108L),
      c(121L, 126L, 125L, 115L, 124L, 125L, 124L, 124L, 115L, 116L),
      c(122L, 126L, 126L, 116L, 125L, 126L, 125L, 125L, 116L, 117L),
      c(130L, 133L, 128L, 124L, 128L, 133L, 126L, 128L, 119L, 120L)
    )
    for(i in seq_along(spec)){
      expect_equal(vegperiod:::.start_menzel(df, est.prev=10, species=spec[i]),
                   true10[[i]])
    }
})


#--  StdMeteo  ----------------------------------------------------------------
test_that("StdMeteo works", {
  expect_equal(vegperiod:::.start_std_meteo(df),
               c(34L, 36L, 65L, 38L, 69L, 18L, 84L, 64L, 48L, 88L))
  expect_equal(vegperiod:::.start_std_meteo(df, Tmin = 3),
               c(6L, 36L, 10L, 23L, 19L, 17L, 6L, 22L, 12L, 35L))
  expect_equal(vegperiod:::.start_std_meteo(df, Tmin = 7),
               c(34L, 132L, 97L, 83L, 106L, 83L, 98L, 96L, 48L, 112L))
  expect_equal(vegperiod:::.start_std_meteo(df, Tmin = 10),
               c(135L, 133L, 120L, 127L, 135L, 142L, 141L, 119L, 93L, 122L))
  expect_equal(vegperiod:::.start_std_meteo(df, Tmin = 0),
               c(6L, 19L, 10L, 6L, 6L, 16L, 6L, 20L, 6L, 8L))
  expect_equal(vegperiod:::.start_std_meteo(df, Tmin = 3.1415),
               c(6L, 36L, 10L, 23L, 19L, 17L, 6L, 22L, 12L, 35L))
})


#--  Ribes  -------------------------------------------------------------------
test_that("Ribes works", {
  expect_equal(vegperiod:::.start_ribes(df),
               c(82L, 79L, 87L, 74L, 77L, 88L, 89L, 86L, 76L, 83L))
})


#--  clean up  ----------------------------------------------------------------
rm(df)
