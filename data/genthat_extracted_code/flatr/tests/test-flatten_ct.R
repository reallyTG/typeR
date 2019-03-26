context("Flatten")

test_that("Flat data frame has the same number of rows as the contingency table", {
  expect_equal(
    (lung_cancer %>%
      flatten_ct() %>%
      dim()
    )[1]
    ,sum(lung_cancer)
  )
})

test_that("Flat data frame has the same number of columns as the contingency table has dimensions", {
  expect_equal(
    (lung_cancer %>%
      flatten_ct() %>%
      dim()
    )[2]
    ,lung_cancer %>%
      dim() %>%
      length()
  )
})


test_that("Flat data frame has the same number of levels as the contingency table", {
  expect_equal(
    c(
      nlevels(flatten_ct(lung_cancer)$Smoking)
      ,nlevels(flatten_ct(lung_cancer)$Lung)
      ,nlevels(flatten_ct(lung_cancer)$City)
    )
    ,dim(lung_cancer)
  )
})
