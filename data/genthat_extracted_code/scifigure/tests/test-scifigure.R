context("sci_figure checks")

testthat::test_that("warnings and errors in sci_figure", {
  exps <- init_experiments()
  sci_figure(exps)
  sci_figure(exps, hide_stages = c("population", "analyst"))

  # Do some manual manipulation to the experiments

  exps["analyst", "Exp2"] <- "different"
  exps["code", c("Exp2", "Exp3")] <- "unobserved"
  sci_figure(exps)

  # Create the same figure using the difference mode

  sci_figure(exps, diff=TRUE)
  too_many = init_experiments(nexp = 30)

  testthat::expect_warning({
    sci_figure(too_many)
  }, "showing the first")

  exp2 = exps
  exp2[,1] = "bad"
  testthat::expect_error({
    sci_figure(exp2)
  }, "Invalid cell")

  replicate_figure()
  reproduce_figure()
})
