context("Checking the Terror Data ARG")
test_that("Comparing values of Incidents",{
        expect_equal(Terror_data_ARG$Incidents,seq(0,6))
        })

test_that("Comparing values of frequency",{
        expect_equal(Terror_data_ARG$fre,c(46,15,5,3,5,1,1))
        })
