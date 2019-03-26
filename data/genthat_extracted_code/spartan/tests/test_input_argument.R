library(spartan)
context("Test of Error Checking of Spartan Function Arguments")

test_that("paramvals_length_equals_parameter_length", {
  # Same length:
  input_arguments <- make_input_arguments_object(PARAMETERS=c("A","B","C"),PARAMVALS=c("0.1,0.2","1,2,3","1,2"))
  expect_true(check_paramvals_length_equals_parameter_length(input_arguments$input))
  # Parameters shorter
  input_arguments <- make_input_arguments_object(PARAMETERS=c("A","B"),PARAMVALS=c("0.1,0.2","1,2,3","1,2"))
  expect_message(check_paramvals_length_equals_parameter_length(input_arguments$input),"Number of entries in PARAMVALS should match the number of parameters")
  # Param values shorter
  input_arguments <- make_input_arguments_object(PARAMETERS=c("A","B","C"),PARAMVALS=c("0.1,0.2","1,2,3"))
  expect_false(check_paramvals_length_equals_parameter_length(input_arguments$input))
  # Parameters null
  input_arguments <- make_input_arguments_object(PARAMETERS=NULL,PARAMVALS=c("0.1,0.2","1,2,3"))
  expect_false(check_paramvals_length_equals_parameter_length(input_arguments$input))
  # Parameters a string
  input_arguments <- make_input_arguments_object(PARAMETERS="A",PARAMVALS=c("0.1,0.2","1,2,3"))
  expect_false(check_paramvals_length_equals_parameter_length(input_arguments$input))
  # Parameters an undeclared variable
  input_arguments <- make_input_arguments_object(PARAMETERS=A,PARAMVALS=c("0.1,0.2","1,2,3"))
  expect_message(check_paramvals_length_equals_parameter_length(input_arguments$input),"PARAMVALS or PARAMETERS has been declared incorrectly")
})

test_that("check_robustness_range_or_values", {
  # Using method where min, max, and inc are specified, and not PARAMVALS
  input_arguments <- make_input_arguments_object(PMIN=c(1,1,1),PMAX=c(10,10,10), PINC=c(1,1,1),PARAMVALS=NULL)
  expect_true(check_robustness_range_or_values(input_arguments$input,input_arguments$names))
  # Using method where PARAMVALS is specified, not min,max,inc
  input_arguments <- make_input_arguments_object(PMIN=NULL,PMAX=NULL, PINC=NULL,PARAMVALS=c("0.1,0.2","0.1,0.2","0.1,0.2"))
  expect_true(check_robustness_range_or_values(input_arguments$input,input_arguments$names))
  # What if we declare both:
  input_arguments <- make_input_arguments_object(PMIN=c(1,1,1),PMAX=c(10,10,10), PINC=c(1,1,1),PARAMVALS=c("0.1,0.2","0.1,0.2","0.1,0.2"))
  expect_message(check_robustness_range_or_values(input_arguments$input,input_arguments$names),"You need to specify either PMIN,PMAX,and PINC, or the values to sample in PARAMVALS")
  # What if we specified min, max, and paramvals
  input_arguments <- make_input_arguments_object(PMIN=c(1,1,1),PMAX=c(10,10,10), PINC=NULL,PARAMVALS=c("0.1,0.2","0.1,0.2","0.1,0.2"))
  expect_message(check_robustness_range_or_values(input_arguments$input,input_arguments$names),"You need to specify either PMIN,PMAX,and PINC, or the values to sample in PARAMVALS")
  # What if we specified only pmin and pmax?
  input_arguments <- make_input_arguments_object(PMIN=c(1,1,1),PMAX=c(10,10,10), PINC=NULL,PARAMVALS=NULL)
  expect_message(check_robustness_range_or_values(input_arguments$input,input_arguments$names),"You need to specify either PMIN,PMAX,and PINC, or the values to sample in PARAMVALS")
})

test_that("check_robustness_paramvals_contains_baseline", {
  # Check method works as it should, where baseline is contained in paramvals
  input_arguments <- make_input_arguments_object(BASELINE=c(3,4,0.5),PARAMVALS=c("2,3,4","1,4,7","0.1,0.2,0.3,0.4,0.5,0.6,0.7"))
  expect_true(check_robustness_paramvals_contains_baseline(input_arguments$input))
  # Where baseline does not contain the value
  input_arguments <- make_input_arguments_object(BASELINE=c(1,4,0.5),PARAMVALS=c("2,3,4","1,4,7","0.1,0.2,0.3,0.4,0.5,0.6,0.7"))
  expect_message(check_robustness_paramvals_contains_baseline(input_arguments$input),"PARAMVALS should contain the BASELINE value, else behaviours cannot be compared")
  # Test lengths npt equal, although this should be picked up in other tests
  input_arguments <- make_input_arguments_object(BASELINE=c(1,4,0.5),PARAMVALS=c("2,3,4","1,4,7"))
  expect_message(check_robustness_paramvals_contains_baseline(input_arguments$input),"PARAMVALS should contain the BASELINE value, else behaviours cannot be compared")
  # Test a null baseline & paramvals
  input_arguments <- make_input_arguments_object(BASELINE=NULL,PARAMVALS=c("2,3,4","1,4,7"))
  expect_message(check_robustness_paramvals_contains_baseline(input_arguments$input),"Error in declaring BASELINE or PARAMVALS")
  input_arguments <- make_input_arguments_object(BASELINE=c(1,4,0.5),PARAMVALS=NULL)
  expect_message(check_robustness_paramvals_contains_baseline(input_arguments$input),"Error in declaring BASELINE or PARAMVALS")
  # Whether baseline contains a string
  input_arguments <- make_input_arguments_object(BASELINE=c(1,"!",0.5),PARAMVALS=NULL)
  expect_message(check_robustness_paramvals_contains_baseline(input_arguments$input),"Error in declaring BASELINE or PARAMVALS")
  # Whether baseline contains a reference to an undeclared argument
  input_arguments <- make_input_arguments_object(BASELINE=c(1,B,0.5),PARAMVALS=NULL)
  expect_message(check_robustness_paramvals_contains_baseline(input_arguments$input),"Error in declaring BASELINE or PARAMVALS")
})

