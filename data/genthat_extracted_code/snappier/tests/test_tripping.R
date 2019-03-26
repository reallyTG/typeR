# Property tests are disabled for the CRAN release.
# If you're planning on putting in a PR, make sure
# they pass nonetheless!
#
# library(hedgehog)

# A generator which can generate very large lists quickly
# at the expense of individual element shrinking.
# biglist <- function( elements, from = 0, to = 10000 ) {
#   gen.shrink( shrink.list,
#     gen.impure(function(g_size) {
#       paste(sample( elements , size = sample(from:to, 1), replace = T), collapse = "")
#     })
#   )
# }

test_that("compression and decompression are bijective", {
  ## WORKING, but off for a CRAN submission.
  # forall(
  #     biglist(c(LETTERS, letters, 0:9))
  #   , function(x) { expect_equal (decompress(compress(x)), x) }
  # )

  ## WORKING, but off for a CRAN submission.
  # forall(
  #     gen.map(as.raw, gen.c(gen.element(0:255), to = 50))
  #   , function(x) { expect_equal (decompress_raw( compress_raw (x)), x) }
  # )

  # The empty string is an interesting case in that it will contain
  # NULL chars. These would break an attempt to place the compressed data
  # in a character vector.
  expect_equal("", decompress(compress("")))

  # Just another test.
  expect_equal("snappy compressed", decompress(compress("snappy compressed")))
})
