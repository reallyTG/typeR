##### nextReversal() tests #####
testthat::context(desc="Test nextReversal() function")

testthat::test_that(desc="Test, if nextReversal() produces appropriate reversal bounds for boxsize=1L and reversal=3 when in X-Status",
                    {
                      testthat::expect_equal(object=nextReversal(79.99,"X",boxsize=1,log=F),expected=76.00)
                      testthat::expect_equal(object=nextReversal(80.00,"X",boxsize=1,log=F),expected=77.00)
                      testthat::expect_equal(object=nextReversal(80.01,"X",boxsize=1,log=F),expected=77.00)
                    })

testthat::test_that(desc="Test, if nextReversal() produces appropriate reversal bounds for boxsize=1L and reversal=3 when in O-Status",
                    {
                      testthat::expect_equal(object=nextReversal(76.99,"O",boxsize=1,log=F),expected=80.00)
                      testthat::expect_equal(object=nextReversal(77.00,"O",boxsize=1,log=F),expected=80.00)
                      testthat::expect_equal(object=nextReversal(77.01,"O",boxsize=1,log=F),expected=81.00)
                    })

testthat::test_that(desc="Test, if nextReversal() produces appropriate reversal bounds for boxsize=0.5 and reversal=3 when in X-Status",
                    {
                      testthat::expect_equal(object=nextReversal(79.99,"X",boxsize=0.5,log=F),expected=78.00)
                      testthat::expect_equal(object=nextReversal(80.00,"X",boxsize=0.5,log=F),expected=78.50)
                      testthat::expect_equal(object=nextReversal(80.01,"X",boxsize=0.5,log=F),expected=78.50)
                    })

testthat::test_that(desc="Test, if nextReversal() produces appropriate reversal bounds for boxsize=0.5 and reversal=3 when in O-Status",
                    {
                      testthat::expect_equal(object=nextReversal(78.49,"O",boxsize=0.5,log=F),expected=80.00)
                      testthat::expect_equal(object=nextReversal(78.50,"O",boxsize=0.5,log=F),expected=80.00)
                      testthat::expect_equal(object=nextReversal(78.51,"O",boxsize=0.5,log=F),expected=80.50)
                    })

testthat::test_that(desc="Test, if nextReversal() produces appropriate reversal bounds for boxsize=1L and reversal=1 when in X-Status",
                    {
                      testthat::expect_equal(object=nextReversal(79.99,"X",boxsize=1,reversal = 1,log=F),expected=78.00)
                      testthat::expect_equal(object=nextReversal(80.00,"X",boxsize=1,reversal = 1,log=F),expected=79.00)
                      testthat::expect_equal(object=nextReversal(80.01,"X",boxsize=1,reversal = 1,log=F),expected=79.00)
                    })

testthat::test_that(desc="Test, if nextReversal() produces appropriate reversal bounds for boxsize=1L and reversal=1 when in O-Status",
                    {
                      testthat::expect_equal(object=nextReversal(76.99,"O",boxsize=1,reversal = 1,log=F),expected=78.00)
                      testthat::expect_equal(object=nextReversal(77.00,"O",boxsize=1,reversal = 1,log=F),expected=78.00)
                      testthat::expect_equal(object=nextReversal(77.01,"O",boxsize=1,reversal = 1,log=F),expected=79.00)
                    })
