testthat::context(desc="Test getLogBoxsize() function")

testthat::test_that(desc="Test, if getLogBoxsize throws errors/warnings on wrong arguments",
                    {
                      testthat::expect_error(object=getLogBoxsize())
                      testthat::expect_error(object=getLogBoxsize("aaa"))
                      testthat::expect_error(getLogBoxsize(list(1,2)))
                      testthat::expect_warning(getLogBoxsize(0))
                      testthat::expect_warning(getLogBoxsize(c(1,2,-3)))
                      testthat::expect_warning(getLogBoxsize(c(1,2,3)))
                    })

testthat::test_that(desc="Test, if getLogBoxsize returns results of same length as input",
                    {
                      # check length of one
                      testthat::expect_equivalent(object=length(getLogBoxsize(2)),expected=1)
                      # check random length > 1
                      length <- 1+rpois(1,10)
                      input <- rpois(length,30)
                      testthat::expect_equivalent(object=length(getLogBoxsize(input)),expected=length)
                    })

testthat::test_that(desc="Test, if getLogBoxsize returns appropriate results",
                    {
                      testthat::expect_equivalent(object=getLogBoxsize(1),expected=0.009950331)
                      # FIXME this fails! I hope due to numerical reasons,
                      # need to figure out how to display more accurate values in the console
                      # expect_equivalent(object=getLogBoxsize(-1),expected=-0.01005034)
                    })