test_that("check_robustness_range_contains_baseline", {
  # Similar to above, but this checks the baseline is in the sequence defined by PMIN, PMAX, and PINC
  input_arguments <- make_input_arguments_object(BASELINE=c(3,4,0.5),PMIN=c(2,1,0.1), PMAX=c(4,7,0.7), PINC=c(1,3,0.1))
  expect_true(check_robustness_range_contains_baseline(input_arguments$input))
  # What if baseline is not contained:
  input_arguments <- make_input_arguments_object(BASELINE=c(5,4,0.5),PMIN=c(2,1,0.1), PMAX=c(4,7,0.7), PINC=c(1,3,0.1))
  expect_message(check_robustness_range_contains_baseline(input_arguments$input),"Range specified by PMIN and PMAX should contain the BASELINE value, else behaviours cannot be compared")
  # Lengths not equal:
  input_arguments <- make_input_arguments_object(BASELINE=c(5,4),PMIN=c(2,1,0.1), PMAX=c(4,7,0.7), PINC=c(1,3,0.1))
  expect_message(check_robustness_range_contains_baseline(input_arguments$input),"Range specified by PMIN and PMAX should contain the BASELINE value, else behaviours cannot be compared")
  # Test nulls
  input_arguments <- make_input_arguments_object(BASELINE=c(5,4),PMIN=c(2,1,0.1), PMAX=NULL, PINC=c(1,3,0.1))
  expect_message(check_robustness_range_contains_baseline(input_arguments$input),"Error in declaring BASELINE in range specified by PMIN, PMAX, and PINC")
  # Contains string or reference to undeclared argument
  input_arguments <- make_input_arguments_object(BASELINE=c(5,4),PMIN=c(2,1,0.1), PMAX=NULL, PINC=c(1,"A",0.1))
  expect_message(check_robustness_range_contains_baseline(input_arguments$input),"Error in declaring BASELINE in range specified by PMIN, PMAX, and PINC")
  input_arguments <- make_input_arguments_object(BASELINE=c(5,4),PMIN=c(2,1,0.1), PMAX=NULL, PINC=c(1,A,0.1))
  expect_message(check_robustness_range_contains_baseline(input_arguments$input),"Error in declaring BASELINE in range specified by PMIN, PMAX, and PINC")
})

test_that("check_robustness_parameter_and_ranges_lengths", {
  # PMIN, PMAX, PINC, BASELINE, and PARAMETERS should all be the same length
  input_arguments <- make_input_arguments_object(BASELINE=c(3,4,0.5),PMIN=c(2,1,0.1), PMAX=c(4,7,0.7), PINC=c(1,3,0.1), PARAMETERS=c("A","B","C"))
  expect_true(check_robustness_parameter_and_ranges_lengths(input_arguments$input))
  # If lengths differ:
  input_arguments <- make_input_arguments_object(BASELINE=c(3,4),PMIN=c(2,1,0.1), PMAX=c(4,7,0.7), PINC=c(1,3,0.1), PARAMETERS=c("A","B","C"))
  expect_message(check_robustness_parameter_and_ranges_lengths(input_arguments$input),"Number of entries in PARAMETERS, BASELINE, PMIN, PMAX, and PINC should be equal")
  input_arguments <- make_input_arguments_object(BASELINE=c(3,4,5),PMIN=c(2,1,0.1), PMAX=c(4,7,0.7), PINC=c(1,3,0.1), PARAMETERS=c("A","B"))
  expect_message(check_robustness_parameter_and_ranges_lengths(input_arguments$input),"Number of entries in PARAMETERS, BASELINE, PMIN, PMAX, and PINC should be equal")
  # Test nulls
  input_arguments <- make_input_arguments_object(BASELINE=c(3,4,5),PMIN=NULL, PMAX=c(4,7,0.7), PINC=c(1,3,0.1), PARAMETERS=c("A","B"))
  expect_message(check_robustness_parameter_and_ranges_lengths(input_arguments$input),"Number of entries in PARAMETERS, BASELINE, PMIN, PMAX, and PINC should be equal")
  # Contains reference to undeclared arguments
  input_arguments <- make_input_arguments_object(BASELINE=c(3,4,5),PMIN=NULL, PMAX=c(4,7,A), PINC=c(1,3,0.1), PARAMETERS=c("A","B","C"))
  expect_message(check_robustness_parameter_and_ranges_lengths(input_arguments$input),"Error in declaring PARAMETERS, BASELINE, PMIN, PMAX, or PINC. Check all lengths are equal and all are numeric")
  # Rare, as this comes from a match call to a function, but what if an argument is missing
  input_arguments <- make_input_arguments_object(BASELINE=c(3,4,5),PMIN=NULL, PMAX=c(4,7,0.7), PARAMETERS=c("A","B","C"))
  expect_message(check_robustness_parameter_and_ranges_lengths(input_arguments$input),"Number of entries in PARAMETERS, BASELINE, PMIN, PMAX, and PINC should be equal")

  })

