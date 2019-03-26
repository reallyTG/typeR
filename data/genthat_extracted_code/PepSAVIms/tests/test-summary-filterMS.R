
# ``````````````````` #
#  Load testing data  #
# ................... #

# See tests/construct-data/cd-summary-filterMS.R for the file used to create the data
load(file.path("..", "data", "data-summary-filterMS.RData"))



# ````````````````` #
#  Perform testing  #
# ................. #

context("summary function for filterMS")

test_that("filterMS summary: compare outputs from filterMS.format", {

    # Test output for data taken from filterMS testing
    expect_identical(out_v1, target_v1)

    # border specified as "none"
    expect_identical(out_bord_none["bord"], target_bord_none)

    # border given a single number
    expect_identical(out_bord_1val["bord"], target_bord_1val)

    # border given two numbers
    expect_identical(out_bord_2val["bord"], target_bord_2val)

    # No obsevations satisfied all the criterions
    expect_identical(out_nfinal_none["ffin"], target_nfinal_none)
})
