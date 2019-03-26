context("Checking the Terror Data USA ")
test_that("Comparing values of Incidents",{
        expect_equal(Terror_data_USA$Incidents,seq(0,5))
        })

test_that("Comparing values of frequency",{
        expect_equal(Terror_data_USA$fre,c(38,26,8,2,1,1))
        })