test_that("check_filepath_exists", {

  # Filepath should exist
  input_arguments <- make_input_arguments_object(FILEPATH=getwd())

  expect_true(check_filepath_exists(input_arguments$input,"FILEPATH"))
  # Filepath does not exist:
  input_arguments <- make_input_arguments_object(FILEPATH=file.path(getwd(),"Q"))
  expect_message(check_filepath_exists(input_arguments$input,"FILEPATH"),paste("FILEPATH does not seem to exist: ", input_arguments$FILEPATH,sep=""))
  # Filepath stated as an undelared variable
  input_arguments <- make_input_arguments_object(FILEPATH=VAR)
  expect_message(check_filepath_exists(input_arguments$input,"FILEPATH"),"FILEPATH does not seem to exist")
  # Filepath is null
  input_arguments <- make_input_arguments_object(FILEPATH=NULL)
  expect_message(check_filepath_exists(input_arguments$input,"FILEPATH"),"FILEPATH does not seem to exist")
})

test_that("check_lhs_algorithm", {
  # Test accepts optimal and normal
  input_arguments <- make_input_arguments_object(ALGORITHM="optimal")
  expect_true(check_lhs_algorithm(input_arguments$input))
  input_arguments <- make_input_arguments_object(ALGORITHM="normal")
  expect_true(check_lhs_algorithm(input_arguments$input))
  input_arguments <- make_input_arguments_object(ALGORITHM="NORMAL")
  expect_true(check_lhs_algorithm(input_arguments$input))
  input_arguments <- make_input_arguments_object(ALGORITHM="OPTIMAL")
  expect_true(check_lhs_algorithm(input_arguments$input))
  # Should not accept anything else
  input_arguments <- make_input_arguments_object(ALGORITHM="OTHER")
  expect_message(check_lhs_algorithm(input_arguments$input),"LHS Algorithm must be either 'normal' or 'optimal'. Terminated")
  input_arguments <- make_input_arguments_object(ALGORITHM="")
  expect_message(check_lhs_algorithm(input_arguments$input),"LHS Algorithm must be either 'normal' or 'optimal'. Terminated")
  # Should not be an unreferenced variable
  input_arguments <- make_input_arguments_object(ALGORITHM=A)
  expect_message(check_lhs_algorithm(input_arguments$input),"LHS Algorithm must be either 'normal' or 'optimal'. Terminated")
  # Or a number
  input_arguments <- make_input_arguments_object(ALGORITHM=1)
  expect_message(check_lhs_algorithm(input_arguments$input),"LHS Algorithm must be either 'normal' or 'optimal'. Terminated")
  # Or null
  input_arguments <- make_input_arguments_object(ALGORITHM=NULL)
  expect_message(check_lhs_algorithm(input_arguments$input),"LHS Algorithm must be either 'normal' or 'optimal'. Terminated")
})

test_that("check_package_installed", {
  # Test that the lhs package is installed
  expect_true(check_package_installed("lhs"))
  # Check one that isn't, e.g. dplyr
  #expect_message(check_package_installed("dplyr"),"Looking for package dplyr, which is not installed or does not exist")
  # Check a package that does not exist
  expect_message(check_package_installed("York"),"Looking for package York, which is not installed or does not exist")
  # Check null
  expect_message(check_package_installed(NULL),"Looking for package , which is not installed or does not exist")

})

test_that("check_lengths_parameters_ranges", {
  # Test that the parameters, PMIN, and PMAX are the same length
  input_arguments <- make_input_arguments_object(PMIN=c(2,1,0.1), PMAX=c(4,7,0.7), PARAMETERS=c("A","B","C"))
  expect_true(check_lengths_parameters_ranges(input_arguments$input))
  # Check not the same lengths
  input_arguments <- make_input_arguments_object(PMIN=c(2,1), PMAX=c(4,7,0.7), PARAMETERS=c("A","B","C"))
  expect_message(check_lengths_parameters_ranges(input_arguments$input),"Number of parameters must match the numbers of entries in PMIN and PMAX")
  input_arguments <- make_input_arguments_object(PMIN=c(2,1), PMAX=c(7,0.7), PARAMETERS=c("A","B","C"))
  expect_message(check_lengths_parameters_ranges(input_arguments$input),"Number of parameters must match the numbers of entries in PMIN and PMAX")
  # Check for nulls
  input_arguments <- make_input_arguments_object(PMIN=c(2,1,0.1), PMAX=NULL, PARAMETERS=c("A","B","C"))
  expect_message(check_lengths_parameters_ranges(input_arguments$input),"Number of parameters must match the numbers of entries in PMIN and PMAX")
  # Check for reference to undeclared variables
  input_arguments <- make_input_arguments_object(PMIN=A, PMAX=c(4,7,0.7), PARAMETERS=c("A","B","C"))
  expect_message(check_lengths_parameters_ranges(input_arguments$input),"Value error in PMIN or PMAX. Check these are numeric")
  # Check for strings in PMIN and PMAX
  input_arguments <- make_input_arguments_object(PMIN=c("A",1,0.1), PMAX=c(4,7,0.7), PARAMETERS=c("A","B","C"))
  expect_message(check_lengths_parameters_ranges(input_arguments$input),"Value error in PMIN or PMAX. Check these are numeric")

})

