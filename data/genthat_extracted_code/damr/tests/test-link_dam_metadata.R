context("link_dam_metadata")

test_that("link_dam_metadata works as expected on single files", {
  root_dir = damr_example_dir()
  metadata = data.table::data.table(file="M064.txt",
                                    # note the time (10:00) is added as reference time
                                    start_datetime = c("2017-07-01 10:00:00", "2017-07-02 10:00:00"),
                                    stop_datetime = "2017-07-07",
                                    region_id=c(1:32),
                                    condition=rep(letters[1:2],each=16),
                                    genotype=c("A", "A", "B", "B"))

  q <- link_dam_metadata(metadata,root_dir)


  expect_identical(colnames(q), c("id", "file_info", colnames(metadata)[-1]))

  # implicit region 1:32
  metadata = data.table::data.table(file="M064.txt",
                                 # note the time (10:00) is added as reference time
                                 start_datetime = c("2017-07-01 10:00:00"),
                                 stop_datetime = "2017-07-07")

  q <- link_dam_metadata(metadata,root_dir)

  expect_equal(nrow(q), 32)
  expect_identical(q$region_id, 1:32)

  # 00 reference time
  query = data.table::data.table(file="M064.txt",
                                 start_datetime = c("2017-07-02 00:00:00"),
                                 stop_datetime = "2017-07-07")

  q <- link_dam_metadata(metadata,root_dir)
  expect_equal(nrow(q), 32)
  expect_identical(q$region_id, 1:32)
})




test_that("link_dam_metadata works as expected on two files", {
  sample_files <- c("M064.txt", "M014.txt")
  root_dir = damr_example_dir()
  metadata = data.table::data.table(file=rep(sample_files, each=32),
                                 # note the time (10:00) is added as reference time
                                 start_datetime = c("2017-07-01 10:00:00"),
                                 stop_datetime = "2017-07-07",
                                 region_id=c(1:32),
                                 condition=rep(letters[1:2],each=16),
                                 genotype=c("A", "A", "B", "B"))

  q <- link_dam_metadata(metadata,root_dir)

  expect_equal(nrow(q), 64)
})





# test_that("link_dam_metadata fails if file does not exist", {
#   sample_files <- "NotAFile.txt"
#   root_dir = damr_example_dir()
#   query = data.table::data.table(file=rep(sample_files, each=32),
#                                  # note the time (10:00) is added as reference time
#                                  start_datetime = c("2017-07-01 10:00:00"),
#                                  stop_datetime = "2017-07-07",
#                                  region_id=c(1:32),
#                                  condition=rep(letters[1:2],each=16),
#                                  genotype=c("A", "A", "B", "B"))
#
#
#   expect_error(query_dam(root_dir, query), regex="does not exist")
# })


test_that("link_dam_metadata fails if columns are not define in query", {
  sample_files <- "M064.txt"
  root_dir = damr_example_dir()
  metadata = data.table::data.table(filea=rep(sample_files, each=32),
                                 # note the time (10:00) is added as reference time
                                 start_datetime = c("2017-07-01 10:00:00"),
                                 stop_datetime = "2017-07-07",
                                 region_id=c(1:32),
                                 condition=rep(letters[1:2],each=16),
                                 genotype=c("A", "A", "B", "B"))

  expect_error(link_dam_metadata(metadata,root_dir), regex="MUST have.*three columns")
})

