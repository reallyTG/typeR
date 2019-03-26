context("Checking the Chromosome Data")
test_that("Comparing values of No fo association",{
        expect_equal(Chromosome_data$No.of.Asso,seq(0,3))
        })

test_that("Comparing values of frequency",{
        expect_equal(Chromosome_data$fre,c(32,103,122,80))
        })