test_that("check_numeric_list_values", {
  input_arguments <- make_input_arguments_object(PMIN=c(2,1,0.1), PMAX=c(4,7,0.7))
  # Min should be less than max, for all values, for upper case
  expect_true(check_numeric_list_values(input_arguments$input,"PMIN","PMAX"))
  # Lower case however will fail, as pmin and pmax are reserved in the base package
  input_arguments <- make_input_arguments_object(pmin=c(2,1,0.1), pmax=c(4,7,0.7))
  b<-check_numeric_list_values(input_arguments$input,"PMIN","PMAX")
  expect_message(check_numeric_list_values(input_arguments$input,"PMIN","PMAX"),"PMIN must be less than PMAX for all parameters, both must be numeric, and declared in capitals: e.g. PMIN, PMAX, PINC")
  # Should return an error and false if not
  input_arguments <- make_input_arguments_object(pmin=c(12,1,0.1), pmax=c(4,7,0.7))
  expect_false(check_numeric_list_values(input_arguments$input,"PMIN","PMAX"))
  expect_message(check_numeric_list_values(input_arguments$input,"PMIN","PMAX"),"PMIN must be less than PMAX for all parameters, both must be numeric, and declared in capitals: e.g. PMIN, PMAX, PINC")
  # If one is null
  input_arguments <- make_input_arguments_object(PMIN=NULL, PMAX=c(4,7,0.7))
  expect_message(check_numeric_list_values(input_arguments$input,"PMIN","PMAX"),"PMIN must be less than PMAX for all parameters, both must be numeric, and declared in capitals: e.g. PMIN, PMAX, PINC")
  # If not numeric
  input_arguments <- make_input_arguments_object(PMIN=c(12,1,0.1), PMAX=c(4,7,"a"))
  expect_message(check_numeric_list_values(input_arguments$input,"PMIN","PMAX"),"PMIN must be less than PMAX for all parameters, both must be numeric, and declared in capitals: e.g. PMIN, PMAX, PINC")
  # Reference to an undeclared variable
  input_arguments <- make_input_arguments_object(PMIN=c(12,1,0.1), PMAX=A)
  expect_message(check_numeric_list_values(input_arguments$input, "PMIN","PMAX"),"Value error in PMIN or PMAX. Check these are numeric")

})

test_that("check_argument_positive_int", {

  input_arguments <- make_input_arguments_object(NUMSAMPLES=65)
  # Positive integers should be accepted
  expect_true(check_argument_positive_int(input_arguments$input,"NUMSAMPLES"))
  # At the moment, lower case will fail - this may need examining
  input_arguments <- make_input_arguments_object(numsamples=65)
  expect_false(check_argument_positive_int(input_arguments$input,"NUMSAMPLES"))
  # Currently a mixture should fail - we may address this later
  input_arguments <- make_input_arguments_object(numSamples=65)
  expect_false(check_argument_positive_int(input_arguments$input,"NUMSAMPLES"))
  # If negative:
  input_arguments <- make_input_arguments_object(NUMSAMPLES=-50)
  expect_message(check_argument_positive_int(input_arguments$input,"NUMSAMPLES"),"NUMSAMPLES must be a positive integer. Terminated")
  # Double
  input_arguments <- make_input_arguments_object(NUMSAMPLES=50.234)
  expect_message(check_argument_positive_int(input_arguments$input,"NUMSAMPLES"),"NUMSAMPLES must be a positive integer. Terminated")
  # String
  input_arguments <- make_input_arguments_object(NUMSAMPLES="A")
  expect_message(check_argument_positive_int(input_arguments$input,"NUMSAMPLES"),"NUMSAMPLES must be a positive integer. Terminated")
  # Referenced variable that doesn't exist
  input_arguments <- make_input_arguments_object(NUMSAMPLES=A)
  expect_message(check_argument_positive_int(input_arguments$input,"NUMSAMPLES"),"NUMSAMPLES must be a positive integer. Terminated")
  # Null
  input_arguments <- make_input_arguments_object(NUMSAMPLES=NULL)
  expect_message(check_argument_positive_int(input_arguments$input,"NUMSAMPLES"),"NUMSAMPLES must be a positive integer. Terminated")

})

test_that("check_boolean", {
  # true and false should be accepted
  input_arguments <- make_input_arguments_object(RUNMETRICS_EVERYSTEP="true")
  expect_true(check_boolean(input_arguments$input,"RUNMETRICS_EVERYSTEP"))
  input_arguments <- make_input_arguments_object(RUNMETRICS_EVERYSTEP="false")
  expect_true(check_boolean(input_arguments$input,"RUNMETRICS_EVERYSTEP"))
  input_arguments <- make_input_arguments_object(RUNMETRICS_EVERYSTEP="TRUE")
  expect_true(check_boolean(input_arguments$input,"RUNMETRICS_EVERYSTEP"))
  input_arguments <- make_input_arguments_object(RUNMETRICS_EVERYSTEP="FALSE")
  expect_true(check_boolean(input_arguments$input,"RUNMETRICS_EVERYSTEP"))
  # Others should not
  input_arguments <- make_input_arguments_object(RUNMETRICS_EVERYSTEP="NotTrue")
  expect_message(check_boolean(input_arguments$input,"RUNMETRICS_EVERYSTEP"),"RUNMETRICS_EVERYSTEP must be either true or false. Terminated")
  input_arguments <- make_input_arguments_object(RUNMETRICS_EVERYSTEP=VAR)
  expect_message(check_boolean(input_arguments$input,"RUNMETRICS_EVERYSTEP"),"RUNMETRICS_EVERYSTEP must be either true or false. Terminated")
})

