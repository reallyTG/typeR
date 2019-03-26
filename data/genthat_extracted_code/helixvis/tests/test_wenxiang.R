context("Test wenxiang diagram drawing")

test_that("wenxiang diagram produces valid ggplot object", {
  # make wheel with 18 alanine residues
  temp.seq <- "AAAAAAAAAAAAAAAAAA"
  temp.wenxiang <- draw_wenxiang(temp.seq)

  # make sure the object is the same as last time (reset if necessary with updates)
  expect_true("ggplot" %in% class(temp.wenxiang))

  # make wheel with fewer residues (all types included)
  temp.seq <- "ADKS"
  temp.wenxiang <- draw_wenxiang(temp.seq)

  # make sure the object is the same as last time (reset if necessary with updates)
  expect_true("ggplot" %in% class(temp.wenxiang))

  # check with labels
  temp.wenxiang <- draw_wenxiang(temp.seq, labels = TRUE)

  # make sure ggplot object is returned
  expect_true("ggplot" %in% class(temp.wenxiang))
  
  # check with legend
  temp.wenxiang <- draw_wenxiang(temp.seq, legend = TRUE)
  
  # make sure ggplot2 still works
  expect_true("ggplot" %in% class(temp.wenxiang))
})
