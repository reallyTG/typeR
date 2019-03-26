context("Checking the Alcohol Data")
test_that("Comparing values of Days",{
        expect_equal(Alcohol_data$Days,seq(0,7))
        })

test_that("Comparing values of week1",{
        expect_equal(Alcohol_data$week1,c(47,54,43,40,40,41,39,95))
        })

test_that("Comparing values of week2",{
        expect_equal(Alcohol_data$week2,c(42,47,54,40,49,40,43,84))
        })
