context("test radjust_pf()")
test_that(
  "The examples work and the outputs are equal to the saved copies",
  {
    example(topic = "radjust_pf", package = "radjust", lib.loc = .libPaths(), echo = FALSE)
    eo <- radjust:::examples_outputs_for_testing
    expect_equivalent(rv, eo$rv, tolerance = 5e-5)
    expect_equivalent(rv2, eo$rv2, tolerance = 5e-5)
})

test_that(
  "a basic example works & the output is in the appropriate format",
  {
    pv1 <- c((1:20)/100)
    pv2 <- c((1:20)/100)
    output <- radjust_pf(pv1, pv2,m = 1000)
    expect_type(output,"double")
    expect_length(output,length(pv1))
  })

test_that(
  "input validations works, so the function outputs the appropriate errors\\warnings",
  {

    example(topic = "radjust_pf", package = "radjust", lib.loc = .libPaths(), echo = FALSE)


    data(crohn)
    pv1 <- crohn$pv1
    pv2 <- crohn$pv2
    m <-  635547

    expect_error(
      radjust_pf(pv1[-1], pv2,m),
      regexp = 'equal')

    expect_error(
      radjust_pf(numeric(0), pv2,m),
      regexp = 'zero')

    expect_error(
      radjust_pf(pv1, pv2,m, c2 = 123),
      regexp = 'c2')

    expect_error(
      radjust_pf(pv1, pv2,m, l00 = 123),
      regexp = 'l00')

    expect_error(
      radjust_pf(pv1, pv2,m = 3),
      regexp = 'at least')

    pv1_with_na <- pv1
    pv1_with_na[c(2,4)] <- NA

    expect_error(
      radjust_pf(pv1_with_na , pv2, m),
      regexp = 'NA')

    pv1_with_invalid_value <- pv1
    pv1_with_invalid_value[c(2,4)] <- 1.5

    expect_error(
      radjust_pf(pv1_with_invalid_value , pv2, m),
      regexp = 'in the interval')

    expect_error(
      radjust_pf(pv1,pv2, m , variant = "use_threshold"),
      regexp = "specify")
  })


test_that( "c2 argument functional and its direction is right.",{

  data(crohn)
  pv1 <- crohn$pv1
  pv2 <- crohn$pv2
  m <-  635547

  c2_default <- radjust_pf(pv1, pv2,m)
  c2_large <- radjust_pf(pv1, pv2,m,c2 = 0.99)
  expect_gt(mean(c2_large),mean(c2_default))

})

test_that("when variant is for general dependency, the adjusted r value increases",{
  data(crohn)
  pv1 <- crohn$pv1
  pv2 <- crohn$pv2
  m <-  635547
  general_dep_false <- radjust_pf(pv1,pv2,m)
  general_dep_true <- radjust_pf(pv1,pv2,m, variant = "general_dependency")
  expect_gt(mean(general_dep_true), mean(general_dep_false))
})

test_that("lowering the threshold makes less rejections",{
  data(crohn)
  pv1 <- crohn$pv1
  pv2 <- crohn$pv2
  m <-  635547

  default_t <- radjust_pf(pv1,pv2,m)
  larger_t <- radjust_pf(pv1,pv2,m,variant = "use_threshold", threshold = 0.001)
  expect_gt(mean(larger_t), mean(default_t))
})



