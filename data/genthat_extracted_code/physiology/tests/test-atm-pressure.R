context("atmospheric pressure")

test_that("human altitudes run", {
  pres_atm_kPa(-430.5) # Dead Sea
  pres_atm_kPa(0)
  pres_atm_kPa(3440) # Namche Bazaar
  pres_atm_kPa(4260) # Dingboche
  pres_atm_kPa(5364) # Everest Base Camp
  pres_atm_kPa(6000) # Camp 1
  pres_atm_kPa(6400) # Camp 2
  pres_atm_kPa(7200) # Camp 3
  pres_atm_kPa(7950) # Camp 4
  pres_atm_kPa(8850) # Everest summit
  pres_atm_frac(8850) # fraction of sea level pressure on Everest
})

test_that("high atmosphere", {
  lapply(seq.default(-1000, to = 84000, by = 997),
         function(x) {
           expect_error(regexp = NA, pres_atm_frac(x))
           }
         )
})

test_that("out of upper range", {
  expect_error(regexp = NA, pres_atm_kPa(altitude_m = 84849))
  expect_error(pres_atm_kPa(altitude_m = 848500))
  expect_error(pres_atm_kPa(altitude_m = 1e6))
})
