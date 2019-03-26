context("test radjust_sym()")
test_that(
  "The examples work and the outputs are equal to the saved copies",
  {
    sink("NUL")
    suppressMessages(example(topic = "radjust_sym", package = "radjust", lib.loc = .libPaths(), echo = FALSE))
    sink()
    eo <- radjust:::examples_outputs_for_testing
    expect_equivalent(mice_rv_adaptive, eo$mice_rv_adaptive)
    expect_equivalent(mice_rv_non_adpt_sel, eo$mice_rv_non_adpt_sel)
    expect_equivalent(mice_rv_non_adpt, eo$mice_rv_non_adpt)
})

test_that(
  "a basic example works & the output is in the appropriate format",
  {
    pv1 <- c((1:20)/150)
    pv2 <- c((1:20)/150)
    output <- radjust_sym(pv1, pv2)
    expect_s3_class(output,"radjust")
    expect_type(output,"list")
    expect_length(output,9)
  })

test_that(
  "input validations works, so the function output the appropriate errors\\warnings",
  {
    pv1 <- c((1:20)/150)
    pv2 <- c((1:20)/150)

    expect_error(radjust_sym(pv1,pv2 = "a"), regexp = 'is.vector.*is not TRUE')
    expect_error(radjust_sym(pv1), regexp = 'argument "pv2" is missing, with no default')
    expect_error(radjust_sym(pv1,pv2 = 1:10), regexp = 'pv2 <= 1 are not all TRUE')
    expect_error(radjust_sym(pv1,pv2, w1 = 2), regexp = 'w1 < 1 is not TRUE')
    expect_error(radjust_sym(pv1,pv2, general_dependency = 1234), regexp = 'general_dependency')
    expect_error(radjust_sym(pv1,pv2, directional_rep_claim = 1234), regexp = 'directional_rep_claim')

    expect_error(radjust_sym(pv1,pv2, alpha = NULL), regexp = "variant != 'non-adaptive' but alpha value is not specified")
    expect_warning(radjust_sym(pv1,pv2, variant = "non-adaptive", alpha = 0.05), regexp = "variant == 'non-adaptive', alpha value is ignored")
  })


test_that( "weight argument functional and its direction is right.",{
  pv1 <- c((1:20)/100)
  pv2 <- c((1:20)/100)

  n_selected1_when_equal_weights <- radjust_sym(pv1,pv2)$n_selected1
  n_selected1_when_p1_weight_smaller <- radjust_sym(pv1,pv2,w1 = .1)$n_selected1
  n_selected1_when_p1_weight_larger <- radjust_sym(pv1,pv2,w1 = .9)$n_selected1

  expect_gt(n_selected1_when_equal_weights, n_selected1_when_p1_weight_smaller)
  expect_lt(n_selected1_when_equal_weights, n_selected1_when_p1_weight_larger)
})

test_that("when general dependency is TRUE the adjusted r value increases",{
  pv1 <- c((1:20)/100)
  pv2 <- c((1:20)/100)

  general_dep_false <- radjust_sym(pv1,pv2)$results_table$r_value[1]
  general_dep_true <- radjust_sym(pv1,pv2, general_dependency = T)$results_table$r_value[1]
  expect_gt(general_dep_true, general_dep_false)
})

test_that("when directional_rep_claim = T , the direction is infered correctlly",{
  pv1 <- c((1:20)/100)
  pv2 <- c((1:20)/100)

  expect_true(all(radjust_sym(pv1,pv2,directional_rep_claim = T)$results_table$Direction == "Left"))

  pv1 <- 1-c((1:20)/100)
  pv2 <- 1-c((1:20)/100)

  expect_true(all(radjust_sym(pv1,pv2,directional_rep_claim = T)$results_table$Direction == "Right"))

  pv1 <- 1-c((1:20)/100)
  pv2 <- c((1:20)/100)

  expect_true( nrow(radjust_sym(pv1,pv2,directional_rep_claim = T)$results) == 0 )
})

test_that("increase in alpha makes more rejections",{
  pv1 <- c((1:20)/100)
  pv2 <- c((1:20)/100)
  default_alpha <- radjust_sym(pv1,pv2)$results_table$r_value
  larger_alpha <- radjust_sym(pv1,pv2,alpha = 0.1)$results_table$r_value
  expect_gt(length(larger_alpha), length(default_alpha))
})

test_that("adaptive variant rejects more",{
  pv1 <- c((1:20)/100)
  pv2 <- c((1:20)/100)
  default_variant <- radjust_sym(pv1,pv2)$results_table$r_value
  variant_adaptive <- radjust_sym(pv1,pv2,variant = "adaptive")$results_table$r_value
  expect_gt(length(variant_adaptive), length(default_variant))
})

