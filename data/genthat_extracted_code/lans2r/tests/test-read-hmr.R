context("Read HMR files")

test_that("test that can read HMR file", {
  
  expect_true(file.exists(system.file("extdata", "nanosims_data", "hmr", package = "lans2r")))
  
  expect_true(is(hmr <- load_HMR(system.file("extdata", "nanosims_data", "hmr", package = "lans2r"), 
                          prefix = "", suffix = ".hmr_txt"), "data.frame"))
  
  # check data
  expect_equal({
    summary <- hmr %>% select(-step, -voltage, -cts) %>% distinct()
    summary$ion
  }, c("1H", "2H"))
  
  expect_equal(summary$trolley, c("#0", "#1"))
  expect_equal(summary$B, c("998.7", "998.7"))
  expect_equal(summary$R, c("130.53", "184.90"))
  expect_equal(summary$M, c("1.025", "2.056"))
  
})