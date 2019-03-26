##### nextBox() tests #####
testthat::context(desc="Test nextBox() function")

testthat::test_that(desc="Test, if nextBox() throws errors/warnings on wrong arguments",
                    {
                      testthat::expect_error(object=nextBox())
                      # FIXME add additional tests
                    })


testthat::test_that(desc="Test, if nextBox() returns results of same length as input",
                    {
                      # check length of one
                      testthat::expect_equivalent(object=length(nextBox(quote=rpois(1,100),status="X")),expected=1)
                      testthat::expect_equivalent(object=length(nextBox(quote=rpois(1,100),status="O")),expected=1)
                      # check random length > 1
                      length <- 1+rpois(1,10)
                      input <- rpois(length,30)
                      testthat::expect_equivalent(object=length(nextBox(quote=input,status="X")),expected=length)
                      testthat::expect_equivalent(object=length(nextBox(quote=input,status="O")),expected=length)
                    })

testthat::test_that(desc="Test, if nextBox() produces appropriate return values for boxsize=1 and status=X and log=F",
                    {
                      testthat::expect_equal(object=nextBox(quote=46.00,status="X",boxsize=1L,log=F),expected=47.00)
                      testthat::expect_equal(object=nextBox(quote=46.01,status="X",boxsize=1L,log=F),expected=47.00)
                      testthat::expect_equal(object=nextBox(quote=46.99,status="X",boxsize=1L,log=F),expected=47.00)
                      testthat::expect_equal(object=nextBox(quote=47.00,status="X",boxsize=1L,log=F),expected=48.00)
                    })

testthat::test_that(desc="Test, if nextBox() produces appropriate return values for boxsize=0.5 and status=X",
                    {
                      testthat::expect_equal(object=nextBox(quote=46.00,status="X",boxsize=0.5,log=F),expected=46.50)
                      testthat::expect_equal(object=nextBox(quote=46.01,status="X",boxsize=0.5,log=F),expected=46.50)
                      testthat::expect_equal(object=nextBox(quote=46.99,status="X",boxsize=0.5,log=F),expected=47.00)
                      testthat::expect_equal(object=nextBox(quote=47.00,status="X",boxsize=0.5,log=F),expected=47.50)
                    })

testthat::test_that(desc="Test, if nextBox() produces appropriate return values for boxsize=1 and status=O and log=F",
                    {
                      testthat::expect_equal(object=nextBox(quote=46.00,status="O",boxsize=1L,log=F),expected=45.00)
                      testthat::expect_equal(object=nextBox(quote=46.01,status="O",boxsize=1L,log=F),expected=46.00)
                      testthat::expect_equal(object=nextBox(quote=46.99,status="O",boxsize=1L,log=F),expected=46.00)
                      testthat::expect_equal(object=nextBox(quote=47.00,status="O",boxsize=1L,log=F),expected=46.00)
                    })

testthat::test_that(desc="Test, if nextBox() produces appropriate return values for boxsize=0.5 and status=O",
                    {
                      testthat::expect_equal(object=nextBox(quote=46.00,status="O",boxsize=0.5,log=F),expected=45.50)
                      testthat::expect_equal(object=nextBox(quote=46.01,status="O",boxsize=0.5,log=F),expected=46.00)
                      testthat::expect_equal(object=nextBox(quote=46.99,status="O",boxsize=0.5,log=F),expected=46.50)
                      testthat::expect_equal(object=nextBox(quote=47.00,status="O",boxsize=0.5,log=F),expected=46.50)
                    })

calcQuoteFromBoxnumberForLog <- function(boxnumber, eps, boxsize) {
  exp((boxnumber+eps)*boxsize)
}

testthat::test_that(desc="Test, if nextBox() produces appropriate return values for boxsize=1% and status=X and log=T",
                    {
                      boxsize=getLogBoxsize(1)
                      boxnumber=385
                      testthat::expect_equal(object=nextBox(quote=calcQuoteFromBoxnumberForLog(boxnumber,0.00, boxsize),
                                                            status="X",boxsize=boxsize,log=T),
                                             expected=calcQuoteFromBoxnumberForLog(boxnumber,1.0, boxsize))
                      testthat::expect_equal(object=nextBox(quote=calcQuoteFromBoxnumberForLog(boxnumber,0.01, boxsize),
                                                            status="X",boxsize=boxsize,log=T),
                                             expected=calcQuoteFromBoxnumberForLog(boxnumber,1.0, boxsize))
                      testthat::expect_equal(object=nextBox(quote=calcQuoteFromBoxnumberForLog(boxnumber,0.99, boxsize),
                                                            status="X",boxsize=boxsize,log=T),
                                             expected=calcQuoteFromBoxnumberForLog(boxnumber,1.0, boxsize))
                      testthat::expect_equal(object=nextBox(quote=calcQuoteFromBoxnumberForLog(boxnumber,1.00, boxsize),
                                                            status="X",boxsize=boxsize,log=T),
                                             expected=calcQuoteFromBoxnumberForLog(boxnumber,2.0, boxsize))
                    })

testthat::test_that(desc="Test, if nextBox() produces appropriate return values for boxsize=1% and status=O and log=T",
                    {
                      boxsize=getLogBoxsize(1)
                      boxnumber=385
                      testthat::expect_equal(object=nextBox(quote=calcQuoteFromBoxnumberForLog(boxnumber,0.00, boxsize),
                                                            status="O",boxsize=boxsize,log=T),
                                             expected=calcQuoteFromBoxnumberForLog(boxnumber,-1.0, boxsize))
                      testthat::expect_equal(object=nextBox(quote=calcQuoteFromBoxnumberForLog(boxnumber,0.01, boxsize),
                                                            status="O",boxsize=boxsize,log=T),
                                             expected=calcQuoteFromBoxnumberForLog(boxnumber,0.0, boxsize))
                      testthat::expect_equal(object=nextBox(quote=calcQuoteFromBoxnumberForLog(boxnumber,0.99, boxsize),
                                                            status="O",boxsize=boxsize,log=T),
                                             expected=calcQuoteFromBoxnumberForLog(boxnumber,0.0, boxsize))
                      testthat::expect_equal(object=nextBox(quote=calcQuoteFromBoxnumberForLog(boxnumber,1.00, boxsize),
                                                            status="O",boxsize=boxsize,log=T),
                                             expected=calcQuoteFromBoxnumberForLog(boxnumber,0.0, boxsize))
                    })

