context("Line edge cases")
test_that("trailing line breaks & windows line breaks don't cause trouble", {
  read_f <- function(filename) {
    hipread_long(
      filename,
      list(
        a = hip_fwf_widths(c(1, 3, 3), c("rt", "var1", "var2"), c("c", "c", "c")),
        b = hip_fwf_widths(c(1, 3, 3), c("rt", "var1", "var3"), c("c", "c", "c"))
      ),
      hip_rt(1, 1)
    )
  }

  text <- c("axyz123", "buvw456", "aabc789")
  expected <- dplyr::tibble(
    rt = c("a", "b", "a"),
    var1 = c("xyz", "uvw", "abc"),
    var2 = c("123", NA, "789"),
    var3 = c(NA, "456", NA)
  )


  linux_notrail <- tempfile()
  writeLines(paste(text, collapse = "\n"), linux_notrail)
  expect_silent(lnt <- read_f(linux_notrail))

  linux_trail <- tempfile()
  writeLines(paste(c(text, ""), collapse = "\n"), linux_trail)
  expect_silent(lt <- read_f(linux_trail))

  win_notrail <- tempfile()
  writeLines(paste(text, collapse = "\r\n"), win_notrail)
  expect_silent(wnt <- read_f(win_notrail))

  win_trail <- tempfile()
  writeLines(paste(c(text, ""), collapse = "\r\n"), win_trail)
  expect_silent(wt <- read_f(win_trail))

  expect_equal(lnt, expected)
  expect_equal(lt, expected)
  expect_equal(wnt, expected)
  expect_equal(wt, expected)
})


