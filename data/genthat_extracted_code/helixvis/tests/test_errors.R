context("Ensure error checking is intact")

test_that("Invalid residues are recognized", {
  # make sequence with invalid residue "X"
  aa.seq <- "AXAMDE"

  # making helical wheel should throw error
  expect_error(draw_wheel(aa.seq), "ERROR: X is not a valid one-letter code for an amino acid.")

  # making wenxiang diagram should throw error
  expect_error(draw_wenxiang(aa.seq), "ERROR: X is not a valid one-letter code for an amino acid.")
})

test_that("Sequences of incorrect length are recognized", {
  # sequences that are too short and too long
  aa.short <- "A"
  aa.long <- paste(rep("A", 19), collapse = "")

  # making helical wheel should throw error
  expect_error(draw_wheel(aa.short), "ERROR: sequence must have between 2 and 18 \\(inclusive\\) characters.")
  expect_error(draw_wheel(aa.long), "ERROR: sequence must have between 2 and 18 \\(inclusive\\) characters.")

  # making wenxiang diagram should throw error
  expect_error(draw_wenxiang(aa.short), "ERROR: sequence must have at least 2 characters.")
  expect_error(draw_wenxiang(aa.long), "ERROR: sequence must have less than or equal to 18 characters.")
})

test_that("Invalid colors are recognized", {
  # test sequence (fat-soluble vitamins)
  aa.seq <- "ADEK"

  # drawing wheel should throw error (invalid colors)
  expect_error(draw_wheel(aa.seq,
                          col = c("xpy", "blue", "green", "red")),
               "ERROR: parameter `col` has invalid, missing, or too many colors.")

  # drawing wenxiang diagram should throw error (too many colors)
  expect_error(draw_wenxiang(aa.seq,
                             col = c("red", "blue", "black", "yellow", "green")),
               "ERROR: parameter `col` has invalid, missing, or too many colors.")

})

test_that("Invalid labels and label.col parameters is recognized", {
  # test sequence (fat-soluble vitamins)
  aa.seq <- "ADEK"

  # drawing wheel should throw error (invalid labels value)
  expect_error(draw_wheel(aa.seq, labels = 2))

  # drawing wheel should throw error (invalid label.col value, xxx is not a color)
  expect_error(draw_wheel(aa.seq, labels = TRUE, label.col = "xxx"))

  # drawing wenxiang should throw error (invalid labels value)
  expect_error(draw_wenxiang(aa.seq, labels = "a"))

  # drawing wenxiang should throw error (invalid label.col value, xxx is not a color)
  expect_error(draw_wenxiang(aa.seq, labels = TRUE, label.col = "xxx"))
})
