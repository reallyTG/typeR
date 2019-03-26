library(mdftracks)
context("Reading mdf tracks")

# Load reference data
load('test_df.RData')

ref_text <-
  c("MTrackJ 1.5.1 Data File", "Assembly 1", "Cluster 1", "Track 1",
    "Point 1 187.1 263.2 27.4 1.0 2.0", "Point 3 309.2 264.4 15.8 2.0 2.0",
    "Track 2", "Point 1 18.4 438.5 28.1 1.0 2.0", "Point 2 142.9 58.6 28.2 2.0 2.0",
    "Point 5 290.1 197.5 18.8 3.0 2.0", "Cluster 2", "Track 1", "Point 1 310.1 15.4 5.8 1.0 2.0",
    "Track 2", "Point 1 99.1 33.5 22.5 1.0 2.0", "Point 2 220.2 396.0 16.4 2.0 2.0",
    "Track 3", "Point 1 8.4 305.8 30.2 1.0 2.0", "Point 2 84.7 227.7 21.1 2.0 2.0",
    "End of MTrackJ Data File")

ref_text_1_cluster <-
  c("MTrackJ 1.5.1 Data File", "Assembly 1", "Cluster 1", "Track 1",
  "Point 1 187.1 263.2 27.4 1.0 1.0", "Point 2 309.2 264.4 15.8 2.0 1.0",
  "Track 2", "Point 1 18.4 438.5 28.1 1.0 1.0", "Point 2 142.9 58.6 28.2 2.0 1.0",
  "Point 3 290.1 197.5 18.8 3.0 1.0", "Track 3", "Point 1 310.1 15.4 5.8 1.0 1.0",
  "Track 4", "Point 1 99.1 33.5 22.5 1.0 1.0", "Point 2 220.2 396.0 16.4 2.0 1.0",
  "Track 5", "Point 1 8.4 305.8 30.2 1.0 1.0", "Point 2 84.7 227.7 21.1 2.0 1.0",
  "End of MTrackJ Data File")

test_that("Loading without arguments should have cl, id, t, x:z", {
  expect_equivalent(read.mdf('test_mdf.mdf'),
                    test.df[,c('cl', 'id', 't', letters[24:26])])
})

test_that("Reading from file connection works when connection is closed", {
  file <- "test_mdf.mdf"
  con <- file(file)
  expect_false(isOpen(con))
  expect_equivalent(read.mdf(con),
                    test.df[,c('cl', 'id', 't', letters[24:26])])
})

test_that("Testing drop.Z for 2D data", {
  expect_equivalent(read.mdf('test_mdf.mdf', drop.Z = T),
                    test.df[,c('cl', 'id', 't', letters[24:25])])
})

test_that("Include point numbers", {
  expect_equivalent(read.mdf('test_mdf.mdf', include.point.numbers = T),
                    test.df[,c('cl', 'id', 't', letters[24:26], 'p')])
})

test_that("Include channel", {
  expect_equivalent(read.mdf('test_mdf.mdf', include.channel = T),
                    test.df[,c('cl', 'id', 't', letters[24:26], 'ch')])
})

test_that("Reading from text works", {
  expect_equivalent(read.mdf(text = ref_text),
                    test.df[,c('cl', 'id', 't', letters[24:26])])
})

test_that("Generate unique ids", {
  # With one cluster (id should be uid)
  temp.df <- read.mdf(text = ref_text_1_cluster, generate.unique.ids = T)
  expect_equal(temp.df$uid, temp.df$id)
  # With more clusters
  expect_equivalent(read.mdf('test_mdf.mdf', generate.unique.ids = T),
                    test.df[,c('cl', 'id', 't', letters[24:26], 'uid')])

})

test_that("Error if not mdf format", {
  expect_error(read.mdf(text = "not mdf"),
               "does not appear to be an MTrackJ Data File")
})

test_that("Reading from non-connections fails", {
  expect_error(read.mdf(file = T),
               "'file' must be a character string or connection", fixed = T)
})

