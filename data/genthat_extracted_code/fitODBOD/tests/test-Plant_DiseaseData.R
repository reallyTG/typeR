context("Checking the Plant Disease Data")
test_that("Comparing values of Disease plant",{
        expect_equal(Plant_DiseaseData$Dis.plant,seq(0,9))
        })

test_that("Comparing values of Frequency",{
        expect_equal(Plant_DiseaseData$fre,c(36,48,38,23,10,3,1,1,0,0))
        })