test_that("check_text", {
  # Check text is accepted
  input_arguments <- make_input_arguments_object("NETLOGO_SETUP_FUNCTION"="setup")
  expect_true(check_text(input_arguments$input,"NETLOGO_SETUP_FUNCTION"))
  # Numbers should also be accepted
  input_arguments <- make_input_arguments_object("NETLOGO_SETUP_FUNCTION"=125)
  expect_true(check_text(input_arguments$input,"NETLOGO_SETUP_FUNCTION"))
  # Check the others, e.g. null and not declared
  input_arguments <- make_input_arguments_object(NETLOGO_SETUP_FUNCTION=VAR)
  expect_message(check_text(input_arguments$input, "NETLOGO_SETUP_FUNCTION"),"NETLOGO_SETUP_FUNCTION must be either a text string or numeric. Error in declaration. Terminated")
  input_arguments <- make_input_arguments_object(NETLOGO_SETUP_FUNCTION=NULL)
  expect_message(check_text(input_arguments$input, "NETLOGO_SETUP_FUNCTION"),"NETLOGO_SETUP_FUNCTION must be either a text string or numeric. Error in declaration. Terminated")
  # Check text should not work with a list
  expect_message(check_text(data.frame(seq(1,5,by=1)), "NETLOGO_SETUP_FUNCTION"),"NETLOGO_SETUP_FUNCTION must be either a text string or numeric. Error in declaration. Terminated")
})


test_that("check_text_list", {
  # Check that a list of acceptable test is accepted
  expect_true(check_text_list(c("setup","go","output"),"MEASURES"))
  expect_true(check_text_list(c("setup","go",123),"MEASURES"))
  # Put errors in the list
  input_arguments <- make_input_arguments_object(MEASURES=c("setup","go",VAR))
  expect_message(check_text_list(input_arguments$input, "MEASURES"),"Error in declaration of MEASURES. Terminated")
  input_arguments <- make_input_arguments_object(MEASURES=c("nullTest","nullTest",NULL))
  # In this case, NULLs are ignored, so true should be returned
  expect_true(check_text_list(input_arguments$input, "MEASURES"))
  # Check text should not work with a list
  expect_message(check_text_list(c("setup",data.frame(seq(1,5,by=1))), "NETLOGO_SETUP_FUNCTION"),"Error in declaration of NETLOGO_SETUP_FUNCTION. Terminated")

})

test_that("check_efast_sampling_args", {
  # This calls many of the functions above, so we just need to check their integration returns false
  input_check <- make_input_arguments_object(FILEPATH=getwd(), NUMSAMPLES=65, NUMCURVES=3, PARAMETERS=c("A","B"),PMIN=c(0,1),PMAX=c(100,2))
  expect_true(check_input_args(input_check$names, input_check$input))

  # Now to add an error
  # August 2018: Removed due to changes to input checking required by spartanDB package
  #input_check <- make_input_arguments_object(FILEPATH=getwd(), NUMSAMPLES="A", NUMCURVES=3, PARAMETERS=c("A","B"),PMIN=c(0,1),PMAX=c(100,2))
  #expect_false(check_input_args(input_check$names, input_check$input))
})

test_that("check_robustness_sampling_args", {
  # This calls many of the functions above, so we just need to check their integration returns false
  input_arguments <- make_input_arguments_object(FILEPATH=getwd(), PARAMETERS=c("A","B","C"),PMIN=c(1,1,1),PMAX=c(10,10,10), PINC=c(1,1,1),PARAMVALS=NULL, BASELINE=c(5,6,4))
  expect_true(check_robustness_sampling_args(input_arguments$input))
  # Check paramvals
  input_arguments <- make_input_arguments_object(FILEPATH=getwd(), PARAMETERS=c("A","B","C"),PMIN=NULL,PMAX=NULL, PINC=NULL,BASELINE=c(3,4,0.5),PARAMVALS=c("2,3,4","1,4,7","0.1,0.2,0.3,0.4,0.5,0.6,0.7"))
  expect_true(check_robustness_sampling_args(input_arguments$input))
  # Introduce errors
  input_arguments <- make_input_arguments_object(FILEPATH=getwd(), PARAMETERS=c("B","C"),PMIN=c(1,1,1),PMAX=c(10,10,10), PINC=c(1,1,1),PARAMVALS=NULL, BASELINE=c(5,6,4))
  expect_false(check_robustness_sampling_args(input_arguments$input))
  input_arguments <- make_input_arguments_object(FILEPATH=getwd(), PARAMETERS=c("A","B","C"),PMIN=NULL,PMAX=NULL, PINC=NULL,BASELINE=c(17,4,0.5),PARAMVALS=c("2,3,4","1,4,7","0.1,0.2,0.3,0.4,0.5,0.6,0.7"))
  expect_false(check_robustness_sampling_args(input_arguments$input))
})

