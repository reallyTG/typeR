context("generate.Guilds")

test_that("generate.Guilds: use", {
  skip_on_cran()
  J <- 10000
  v <- generate.ESF(theta = 100, I = 10, J)
  expect_equal(
    sum(v),
    J
  )
  
  v <- generate.ESF(theta = 100, I = Inf, J)
  expect_equal(
    sum(v),
    J
  )
  
  v <- generate.Guilds(theta = 100, alpha_x = 0.1, alpha_y = 0.1, J)
  expect_equal(sum(v$guildX,v$guildY), J)
  
  v <- generate.Guilds(theta = 100, alpha_x = 1, alpha_y = 1, J)
  expect_equal(sum(v$guildX,v$guildY), J)
})

test_that("generate.Guilds: abuse", {
  skip_on_cran()
  expect_error(
    generate.ESF(theta = -1, I = 10, J = 100),
    "theta can not be below one"
  )
  expect_error(
    generate.ESF(theta = 100, I = -10, J = 100),
    "I can not be below zero"
  )
  expect_error(
    generate.ESF(theta = 100, I = 10, J = -100),
    "J can not be below zero"
  )
  
  expect_error(
    generate.Guilds(theta = -1, alpha_x = 0.1, alpha_y = 0.1, J = 100),
    "theta can not be below one"
  )
  
  expect_error(
    generate.Guilds(theta = 10, alpha_x = 0.1, alpha_y = 0.1, J = -100),
    "J can not be below zero"
  )
  
  expect_error(
    generate.Guilds(theta = 10, alpha_x = -0.1, alpha_y = 0.1, J = 100),
    "alpha_x can not be below zero"
  )
  expect_error(
    generate.Guilds(theta = 10, alpha_x = 0.1, alpha_y = -0.1, J = 100),
    "alpha_y can not be below zero"
  )
  expect_error(
    generate.Guilds(theta = 10, alpha_x = 1.1, alpha_y = 0.1, J = 100),
    "alpha_x can not be above one"
  )
  expect_error(
    generate.Guilds(theta = 10, alpha_x = 0.1, alpha_y = 1.1, J = 100),
    "alpha_y can not be above one"
  )
})