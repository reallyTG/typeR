context("Goodness of Fit Test")

test_that("Test Statistic matches what is expected", {
  expect_equal(
    (lung_cancer %>%
      flatten_ct() %>%
      glm(
        Lung ~ City + Smoking
        ,family = binomial
        ,data = .
      ) %>%
      goodness_of_fit(type = "Chisq")
    )$statistic
    ,5.199866-3.04e-07
  )
})

test_that("Degrees of freedom is what is expected", {
  expect_equal(
    (lung_cancer %>%
       flatten_ct() %>%
       glm(
         Lung ~ City + Smoking
         ,family = binomial
         ,data = .
       ) %>%
       goodness_of_fit(type = "Chisq")
    )$df
    ,7
  )
})
