context("Extract Excel")

test_that("All three sample Excel files found recursively", {
  extract_excel("../test-data-for-xlutils3") %>%
    # Expect there are 3 workbooks
    expect_length(3) %>%
    # Expect there is a total of 5 sheets in all 3 workbooks
    { expect_equal(Reduce(f = function(cumlen, wb) { cumlen + length(wb) }, x = . , init = 0), 5) ; invisible( . ) }

})
