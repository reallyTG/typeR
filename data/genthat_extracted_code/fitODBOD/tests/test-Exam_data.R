context("Checking the Exam Data")
test_that("Comparing values of No of Alpha",{
        expect_equal(Exam_data$No.of.alpha,seq(0,9))
        })

test_that("Comparing values of Frequency",{
        expect_equal(Exam_data$fre,c(63,67,34,18,11,8,4,3,1,0))
        })
