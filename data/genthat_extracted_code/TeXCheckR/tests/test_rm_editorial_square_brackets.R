context("Remove editorial square brackets")

test_that("Ordinary square brackets are removed", {
  expect_equal(rm_editorial_square_brackets("the call by the Business Council of Australia to ``urgently phas[e] out all the side deals"),
               "the call by the Business Council of Australia to ``urgently phase out all the side deals")

  expect_equal(rm_editorial_square_brackets("[P]hase out all side deals"),
               "Phase out all side deals")

  expect_equal(rm_editorial_square_brackets("[Phase out] all side deals"),
               "Phase out all side deals")
})

test_that("Square brackets forming optional arguments are not removed", {
  expect_equal(rm_editorial_square_brackets("\\begin{addsmallbox}[p]{How to read this report}{null}"),
               "\\begin{addsmallbox}[p]{How to read this report}{null}")
})
