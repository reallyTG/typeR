##### xo.processor() tests #####
testthat::context(desc="Test xo.processor() function")

testthat::test_that(desc="Test, if xo.processor() throws errors/warnings on wrong arguments",
                    {
                      testthat::expect_error(object=xo.processor())
                    })

readXoProcessorResultFile <- function(filename) {
  result <- read.csv(file = paste0("./testdata/",filename),
                     colClasses = c("Date","numeric","numeric","numeric","numeric","character","numeric","numeric","character","numeric","numeric"))
  result
}


# New tests
testthat::test_that(desc="Test xoProcessor with only one quote",
                    {
                      result <- readXoProcessorResultFile("testdata-xoProcessor-singleQuote.csv")
                      testthat::expect_equal(object = xo.processor(result$high,result$low,result$date),
                                             expected = result)
                    })

testthat::test_that(desc="Test xoProcessor with two quotes",
                    {
                      # Cases: OX, OO and O.
                      # OX -Case
                      result <- readXoProcessorResultFile("testdata-xoProcessor-doubleQuote-OX.csv")
                      testthat::expect_equal(object = xo.processor(result$high,result$low,result$date),
                                             expected = result)
                      
                      # OO - Case
                      result <- readXoProcessorResultFile("testdata-xoProcessor-doubleQuote-OO.csv")
                      testthat::expect_equal(object = xo.processor(result$high,result$low,result$date),
                                             expected = result)
                      
                      # O. - Case
                      result <- readXoProcessorResultFile("testdata-xoProcessor-doubleQuote-O.csv")
                      testthat::expect_equal(object = xo.processor(result$high,result$low,result$date),
                                             expected = result)
                    })

testthat::test_that(desc="Test xoProcessor with three quotes",
                    {
                      # OX. - Case
                      result <- readXoProcessorResultFile("testdata-xoProcessor-tripleQuote-OX.csv")
                      testthat::expect_equal(object = xo.processor(result$high,result$low,result$date),
                                             expected = result)
                      # OXX - Case
                      result <- readXoProcessorResultFile("testdata-xoProcessor-tripleQuote-OXX.csv")
                      testthat::expect_equal(object = xo.processor(result$high,result$low,result$date),
                                             expected = result)
                      # OXO - Case: Go exactly to reversal threshold
                      result <- readXoProcessorResultFile("testdata-xoProcessor-tripleQuote-OXO.csv")
                      testthat::expect_equal(object = xo.processor(result$high,result$low,result$date),
                                             expected = result)
                      
                      # OXO - Case: Go beyond reversal threshold
                      result <- readXoProcessorResultFile("testdata-xoProcessor-tripleQuote-OXO_2.csv")
                      testthat::expect_equal(object = xo.processor(result$high,result$low,result$date),
                                             expected = result)
                      
                      # OO. - Case
                      result <- readXoProcessorResultFile("testdata-xoProcessor-tripleQuote-OO.csv")
                      testthat::expect_equal(object = xo.processor(result$high,result$low,result$date),
                                             expected = result)
                      # OOO - Case
                      result <- readXoProcessorResultFile("testdata-xoProcessor-tripleQuote-OOO.csv")
                      testthat::expect_equal(object = xo.processor(result$high,result$low,result$date),
                                             expected = result)
                      # OOX - Case
                      result <- readXoProcessorResultFile("testdata-xoProcessor-tripleQuote-OOX.csv")
                      testthat::expect_equal(object = xo.processor(result$high,result$low,result$date),
                                             expected = result)
                      
                      # O.. - Case
                      result <- readXoProcessorResultFile("testdata-xoProcessor-tripleQuote-O__.csv")
                      testthat::expect_equal(object = xo.processor(result$high,result$low,result$date),
                                             expected = result)
                      # O.O - Case
                      result <- readXoProcessorResultFile("testdata-xoProcessor-tripleQuote-O_O.csv")
                      testthat::expect_equal(object = xo.processor(result$high,result$low,result$date),
                                             expected = result)
                      # O.X - Case
                      result <- readXoProcessorResultFile("testdata-xoProcessor-tripleQuote-O_X.csv")
                      testthat::expect_equal(object = xo.processor(result$high,result$low,result$date),
                                             expected = result)
                    })

