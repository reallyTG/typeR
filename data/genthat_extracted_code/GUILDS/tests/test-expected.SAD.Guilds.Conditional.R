context("expected.SAD.Guilds.Conditional")

test_that("expected.SAD.Guilds.Conditional: use", {
  skip_on_cran()
  SAD <- expected.SAD.Guilds.Conditional(theta = 200, 
                                         alpha_x = 0.1,
                                         alpha_y = 0.01,
                                         Jx = 1000,
                                         Jy = 1000,
                                         n_replicates = 10)
  
  S1 <- sum(SAD$guildX)
  S2 <- sum(SAD$guildY)
  a <- S1 > S2
  expect_equal(a,TRUE) #because alpha_x > alpha_y
  
  SAD <- expected.SAD.Guilds.Conditional(theta = 200, 
                                         alpha_x = 0.1,
                                         alpha_y = 0.1,
                                         Jx = 3000,
                                         Jy = 1000,
                                         n_replicates = 10)
  
  S1 <- sum(SAD$guildX)
  S2 <- sum(SAD$guildY)
  a <- S1 > S2
  expect_equal(a,TRUE) #because Jx > Jy
})


test_that("expected.SAD.Guilds.Conditional: abuse", {
  skip_on_cran()
  n_replicates = 2
  Jx = 10
  Jy = 20
  
  expect_error(
    SAD <- expected.SAD.Guilds.Conditional(theta = 200, 
                               alpha_x = 1.0,
                               alpha_y = 1.0,
                               Jx, Jy,
                               n_replicates),
    "alpha_x and alpha_y are both one, leading to I_x = I_y = Inf"
  )
  
  J <- 100
  expect_error(
    SAD <- expected.SAD.Guilds.Conditional(theta = -20, 
                                           alpha_x = 0.09, 
                                           alpha_y = 0.5, 
                                           Jx, Jy, n_replicates),
    "theta can not be below one")
  
  expect_error(
    SAD <- expected.SAD.Guilds.Conditional(theta = 20, 
                                           alpha_x = -0.09, 
                                           alpha_y = 0.5, 
                                           Jx, Jy, n_replicates),
    "alpha_x can not be below zero")
  
  expect_error(
    SAD <- expected.SAD.Guilds.Conditional(theta = 20, 
                                           alpha_x = 0.09, 
                                           alpha_y = -0.5, 
                                           Jx, Jy, n_replicates),
    "alpha_y can not be below zero")
  
  expect_error(
    SAD <- expected.SAD.Guilds.Conditional(theta = 20, 
                                           alpha_x = 1.09, 
                                           alpha_y = 0.5, 
                                           Jx, Jy, n_replicates),
    "alpha_x can not be above 1")
  expect_error(
    SAD <- expected.SAD.Guilds.Conditional(theta = 20, 
                                           alpha_x = 0.09, 
                                           alpha_y = 1.5, 
                                           Jx, Jy, n_replicates),
    "alpha_y can not be above 1")
  expect_error(
    SAD <- expected.SAD.Guilds.Conditional(theta = 20, 
                                           alpha_x = 0.09, 
                                           alpha_y = 0.5, 
                                           Jx = -1, Jy, n_replicates),
    "Jx can not be below one")
  expect_error(
    SAD <- expected.SAD.Guilds.Conditional(theta = 20, 
                                           alpha_x = 0.09, 
                                           alpha_y = 0.5, 
                                           Jx, Jy = -1, n_replicates),
    "Jy can not be below one")
})



