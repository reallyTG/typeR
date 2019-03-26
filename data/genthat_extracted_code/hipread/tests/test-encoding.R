library(hipread)

context("Encodings work")

test_that("latin1 and utf-8 match", {
  expect_equal(
    hipread_long(
      hipread_example("test-enc-latin1.dat"),
      hip_fwf_widths(
        c(3, 3),
        c("v1", "v2"),
        c("character", "integer")
      ),
      encoding = "latin1"
    ),
    hipread_long(
      hipread_example("test-enc-utf8.dat"),
      hip_fwf_widths(
        c(3, 3),
        c("v1", "v2"),
        c("character", "integer")
      ),
      encoding = "UTF-8"
    )
  )
})

test_that("skip bom in utf-8 bom", {
  expect_equal(
    hipread_long(
      hipread_example("test-enc-utf8.dat"),
      hip_fwf_widths(
        c(3, 3),
        c("v1", "v2"),
        c("character", "integer")
      ),
      encoding = "UTF-8"
    ),
    hipread_long(
      hipread_example("test-enc-utf8bom.dat"),
      hip_fwf_widths(
        c(3, 3),
        c("v1", "v2"),
        c("character", "integer")
      ),
      encoding = "UTF-8"
    )

  )
})