testthat::test_that(desc="Test xoProcessor with four quotes",
                    {
                      # OXO. - Case
                      result <- readXoProcessorResultFile("testdata-xoProcessor-quadrupleQuote-OXO_.csv")
                      testthat::expect_equal(object = xo.processor(result$high,result$low,result$date),
                                             expected = result)
                      # OXOX - Case: Go exactly to threshold
                      result <- readXoProcessorResultFile("testdata-xoProcessor-quadrupleQuote-OXOX.csv")
                      testthat::expect_equal(object = xo.processor(result$high,result$low,result$date),
                                             expected = result)
                      # OXOX - Case: Go beyond threshold
                      result <- readXoProcessorResultFile("testdata-xoProcessor-quadrupleQuote-OXOX_2.csv")
                      testthat::expect_equal(object = xo.processor(result$high,result$low,result$date),
                                             expected = result)
                      # OXOO - Case
                      result <- readXoProcessorResultFile("testdata-xoProcessor-quadrupleQuote-OXOO.csv")
                      testthat::expect_equal(object = xo.processor(result$high,result$low,result$date),
                                             expected = result)
                    })

testthat::test_that(desc="Test xoProcessor with five quotes",
                    {
                      # OXOX. - Case
                      result <- readXoProcessorResultFile("testdata-xoProcessor-quintupleQuote-OXOX_.csv")
                      testthat::expect_equal(object = xo.processor(result$high,result$low,result$date),
                                             expected = result)
                      # OXOXX - Case
                      result <- readXoProcessorResultFile("testdata-xoProcessor-quintupleQuote-OXOXX.csv")
                      testthat::expect_equal(object = xo.processor(result$high,result$low,result$date),
                                             expected = result)
                      # OXOXO - Case
                      result <- readXoProcessorResultFile("testdata-xoProcessor-quintupleQuote-OXOXO.csv")
                      testthat::expect_equal(object = xo.processor(result$high,result$low,result$date),
                                             expected = result)
                    })


# test_that(desc="Test, if speed of xo.processor() is sufficent",
# {
#   data(DOW)
#   times <- system.time(xo.processor(high=DOW$High, low=DOW$Low,date=DOW$Date))
#   warning(paste0("Timings of xo.processor() for linear charts: ",times[1]," sec."))
#   expect_less_than(object=times[1],expected=0.15)
#
#   times <- system.time(xo.processor(high=DOW$High, low=DOW$Low,date=DOW$Date,boxsize=getLogBoxsize(1),log=T))
#   warning(paste0("Timings of xo.processor() for logarithmic charts: ",times[1]," sec."))
#   expect_less_than(object=times[1],expected=0.15)
# })
# 
# testthat::test_that(desc="Test, if speed of xo.processor() scales nearly linear in input size",
#                     {
#                       # check if speed scales nearly linear
#                       myfactor <- 10
#                       length=2000 # approx. 1 years
#                       mydeltas <- rnorm(n=length,mean=0,sd=1)
#                       myts <- rep(x=1000,length.out=length)
#                       for (i in 1:(length-1)) {
#                         myts[i+1] = myts[i]+(myts[i]*mydeltas[i]/100)
#                       }
#                       times.short <- system.time(xo.processor(high=myts, low=myts,date=seq(1:length),boxsize=getLogBoxsize(1),log=T))
#                       
#                       length=length*myfactor # approx. 10 years
#                       mydeltas <- rnorm(n=length,mean=0,sd=1)
#                       myts <- rep(x=1000,length.out=length)
#                       for (i in 1:(length-1)) {
#                         myts[i+1] = myts[i]+(myts[i]*mydeltas[i]/100)
#                       }
#                       times.long <- system.time(xo.processor(high=myts, low=myts,date=seq(1:length),boxsize=getLogBoxsize(1),log=T))
#                       
#                       testthat::expect_less_than(object=times.long[1],expected=(2*myfactor)*times.short[1])
#                     })
# 
# testthat::test_that(desc="Test, if xo.processor() produces correct output",
#                     {
#                       data(DOW)
#                       load(file="boxutils-example1.RData") # this loads an object result
#                       testthat::expect_equivalent(object=xo.processor(high=DOW$High,low=DOW$Low,date=DOW$Date),expected=result)
#                     })
