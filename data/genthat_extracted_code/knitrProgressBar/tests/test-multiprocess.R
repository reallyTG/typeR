context("multiprocess")

long_fun <- function(x, .pb = NULL){

  update_progress(.pb)
  Sys.sleep(0.01)
}

library(parallel)

test_that("writing dots works", {
  withr::with_file("progress1.txt",
                   {
                     pb_i <- set_progress_mp("progress1.txt")
                     mclapply(seq(1, 50), long_fun, .pb = pb_i)
                     n_iter <- scan("progress1.txt", what = character(), quiet = TRUE)
                     expect_equal(nchar(n_iter), 50)
                   })

})

# test_that("messaging works", {
#                      pb_i <- set_progress_mp("progress2.txt")
#                      mclapply(seq(1, 50), long_fun, .pb = pb_i)
#                      #progress_file <- withr::local_file("messaging")
#                      pb_w <- watch_progress_mp(100, watch_location = "progress2.txt", progress_location = "messaging.txt")
#                      pb_w
#                      expect_match(scan("messaging.txt", what = character(), quiet = TRUE), "50")
#
# })