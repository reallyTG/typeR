library(spartan)
context("Test of Spartan Latin-Hypercube Sampling")

test_that("sample_parameter_space", {
  # Test that the correct number of samples are designed:
  PARAMETERS<-c("A","B")
  lhcSample <- sample_parameter_space("normal", 500, PARAMETERS)
  expect_equal(nrow(lhcSample),500)
  expect_equal(ncol(lhcSample),2)
  # At this stage all the values are normalised between 0 and 1, check that
  expect_equal(sum(lhcSample>1),0)
  expect_equal(sum(lhcSample<0),0)
  expect_equal(sum(lhcSample<=1),1000)

  # Optimal
  skip_on_travis()
  skip_on_cran()

  #lhcSample <- sample_parameter_space("optimum", 500, PARAMETERS)
  #expect_equal(nrow(lhcSample),500)
  #expect_equal(ncol(lhcSample),2)
  # At this stage all the values are normalised between 0 and 1, check that
  #expect_equal(sum(lhcSample>1),0)
  #expect_equal(sum(lhcSample<0),0)
  #expect_equal(sum(lhcSample<=1),1000)

  # No need to test any others, as the input check will take care of that
})

test_that("scale_lhc_sample", {
  # Test that the sample is scaled correctly in the specified range
  PARAMETERS<-c("A","B")
  PMIN<-c(10,0.1)
  PMAX<-c(100,0.9)
  PINC<-NULL
  NUMSAMPLES<-500
  design <- sample_parameter_space("normal", 500, PARAMETERS)
  #scaledSample <- scale_lhc_sample(PARAMETERS, PMIN, PMAX, NUMSAMPLES, design)
  scaledSample <- scale_lhc_sample(PARAMETERS, PMIN, PMAX, PINC, NUMSAMPLES, design)

  # Test the characteristics
  expect_equal(nrow(scaledSample),500)
  expect_equal(ncol(scaledSample),2)
  # Now test all fall within the range
  expect_equal(sum(scaledSample[,1]<PMIN[1]),0)
  expect_equal(sum(scaledSample[,1]>PMAX[1]),0)
  expect_equal(sum(scaledSample[,1]<=PMAX[1]),500)
  expect_equal(sum(scaledSample[,2]<PMIN[2]),0)
  expect_equal(sum(scaledSample[,2]>PMAX[2]),0)
  expect_equal(sum(scaledSample[,2]<=PMAX[2]),500)

})

# Now can test the return of the function, given the utilities above were tested
test_that("lhc_generate_lhc_sample", {
  # Currently still need to specify a filepath, although this may change
  lhcSample <- lhc_generate_lhc_sample(FILEPATH=getwd(), c("A","B"), 500, c(10,0.1), c(100,0.9), "normal")
  expect_true(file.exists(paste(getwd(),"/LHC_Parameters_for_Runs.csv",sep="")))
  # Do the checks as before:
  expect_equal(nrow(lhcSample),500)
  expect_equal(ncol(lhcSample),2)
  expect_message(lhc_generate_lhc_sample(FILEPATH=NULL, c("A","B"), 500, c(10,0.1), c(100,0.9), "normal"),"No FILEPATH specified. Returning sample as R Object")

  file.remove(paste(getwd(),"/LHC_Parameters_for_Runs.csv",sep=""))
})