test_that("check_nested_filepaths", {
  # Checks that sub paths exist before an analysis starts
  # Make the directories so we can test their existence (obviously the user would have done this)
  dir.create(file.path(getwd(),"1"))
  dir.create(file.path(getwd(),"5"))
  dir.create(file.path(getwd(),"50"))
  dir.create(file.path(getwd(),"100"))
  dir.create(file.path(getwd(),"300"))

  input_arguments <- make_input_arguments_object(FILEPATH=getwd(), SAMPLESIZES=c(1,5,50,100,300))
  expect_true(check_nested_filepaths(input_arguments$input$FILEPATH, input_arguments$input$SAMPLESIZES))

  # Now add some errors - 600 not existing and a reference to A
  input_arguments <- make_input_arguments_object(FILEPATH=getwd(), SAMPLESIZES=c(1,5,50,100,600))
  expect_message(check_nested_filepaths(input_arguments$input$FILEPATH, input_arguments$input$SAMPLESIZES),paste("Sub-directories ",toString(600), "do not exist. Spartan Terminated",sep=""))

                 #paste("Sub-directory  ",eval(input_arguments$input$FILEPATH),"/",eval(input_arguments$input$SAMPLESIZES), " does not exist. Spartan Terminated",sep=""))
  input_arguments <- make_input_arguments_object(FILEPATH=getwd(), SAMPLESIZES=c(1,5,50,100,R))
  expect_message(check_nested_filepaths(input_arguments$input$FILEPATH, input_arguments$input$SAMPLESIZES),"Error in declaration of file paths to data to analyse. Spartan Terminated")

  unlink(file.path(getwd(),"/1/"), recursive = TRUE)
  unlink(file.path(getwd(),"/5/"), recursive = TRUE)
  unlink(file.path(getwd(),"/50/"), recursive = TRUE)
  unlink(file.path(getwd(),"/100/"), recursive = TRUE)
  unlink(file.path(getwd(),"/300/"), recursive = TRUE)
})

test_that("check_list_all_integers", {

  input_arguments <- make_input_arguments_object(SAMPLESIZES=c(1,5,50,100,300))
  expect_true(check_list_all_integers(input_arguments$input,"SAMPLESIZES"))

  # Now add some errors
  input_arguments <- make_input_arguments_object(SAMPLESIZES=c(1,5,"A",100,300))
  expect_message(check_list_all_integers(input_arguments$input, "SAMPLESIZES"),"Error in declaration of SAMPLESIZES. Spartan Terminated")
  input_arguments <- make_input_arguments_object(SAMPLESIZES=c(1,5,-2,100,300))
  expect_message(check_list_all_integers(input_arguments$input, "SAMPLESIZES"),"SAMPLESIZES must be a list of positive integers. Terminated")

  input_arguments <- make_input_arguments_object(SAMPLESIZES=c(1,5,R,100,300))
  expect_message(check_list_all_integers(input_arguments$input, "SAMPLESIZES"),"Error in declaration of SAMPLESIZES. Spartan Terminated")

})

test_that("check_double_value_in_range", {
  input_arguments <- make_input_arguments_object(LARGEDIFFINDICATOR=0.23)
  expect_true(check_double_value_in_range(input_arguments$input$LARGEDIFFINDICATOR, "LARGEDIFFINDICATOR", 0, 0.5))
  # check out of range
  input_arguments <- make_input_arguments_object(LARGEDIFFINDICATOR=0.83)
  expect_message(check_double_value_in_range(input_arguments$input$LARGEDIFFINDICATOR, "LARGEDIFFINDICATOR", 0, 0.5),"LARGEDIFFINDICATOR must be between 0 and 0.5. Spartan terminated")
  input_arguments <- make_input_arguments_object(LARGEDIFFINDICATOR="B")
  expect_message(check_double_value_in_range(input_arguments$input$LARGEDIFFINDICATOR, "LARGEDIFFINDICATOR", 0, 0.5),"LARGEDIFFINDICATOR must be between 0 and 0.5. Spartan terminated")
  input_arguments <- make_input_arguments_object(LARGEDIFFINDICATOR=B)
  expect_message(check_double_value_in_range(input_arguments$input$LARGEDIFFINDICATOR, "LARGEDIFFINDICATOR", 0, 0.5),"Error: LARGEDIFFINDICATOR must be between 0 and 0.5. Spartan terminated")

})

test_that("check_consistency_result_type", {
  data("tutorial_consistency_set")
  input_arguments <- make_input_arguments_object(AA_SIM_RESULTS_OBJECT = tutorial_consistency_set, AA_SIM_RESULTS_FILE=NULL)
  expect_true(check_consistency_result_type(input_arguments$input, "AA_SIM_RESULTS_FILE","AA_SIM_RESULTS_OBJECT"))
  # For this test we'll need to create a file, just to show that the test can pass as well as fail:
  input_arguments <- make_input_arguments_object(AA_SIM_RESULTS_FILE = "AA_SimResponses.csv", AA_SIM_RESULTS_OBJECT=NULL, FILEPATH=getwd())
  expect_message(check_consistency_result_type(input_arguments$input, "AA_SIM_RESULTS_FILE","AA_SIM_RESULTS_OBJECT"),paste("File AA_SimResponses.csv in argument AA_SIM_RESULTS_FILE does not exist in ",input_arguments$FILEPATH,sep=""))
  make_file <- file.create(file.path(getwd(),"/AA_SimResponses.csv"))
  input_arguments <- make_input_arguments_object(AA_SIM_RESULTS_FILE = "AA_SimResponses.csv", AA_SIM_RESULTS_OBJECT=NULL, FILEPATH=getwd())
  expect_true(check_consistency_result_type(input_arguments$input, "AA_SIM_RESULTS_FILE","AA_SIM_RESULTS_OBJECT"))
  # Remove this file
  remove_file <- file.remove(file.path(getwd(),"/AA_SimResponses.csv"))
  # Make both NULL
  input_arguments <- make_input_arguments_object(AA_SIM_RESULTS_OBJECT = NULL, AA_SIM_RESULTS_FILE = NULL)
  expect_message(check_consistency_result_type(input_arguments$input, "AA_SIM_RESULTS_FILE","AA_SIM_RESULTS_OBJECT"),"Error in declaring either AA_SIM_RESULTS_FILE or AA_SIM_RESULTS_OBJECT. You must specify one. Spartan Terminated")
  # Fail the file name check
  input_arguments <- make_input_arguments_object(AA_SIM_RESULTS_FILE = data.frame(seq(1,5,by=1)), AA_SIM_RESULTS_OBJECT=NULL)
  expect_false(check_consistency_result_type(input_arguments$input, "AA_SIM_RESULTS_FILE","AA_SIM_RESULTS_OBJECT"))
  # Fail the R object existence check
  input_arguments <- make_input_arguments_object(AA_SIM_RESULTS_OBJECT = A,  AA_SIM_RESULTS_FILE=NULL)
  expect_message(check_consistency_result_type(input_arguments$input, "AA_SIM_RESULTS_FILE","AA_SIM_RESULTS_OBJECT"),"Error in declaring either AA_SIM_RESULTS_FILE or AA_SIM_RESULTS_OBJECT. You must specify one. Spartan Terminated")

})

