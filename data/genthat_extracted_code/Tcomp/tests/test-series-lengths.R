library(Tcomp)

#----------test series length versus in the Hyndman article----------
lengthsm <- sapply(subset(tourism, "monthly"), function(s){length(s$x) + length(s$xx)})
lengthsq <- sapply(subset(tourism, "quarterly"), function(s){length(s$x) + length(s$xx)})
lengthsy <- sapply(subset(tourism, "yearly"), function(s){length(s$x) + length(s$xx)})


# These tests all fail unless the means are truncated (ie rounded down).
# That is, the actual lengths are all slightly longer (on average <1)
# than the reported lengths.  
# Numbers on right of # are hand observed in Excel, which match
# lengthsm, lenghtsq and lengthsy
expect_equal(trunc(mean(lengthsm)), 298) # (100496  + 8784) / 366
expect_equal(trunc(mean(lengthsq)), 99)  # (39128 + 3416) / 427
expect_equal(trunc(mean(lengthsy)), 24)  # (10606 + 2072) / 518

# These ones pass:
expect_equal(median(lengthsm), 330)
expect_equal(median(lengthsq), 110)
expect_equal(median(lengthsy), 27)

expect_equal(min(lengthsm), 91)
expect_equal(min(lengthsq), 30)
expect_equal(min(lengthsy), 11)

expect_equal(max(lengthsm), 333)
expect_equal(max(lengthsq), 130)
expect_equal(max(lengthsy), 47)


test_that("series lengths are correct", {
  expect_equal(sum(sapply(tourism, function(s){length(s$x) - s$n})), 0)
  
})
