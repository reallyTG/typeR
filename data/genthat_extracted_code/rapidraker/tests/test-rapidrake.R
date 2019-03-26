context("rapidrake")

test_that("rapidrake works for non-atomic, non-empty char vectors", {
  out <- rapidrake(slowraker::dog_pubs$abstract[1:10])
  expect_equal(length(out), 10)
})

test_that("rapidrake returns a score when there is only one word in txt", {
  out <- rapidrake("dog")
  expect_true(is.numeric(out[[1]]$score))
})

test_that("rapidrake works for txt without alpha chars", {
  out <- rapidrake("")
  expect_true(is.na(unlist(out)))
})

test_that("rapidrake works when all txt is removed based on POS tags", {
  out <- rapidrake("walking")
  expect_true(is.na(unlist(out)))
})

test_that("rapidrake can hanlde non-array params", {
  null_out <- rapidrake("hi there old friend", stop_words = "", stop_pos = "NNS")
  expect_true(TRUE)
})

test_that("rapidrake removes stop words", {
  out <- rapidrake("dogs", stop_words = "dogs")
  expect_true(is.na(unlist(out)))
})

test_that("pos stopping works as expected", {
  out <- rapidrake(
    "dogs are awesome", stop_pos = "NNS", word_min_char = 0, stop_words = ""
  )
  expect_true(!grepl("dogs", out[[1]]$keyword, ignore.case = TRUE))
})

test_that("word_min_char filtering works as expected", {
  out <- rapidrake("dogs", word_min_char = 5)
  expect_true(is.na(unlist(out)))
})

test_that("phrase_delims works as expected", {
  out <- rapidrake(
    "dogs are great, arn't they? at least i think they are.",
    stop_words = NULL, stop_pos = NULL, phrase_delims = "[.]", word_min_char = 0
  )
  expect_true(grepl(",", out[[1]]$keyword))
})
