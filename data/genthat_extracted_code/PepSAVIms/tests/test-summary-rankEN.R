
# ``````````````````` #
#  Load testing data  #
# ................... #

# See tests/construct-data/cd-summary-rankEN.R for the file used to create the data
load(file.path("..", "data", "data-summary-rankEN.RData"))




# ````````````````` #
#  Perform testing  #
# ................. #

context("summary function for rankEN")

test_that("binMS summary: compare outputs from binMS.format", {

    # Test output for data taken from binMS testing
    expect_identical(out_v1, target_v1)

    # Change some of the numbers from binMS object used for 1st test
    expect_identical(out_v2, target_v2)
})
