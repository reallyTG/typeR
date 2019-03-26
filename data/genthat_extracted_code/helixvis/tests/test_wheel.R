context("Test helical wheel drawing")

test_that("helical wheel produces valid ggplot object", {
  # make wheel with 18 alanine residues
  temp.seq <- "AAAAAAAAAAAAAAAAAA"
  temp.wheel <- draw_wheel(temp.seq)

  # make sure ggplot object is returned
  expect_true("ggplot" %in% class(temp.wheel))

  # make wheel with fewer residues (all types included)
  temp.seq <- "ADKS"
  temp.wheel <- draw_wheel(temp.seq)

  # make sure ggplot object is returned
  expect_true("ggplot" %in% class(temp.wheel))

  # check with labels
  temp.wheel <- draw_wheel(temp.seq, labels = TRUE)

  # make sure ggplot object is returned
  expect_true("ggplot" %in% class(temp.wheel))
  
  # check with legend
  temp.wheel <- draw_wheel(temp.seq, legend = TRUE)
  
  # make sure ggplot2 still works
  expect_true("ggplot" %in% class(temp.wheel))
})
