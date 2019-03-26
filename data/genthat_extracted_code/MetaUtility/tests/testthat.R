library(testthat)
library(MetaUtility)
library(devtools)



##### prop_stronger function #####

test_that("prop_stronger #1", {

  # proportion above and below should sum to 1
  expect_equal( 1,
                prop_stronger( q = .5, M = .6, se.M = sqrt(.07), t2 = 0.2, se.t2=sqrt(0.02),
                               CI.level=0.95, tail = "above" )$Est +
                  prop_stronger( q = .5, M = .6, se.M = sqrt(.07), t2 = 0.2, se.t2=sqrt(0.02),
                                 CI.level=0.95, tail = "below" )$Est
                  )

  q = 0.5
  M = 0.6
  se.M = sqrt(0.07)
  t2 = 0.2
  se.t2 = 0.02
  CI.level = 0.9

  phat = prop_stronger( q = q, M = M, se.M = se.M, t2 = t2, se.t2=se.t2,
                      CI.level=CI.level, tail = "above" )

  expect_equal( 1 - pnorm( ( q - M ) / sqrt( t2 ) ), phat$Est )

  expect_equal( sqrt( (se.M^2 / t2) + ( ( se.t2^2 * (q - M)^2 ) / ( 4 * t2^3 ) ) ) * dnorm( ( q - M ) / sqrt( t2 ) ),
                phat$SE )

  alpha = 1 - CI.level
  crit = qnorm( 1 - alpha/2 )

  expect_equal( min( 1, phat$Est + phat$SE * crit ), phat$hi )
  expect_equal( max( 0, phat$Est - phat$SE * crit ), phat$lo )

})


test_that("prop_stronger #2", {

 # proportion below a preventive effect
  q = 0
  M = -0.2
  se.M = sqrt(0.002)
  t2 = 0.4
  se.t2 = sqrt(0.02)
  CI.level = 0.75

  phat = prop_stronger( q = q, M = M, se.M = se.M, t2 = t2, se.t2=se.t2,
                      CI.level=CI.level, tail = "below" )

  expect_equal( pnorm( ( q - M ) / sqrt( t2 ) ), phat$Est )

  expect_equal( sqrt( (se.M^2 / t2) + ( ( se.t2^2 * (q - M)^2 ) / ( 4 * t2^3 ) ) ) * dnorm( ( q - M ) / sqrt( t2 ) ),
                phat$SE )

  alpha = 1 - CI.level
  crit = qnorm( 1 - alpha/2 )

  expect_equal( min( 1, phat$Est + phat$SE * crit ), phat$hi )
  expect_equal( max( 0, phat$Est - phat$SE * crit ), phat$lo )

})



