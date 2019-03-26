context("Checking the BODextract")
test_that("Length being equal for output list",{
        expect_equal(length(BODextract(sample(0:10,340,replace=TRUE))),2)
        })

test_that("Length being equal to output of Random Variable",{
        expect_equal(length(BODextract(sample(0:10,340,replace=TRUE))$RV),11)
        })
test_that("Length being equal to output of Frequency",{
        expect_equal(length(BODextract(sample(0:10,340,replace=TRUE))$Freq),11)
        })


