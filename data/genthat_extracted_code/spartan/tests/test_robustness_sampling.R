library(spartan)
context("Test of Spartan Robustness Sampling")

test_that("generate_parameter_table", {
  PARAMETERS<-c("A","B")
  BASELINE<-c(0.5,1.75)
  PMIN<-c(0,1)
  PMAX<-c(1,2)
  PINC<-c(0.1,0.25)
  PARAMVALS<-NULL

  # Now we can test the function for parameter 1: nrow should equal the number of samples

  val_list <- as.numeric(prepare_parameter_value_list(PMIN, PMAX, PINC,
                                                      PARAMVALS,
                                                      1))

  # 1 is th parameter of interest
  expect_equal(nrow(generate_parameter_table(PARAMETERS, BASELINE, 1, val_list)),11)
  # This should have two columns, one for each parameter
  expect_equal(ncol(generate_parameter_table(PARAMETERS, BASELINE, 1, val_list)),2)
  # Column two should all be identical, the baseline value of parameter 2
  expect_true(all(generate_parameter_table(PARAMETERS, BASELINE, 1, val_list)[,2] == BASELINE[2]))

  val_list <- as.numeric(prepare_parameter_value_list(PMIN, PMAX, PINC,
                                                      PARAMVALS,
                                                      2))

  # Now try parameter 2
  expect_equal(nrow(generate_parameter_table(PARAMETERS, BASELINE, 2, val_list)),5)
  # This should have two columns, one for each parameter
  expect_equal(ncol(generate_parameter_table(PARAMETERS, BASELINE, 2, val_list)),2)
  # For some reason, putting this in expect_true did not work
  expect_true(all(generate_parameter_table(PARAMETERS, BASELINE, 2, val_list)[,1] == BASELINE[1]))

})

test_that("oat_parameter_sampling", {
  # Now test the function generates some output
  # Above we tested the characteristics of the sample, so we all need to know now is that some output
  # was achieved.
  # Input has already been checked by method_argument_check tests

  # Run the method
  oat_parameter_sampling(getwd(), c("A","B"), c(50,0.5), PMIN=c(10,0.1), PMAX=c(100,1.0), PINC=c(10,0.1), PARAMVALS=NULL)
  # Check output files are generated
  expect_true(file.exists(paste(getwd(),"/A_OAT_Values.csv",sep="")))
  expect_true(file.exists(paste(getwd(),"/A_OAT_Values.csv",sep="")))
  file.remove(paste(getwd(),"/A_OAT_Values.csv",sep=""))
  file.remove(paste(getwd(),"/B_OAT_Values.csv",sep=""))

})

test_that("oat_generate_netlogo_behaviour_space_XML", {

  skip_on_cran()

  dir.create("OAT_Netlogo")
  oat_generate_netlogo_behaviour_space_XML(
    file.path(getwd(),"OAT_Netlogo"), "virus_oat", c("infectiousness","chance-recover","duration"), c(150,"[10,90,10]","[10,90,10]","[5,40,5]"),
                                           "setup", "go", c("death-thru-sickness","death-but-immune",
                                                            "death-old-age","death-old-and-sick"), 1, "true")

  expect_true(file.exists(file.path(getwd(),"OAT_Netlogo","virus_oat.xml")))

  unlink(file.path(getwd(),"OAT_Netlogo"),recursive = TRUE)


})