test_that("check_column_ranges", {
  # Going to make a CSV file for testing
  write.csv(rbind(seq(1,4,1)), file=file.path(getwd(),"Test_Column_CSV.csv"), quote=F, row.names=F)
  input_arguments <- make_input_arguments_object(OUTPUTFILECOLSTART = 1, OUTPUTFILECOLEND = 3)
  expect_true(check_column_ranges(input_arguments$input, getwd(), "Test_Column_CSV.csv"))

  # Now add some errors - number of columns longer than the file:
  input_arguments <- make_input_arguments_object(OUTPUTFILECOLSTART = 1, OUTPUTFILECOLEND = 5)
  expect_message(check_column_ranges(input_arguments$input, getwd(), "Test_Column_CSV.csv"),"Error in declaring either OUTPUTFILECOLSTART or OUTPUTFILECOLEND. Spartan Terminated")
  # start greater than end
  input_arguments <- make_input_arguments_object(OUTPUTFILECOLSTART = 2, OUTPUTFILECOLEND = 1)
  expect_message(check_column_ranges(input_arguments$input, getwd(), "Test_Column_CSV.csv"),"Error in declaring either OUTPUTFILECOLSTART or OUTPUTFILECOLEND. Spartan Terminated")
  # results file does not exist
  expect_message(check_column_ranges(input_arguments$input, getwd(), "Test_Column_CSV2.csv"),"Attempted to check OUTPUTFILECOLSTART and OUTPUTFILECOLEND in first result file, but file ",
                    file.path(getwd(),"Test_Column_CSV2.csv"), " does not exist")
  # Test with error
  input_arguments <- make_input_arguments_object(OUTPUTFILECOLSTART = 2, OUTPUTFILECOLEND = A)
  expect_message(check_column_ranges(input_arguments$input, getwd(), "Test_Column_CSV.csv"),"Error in declaring either OUTPUTFILECOLSTART or OUTPUTFILECOLEND. Spartan Terminated")

  file.remove(file.path(getwd(),"Test_Column_CSV.csv"))
})

test_that("check_file_exist", {
  write.csv(rbind(seq(1,4,1)), file=file.path(getwd(),"Test_Column_CSV.csv"), quote=F, row.names=F)
  expect_true(check_file_exist(getwd(), "Test_Column_CSV.csv"))
  expect_false(check_file_exist(getwd(), "Test_Column_CSV2.csv"))
  expect_false(check_file_exist(getwd(), A))
  file.remove(file.path(getwd(),"Test_Column_CSV.csv"))

})

test_that("check_function_dependent_paramvals", {

  input_arguments <- make_input_arguments_object(PARAMVALS = c(150,"[10,90,10]","[10,90,10]","[5,40,5]"),PARAMETERS = c("people","infectiousness","chance-recover","duration"))
  # Change the calling function:
  input_arguments$input[[1]] = "lhc_generate_lhc_sample_netlogo"
  expect_true(check_function_dependent_paramvals(input_arguments$input, "PARAMVALS"))
  input_arguments$input[[1]] = "efast_generate_sample_netlogo"
  expect_true(check_function_dependent_paramvals(input_arguments$input, "PARAMVALS"))

  input_arguments <- make_input_arguments_object(PARAMVALS=c("0, 50, 90","0.10, 0.3, 0.8","0.10, 0.25, 0.4",
                                                                "0.015, 0.04, 0.08", "0.1, 0.5, 0.9","0.25, 1.25, 2.0, 3.0, 5.0"),
                                                 PARAMETERS= c("thresholdBindProbability", "chemoThreshold","chemoUpperLinearAdjust", "chemoLowerLinearAdjust",
                                                                "maxVCAMeffectProbabilityCutoff", "vcamSlope"),PMIN=NULL, PMAX=NULL, PINC=NULL, BASELINE=c(50,0.3,0.4,0.04,0.5,2.0))
  input_arguments$input[[1]] = "oat_parameter_sampling"
  expect_true(check_function_dependent_paramvals(input_arguments$input, "PARAMVALS"))


})

