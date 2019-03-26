context("slowrake")

data("dog_pubs")

test_that("slowrake works for non-atomic, non-empty char vectors", {
  out <- slowrake(dog_pubs$abstract[1:10])
  expect_equal(length(out), 10)
})

test_that("slowrake returns a score when there is only one word in txt", {
  out <- slowrake("dog")
  expect_true(is.numeric(out[[1]]$score))
})

test_that("slowrake works for txt without alpha chars", {
  out <- slowrake("")
  expect_true(is.na(unlist(out)))
})

test_that("slowrake works when all txt is removed based on POS tags", {
  out <- slowrake("walking")
  expect_true(is.na(unlist(out)))
})

test_that("slowrake removes stop words", {
  out <- slowrake("dogs", stop_words = "dogs")
  expect_true(is.na(unlist(out)))
})

test_that("pos stopping works as expected", {
  out1 <- slowrake("dogs are awesome", stop_pos = "NNS")
  out2 <- slowrake("dogs found food", stop_pos = NULL)
  expect_true(
    nrow(out2[[1]]) == 1 && nrow(out2[[1]]) == 1
  )
})

test_that("word_min_char filtering works as expected", {
  out <- slowrake("dogs", word_min_char = 5)
  expect_true(is.na(unlist(out)))
})