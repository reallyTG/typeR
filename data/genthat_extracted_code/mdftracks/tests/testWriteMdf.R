library(mdftracks)
library(tools)
context("Writing mdf tracks")

# Load reference data
load('test_df.RData')

ref_expected_output <- "^MTrackJ [0-9.]+ Data File
Assembly 1
Cluster 1
Track 1
Point 1 187.1 263.2 27.4 1 1
Point 2 309.2 264.4 15.8 2 1
Track 2
Point 1 18.4 438.5 28.1 1 1
Point 2 142.9 58.6 28.2 2 1
Point 3 290.1 197.5 18.8 3 1
Track 3
Point 1 310.1 15.4 5.8 1 1
Track 4
Point 1 99.1 33.5 22.5 1 1
Point 2 220.2 396 16.4 2 1
Track 5
Point 1 8.4 305.8 30.2 1 1
Point 2 84.7 227.7 21.1 2 1
End of MTrackJ Data File$"
ref.file <- 'test_mdf.mdf'

# md5 of test_mdf.mdf (dos and unix line endings)
ref.mdf5s <- c('9b98632350636ab11735feed7fb60958', 'ebe73d04d76925f36c6fbeb74f076bca')

test_that("Data frames with columns id, t, x, y, z (MotilyLab) can be exported
          using default arguments (numeric columns)", {
  expect_output(write.mdf(test.df[,c('uid','t', 'x', 'y', 'z')]),
                ref_expected_output)
})

test_that("Factor columns are converted to numeric", {
  temp.df <- test.df[,c('uid','t', 'x', 'y', 'z')]
  temp.df$uid <- as.factor(temp.df$uid)
  expect_message(capture.output(write.mdf(temp.df)),
                 "Converting factor to numeric in columns: uid")
})

test_that("Output to file works", {
  file <- "temp_test_mdf.mdf"
  unlink(file)
  on.exit(unlink(file))
  write.mdf(test.df, file, cluster.column = "cl", id.column = "id",
            time.column = "t", pos.columns = letters[24:26],
            channel.column = "ch", point.column = "p")
  expect_true(file.exists(file))
  expect_true(md5sum(file)[[1]] %in% ref.mdf5s)
})

test_that("Output to file connection works when connection is closed", {
  file <- "temp_test_mdf.mdf"
  unlink(file)
  on.exit(unlink(file))
  con <- file(file)
  expect_false(isOpen(con))
  write.mdf(test.df, con, cluster.column = "cl", id.column = "id",
            time.column = "t", pos.columns = letters[24:26],
            channel.column = "ch", point.column = "p")
  expect_true(file.exists(file))
  expect_true(md5sum(file)[[1]] %in% ref.mdf5s)
})

test_that("Output to connection works", {
  dest.string <- ""
  con <- textConnection("dest.string", open = "w", local = T)
  on.exit(close(con))
  write.mdf(test.df[,c('uid','t', 'x', 'y', 'z')], con)
  expect_output(writeLines(dest.string), ref_expected_output)
  expect_true(isOpen(con))
})

test_that("Output to non-connections fails", {
  expect_error(write.mdf(test.df[,c('uid','t', 'x', 'y', 'z')], file = T),
               "'file' must be a character string or connection", fixed = T)
})

test_that("time is correctly scaled", {
  expected_output <- "^MTrackJ [0-9.]+ Data File
Assembly 1
Cluster 1
Track 1
Point 1 187.1 263.2 27.4 0.1 1
Point 2 309.2 264.4 15.8 0.2 1
Track 2
Point 1 18.4 438.5 28.1 0.1 1
Point 2 142.9 58.6 28.2 0.2 1
Point 3 290.1 197.5 18.8 0.3 1
Track 3
Point 1 310.1 15.4 5.8 0.1 1
Track 4
Point 1 99.1 33.5 22.5 0.1 1
Point 2 220.2 396 16.4 0.2 1
Track 5
Point 1 8.4 305.8 30.2 0.1 1
Point 2 84.7 227.7 21.1 0.2 1
End of MTrackJ Data File$"
            expect_output(write.mdf(test.df[,c('uid','t', 'x', 'y', 'z')],
                                    scale.time = 0.1),
                          expected_output)
})

test_that("Default channel is set correctly", {
  expected_output <- "^MTrackJ [0-9.]+ Data File
Assembly 1
Cluster 1
Track 1
Point 1 187.1 263.2 27.4 1 2
Point 2 309.2 264.4 15.8 2 2
Track 2
Point 1 18.4 438.5 28.1 1 2
Point 2 142.9 58.6 28.2 2 2
Point 3 290.1 197.5 18.8 3 2
Track 3
Point 1 310.1 15.4 5.8 1 2
Track 4
Point 1 99.1 33.5 22.5 1 2
Point 2 220.2 396 16.4 2 2
Track 5
Point 1 8.4 305.8 30.2 1 2
Point 2 84.7 227.7 21.1 2 2
End of MTrackJ Data File$"
  expect_output(write.mdf(test.df[,c('uid','t', 'x', 'y', 'z')],
                          default.channel = 2),
                expected_output)
})

test_that("2D data has Z = 1.0", {
  expected_output <- "^MTrackJ [0-9.]+ Data File
Assembly 1
Cluster 1
Track 1
Point 1 187.1 263.2 1 1 1
Point 2 309.2 264.4 1 2 1
Track 2
Point 1 18.4 438.5 1 1 1
Point 2 142.9 58.6 1 2 1
Point 3 290.1 197.5 1 3 1
Track 3
Point 1 310.1 15.4 1 1 1
Track 4
Point 1 99.1 33.5 1 1 1
Point 2 220.2 396 1 2 1
Track 5
Point 1 8.4 305.8 1 1 1
Point 2 84.7 227.7 1 2 1
End of MTrackJ Data File$"
  expect_output(write.mdf(test.df[,c('uid','t', 'x', 'y')],
                          pos.columns = letters[24:25]),
                expected_output)
})

test_that("all columns specified", {
  expected_output <- "^MTrackJ [0-9.]+ Data File
Assembly 1
Cluster 1
Track 1
Point 1 187.1 263.2 27.4 1 2
Point 3 309.2 264.4 15.8 2 2
Track 2
Point 1 18.4 438.5 28.1 1 2
Point 2 142.9 58.6 28.2 2 2
Point 5 290.1 197.5 18.8 3 2
Cluster 2
Track 1
Point 1 310.1 15.4 5.8 1 2
Track 2
Point 1 99.1 33.5 22.5 1 2
Point 2 220.2 396 16.4 2 2
Track 3
Point 1 8.4 305.8 30.2 1 2
Point 2 84.7 227.7 21.1 2 2
End of MTrackJ Data File$"
  expect_output(write.mdf(test.df, cluster.column = 'cl', id.column = 'id',
                          pos.columns = letters[24:26], channel.column = 'ch',
                          point.column = 'p', time.column = 't'),
                expected_output)
})

test_that("Invalid column specification should give errors", {
  expect_error(
    write.mdf(test.df[,c('uid','t', 'x', 'y', 'z')], id.column = "id"),
    "Column(s) not found: id", fixed = T)
  expect_error(
    write.mdf(test.df[,c('uid','t', 'x', 'y', 'z')], id.column = 10),
    "Column(s) not found: 10", fixed = T)
})