test_that("check_aaSampleSizeSummary", {
  # Calls the functions testeed in this file - need to make sure a combination returns the correct result
  data("a_test_results")
  input_check <- make_input_arguments_object(FILEPATH=getwd(), SAMPLESIZES=c(1,5,50,100,300),
                                                 MEASURES=c("Velocity","Displacement"),
                                                 SUMMARYFILENAME="ATestSummary.csv",
                                                 ATESTRESULTS_OBJECT = a_test_results,
                                                 ATESTRESULTS_FILE = NULL)
  expect_true(check_input_args(input_check$names, input_check$input))
  # File
  write.csv(a_test_results,file=file.path(getwd(),"ATests.csv"),row.names=F,quote=F)
  input_check <- make_input_arguments_object(FILEPATH=getwd(), SAMPLESIZES=c(1,5,50,100,300),
                                                 MEASURES=c("Velocity","Displacement"),
                                                 SUMMARYFILENAME="ATestSummary.csv",
                                                 ATESTRESULTS_FILE = "ATests.csv")
  expect_true(check_input_args(input_check$names, input_check$input))
  # Some errors:
  input_check <- make_input_arguments_object(FILEPATH=getwd(), SAMPLESIZES=A,
                                                 MEASURES=c("Velocity","Displacement"),
                                                 SUMMARYFILENAME="ATestSummary.csv",
                                                 ATESTRESULTS_FILE = "ATests.csv")
  expect_message(check_input_args(input_check$names, input_check$input),"Error in declaration of SAMPLESIZES. Spartan Terminated")

  file.remove(file.path(getwd(),"ATests.csv"))
})

test_that("check_aa_summariseReplicateRuns", {
  # This joins many input functions that have already been tested - we need to check the output is correct
  dir.create(file.path(getwd(),"AA"))
  dir.create(file.path(getwd(),"AA","1"))
  dir.create(file.path(getwd(),"AA","1","1"))
  dir.create(file.path(getwd(),"AA","1","1","1"))
  write.csv(rbind(seq(1,4,1)), file=file.path(getwd(),"AA","1","1","1","ATestSummary.csv"), quote=F, row.names=F)
  write.csv(rbind(seq(1,4,1)), file=file.path(getwd(),"AA","1","1","1","AltResult.csv"), quote=F, row.names=F)

  input_check <- make_input_arguments_object(FILEPATH=file.path(getwd(),"AA"), SAMPLESIZES=c(1),
                                                 MEASURES=c("Velocity","Displacement"),
                                                 RESULTFILENAME="ATestSummary.csv",
                                                 ALTFILENAME="AltResult.csv",
                                                 OUTPUTFILECOLSTART = 1,
                                                 OUTPUTFILECOLEND = 2,
                                                 SUMMARYFILENAME="SummaryFile.csv")
  # We have to put a change in here to make it look like the actual function called this check
  input_check$input[[1]]="aa_summariseReplicateRuns"


  # Replaced with new input checking method:
  expect_true(check_input_args(input_check$names, input_check$input))
  #expect_true(check_aa_summariseReplicateRuns(input_arguments))

  # Introduce some errors
  input_check <- make_input_arguments_object(FILEPATH=file.path(getwd(),"AA"), SAMPLESIZES=c(A,1),
                                                 MEASURES=c("Velocity","Displacement"),
                                                 RESULTFILENAME="ATestSummary.csv",
                                                 ALTFILENAME="AltResult.csv",
                                                 OUTPUTFILECOLSTART = 1,
                                                 OUTPUTFILECOLEND = 2,
                                                 SUMMARYFILENAME="SummaryFile.csv")
  input_check$input[[1]]="aa_summariseReplicateRuns"
  expect_message(check_input_args(input_check$names, input_check$input),"Error in declaration of SAMPLESIZES. Spartan Terminated")
  input_check <- make_input_arguments_object(FILEPATH=file.path(getwd(),"AA"), SAMPLESIZES=c(1),
                                                 MEASURES=c("Velocity","Displacement"),
                                                 RESULTFILENAME="ATestSummary.csv",
                                                 ALTFILENAME="AltResult.csv",
                                                 OUTPUTFILECOLSTART = 10,
                                                 OUTPUTFILECOLEND = 2,
                                                 SUMMARYFILENAME="SummaryFile.csv")
  input_check$input[[1]]="aa_summariseReplicateRuns"
  expect_message(check_input_args(input_check$names, input_check$input),"Error in declaring either OUTPUTFILECOLSTART or OUTPUTFILECOLEND. Spartan Terminated")
  input_check <- make_input_arguments_object(FILEPATH=file.path(getwd(),"AA"), SAMPLESIZES=c(1),
                                                 MEASURES=c("Velocity","Displacement"),
                                                 RESULTFILENAME="ATestSummary.csv",
                                                 ALTFILENAME="AltResult.csv",
                                                 OUTPUTFILECOLSTART = 1,
                                                 OUTPUTFILECOLEND = 2,
                                                 SUMMARYFILENAME=VAR)
  input_check$input[[1]]="aa_summariseReplicateRuns"
  expect_message(check_input_args(input_check$names, input_check$input),"SUMMARYFILENAME must be either a text string or numeric. Error in declaration. Terminated")

  unlink(file.path(getwd(),"/AA"), recursive = TRUE)
})

test_that("check_graph_output_type", {
  input_check <- make_input_arguments_object(OUTPUT_TYPE=c("PDF","PNG"))
  expect_true(check_graph_output_type(input_check$input,"OUTPUT_TYPE"))

  input_check <- make_input_arguments_object(OUTPUT_TYPE=c("PDF","R"))
  expect_message(check_graph_output_type(input_check$input,"OUTPUT_TYPE"),"Graph types can only be PDF, PNG, TIFF, BMP")

})

