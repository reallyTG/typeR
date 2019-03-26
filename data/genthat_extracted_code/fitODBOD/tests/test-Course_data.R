context("Checking the Course Data")
test_that("Comparing values of Subjects passed",{
          expect_equal(Course_data$sub.pass,seq(0,8))
          })

test_that("Comparing values of frequency",{
          expect_equal(Course_data$fre,c(1,4,4,8,9,6,8,12,13))
          })
