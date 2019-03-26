library(spartan)
context("Test of Spartan Netlogo Latin-Hypercube Sampling")

test_that("process_netlogo_parameter_range_info", {

  skip_on_cran()

  # Test the prep function processes the parameter information correctly
  # This should return the names of the parameters of interest in this
  # analysis, not those that have a static value.

  parameterInfo <- process_netlogo_parameter_range_info(c("people","infectiousness","chance-recover","duration"), c(150,"[10,90]","[10,90]","[5,40]"))
  expect_equal(parameterInfo$STUDIED_PARAMETERS,c("infectiousness","chance-recover","duration"))
  expect_equal(parameterInfo$PMIN,c(10,10,5))
  expect_equal(parameterInfo$PMAX,c(90,90,40))

})

test_that("lhc_generate_lhc_sample_netlogo", {

  skip_on_cran()

  b<-lhc_generate_lhc_sample_netlogo(FILEPATH=getwd(),
                                     c("people","infectiousness","chance-recover","duration"),
                                     c(150,"[10,90]","[10,90]","[5,40]"), 1, "normal",
                                     1,"true", "setup", "go",
                                     c("death-thru-sickness","death-but-immune","death-old-age",
                                       "death-old-and-sick"))

  # Does the output file exist
  expect_true(file.exists(paste(getwd(),"/1/lhc_analysis_set1.xml",sep="")))

  # Now we can examine the internals
  xml_doc <- read_created_xml_file(paste(getwd(),"/1/lhc_analysis_set1.xml", sep=""), paste(getwd(),"/LHC_Parameters_for_Runs.csv",sep=""))

  # Now compare the results
  expect_equal(xml_doc$xml_param_vals,xml_doc$sampled_vals)
  expect_equal(xml_doc$measures,c("death-thru-sickness","death-but-immune","death-old-age", "death-old-and-sick"))
  expect_equal(xml_doc$setup,"setup")
  expect_equal(xml_doc$go,"go")
  expect_equal(xml_doc$people,150)

  file.remove(paste(getwd(),"/LHC_Parameters_for_Runs.csv",sep=""))
  unlink(file.path(getwd(),"1"), recursive = TRUE)

})


