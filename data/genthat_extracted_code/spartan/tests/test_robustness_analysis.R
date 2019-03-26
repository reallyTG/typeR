library(spartan)
context("Test of Spartan Robustness Analysis")

test_that("oat_processParamSubsets", {
  # Below tests examine each internal function
  # Here we just need to test that we get some output
  # All input has also been checked in test input argument

  setup_multiple_parameter_result_analysis()

  oat_processParamSubsets(getwd(), c("chemoLowerLinearAdjust","chemoUpperLinearAdjust"),1,
                          c("Velocity","Displacement"), RESULTFILENAME="Test_Robustness_Result.csv",
                          ALTERNATIVEFILENAME=NULL, OUTPUTFILECOLSTART=1, OUTPUTFILECOLEND=2, "Test_Summary_File.csv",
                          c(0.05,2),PMIN=c(0.05,1),PMAX=c(0.1,2),
                          PINC=c(0.05,1), PARAMVALS=NULL, TIMEPOINTS = NULL, TIMEPOINTSCALE = NULL)

  expect_true(file.exists(file.path(getwd(),"Test_Summary_File.csv")))

  unlink(file.path(getwd(),"chemoLowerLinearAdjust"), recursive = TRUE)
  unlink(file.path(getwd(),"chemoUpperLinearAdjust"), recursive = TRUE)
  file.remove(file.path(getwd(),"Test_Summary_File.csv"))


})

test_that("generate_summary_stats_for_all_param_sets", {

  setup_multiple_parameter_result_analysis()

  summary_two_param <- generate_summary_stats_for_all_param_sets(getwd(),c("chemoLowerLinearAdjust","chemoUpperLinearAdjust"),c(0.05,2),PMIN=c(0.05,1),PMAX=c(0.1,2),
                                                                 PINC=c(0.05,1), PARAMVALS=NULL, 1, c("Velocity","Displacement"), "Test_Robustness_Result.csv", NULL, 1,2)

  # Should be three rows (if baseline has not be evaluated twice)
  expect_equal(nrow(summary_two_param),3)
  # Four columns - 2 param values and two results
  expect_equal(ncol(summary_two_param),4)
  expect_equal(toString(colnames(summary_two_param)),"chemoLowerLinearAdjust, chemoUpperLinearAdjust, Velocity, Displacement")
  # Check values (just makes sure no NAs)
  expect_equal(as.numeric(summary_two_param[1,1]),0.05)
  expect_equal(as.numeric(summary_two_param[2,1]),0.10)
  expect_equal(as.numeric(summary_two_param[3,1]),0.05)
  expect_equal(as.numeric(summary_two_param[1,2]),2)
  expect_equal(as.numeric(summary_two_param[3,2]),1)
  expect_equal(round(as.numeric(summary_two_param[2,3]),digits=6),2.156870)
  expect_equal(round(as.numeric(summary_two_param[2,4]),digits=5),43.18424)


  unlink(file.path(getwd(),"chemoLowerLinearAdjust"), recursive = TRUE)
  unlink(file.path(getwd(),"chemoUpperLinearAdjust"), recursive = TRUE)
})

test_that("produce_summary_for_all_values_of_parameter", {

  # Make test file, in correct directory structure
  dir.create(file.path(getwd(),"chemoLowerLinearAdjust"))
  dir.create(file.path(getwd(),"chemoLowerLinearAdjust","0.05"))
  dir.create(file.path(getwd(),"chemoLowerLinearAdjust","0.05","1"))
  dir.create(file.path(getwd(),"chemoLowerLinearAdjust","0.1"))
  dir.create(file.path(getwd(),"chemoLowerLinearAdjust","0.1","1"))
  make_test_sim_result_file(file.path(getwd(),"/chemoLowerLinearAdjust/0.05/1/Test_Robustness_Result.csv"),1)
  make_test_sim_result_file(file.path(getwd(),"/chemoLowerLinearAdjust/0.1/1/Test_Robustness_Result.csv"),2)

  PARAMETERS<-c("chemoLowerLinearAdjust")
  param_val_list <-
    as.numeric(prepare_parameter_value_list(PMIN=c(0.05), PMAX=c(0.10), PINC=c(0.05),
                                            NULL, 1))
  EXP_PARAMS <- as.character(c(0.05))

  param_result <- produce_summary_for_all_values_of_parameter(getwd(),1, param_val_list, BASELINE=c(0.05), FALSE, PARAMETERS, EXP_PARAMS,
                                                              1, c("Velocity","Displacement"),"Test_Robustness_Result.csv", NULL, 1,2)

  # Test the baseline has been evaluated
  expect_true(param_result$baseline_evaluated)
  expect_equal(nrow(param_result$parameter_result),2)
  expect_equal(ncol(param_result$parameter_result),3)
  # Check the values
  expect_equal(round(as.numeric(param_result$parameter_result[1,2]),digits=6),2.101808)
  expect_equal(round(as.numeric(param_result$parameter_result[2,2]),digits=6),2.156870)
  expect_equal(round(as.numeric(param_result$parameter_result[1,3]),digits=5),44.09774)
  expect_equal(round(as.numeric(param_result$parameter_result[2,3]),digits=5),43.18424)

  unlink(file.path(getwd(),"chemoLowerLinearAdjust"), recursive = TRUE)

})

test_that("process_parameter_value_if_exists", {

  # Make test file, in correct directory structure
  dir.create(file.path(getwd(),"chemoLowerLinearAdjust"))
  dir.create(file.path(getwd(),"chemoLowerLinearAdjust","0.05"))
  dir.create(file.path(getwd(),"chemoLowerLinearAdjust","0.05","1"))
  make_test_sim_result_file(file.path(getwd(),"/chemoLowerLinearAdjust/0.05/1/Test_Robustness_Result.csv"),1)

  # Requires exp_params for labelling results, but not too much of a worry here
  BASELINE<-c(50, 0.3, 0.2, 0.04, 0.60, 1.0)
  EXP_PARAMS <- as.character(BASELINE)

  summary_stats <- process_parameter_value_if_exists(getwd(),1,c("Velocity","Displacement"),"Test_Robustness_Result.csv",NULL,1,2,"chemoLowerLinearAdjust", 0.05, EXP_PARAMS)

  # Return in this case should be the same as the test below (which calls the test below function)
  expect_equal(nrow(summary_stats),1)
  expect_equal(ncol(summary_stats),8)
  # Check the median values are correct
  expect_equal(round(as.numeric(summary_stats[1,7]),digits=6),2.101808)
  expect_equal(round(as.numeric(summary_stats[1,8]),digits=5),44.09774)

  # What if the file does not exist
  expect_message(process_parameter_value_if_exists(getwd(),1,c("Velocity","Displacement"),"Test_Robustness_Result.csv",NULL,1,2,"chemoLowerLinearAdjust", 0.10, EXP_PARAMS),"No results can be found for parameter: chemoLowerLinearAdjust Value: 0.1")

  unlink(file.path(getwd(),"chemoLowerLinearAdjust"), recursive = TRUE)
})

test_that("generate_medians_for_param_set" , {

  # Write and place in the correct directory
  dir.create(file.path(getwd(),1))
  make_test_sim_result_file(file.path(getwd(),"/1/Test_Robustness_Result.csv"),1)

  # Requires exp_params for labelling results, but not too much of a worry here
  BASELINE<-c(50, 0.3, 0.2, 0.04, 0.60, 1.0)
  EXP_PARAMS <- as.character(BASELINE)

  # Now to test the result produces the correct structure:
  summary_stats <- generate_medians_for_param_set(getwd(), 1, c("Velocity","Displacement"), "Test_Robustness_Result.csv",
                                                  NULL,1, 2, EXP_PARAMS, "chemoLowerLinearAdjust",0.05)

  # examine the structure created
  expect_equal(nrow(summary_stats),1)
  expect_equal(ncol(summary_stats),8)
  # Check the median values are correct
  expect_equal(round(as.numeric(summary_stats[1,7]),digits=6),2.101808)
  expect_equal(round(as.numeric(summary_stats[1,8]),digits=5),44.09774)

  # Remove the created structure
  unlink(file.path(getwd(),"1"), recursive = TRUE)

})

test_that("calculate_atest_score", {

  load(file.path("test_baseline.Rda"))
  load(file.path("robust_param_test_data.Rda"))
  a_test_result <- calculate_atest_score(parameter_result, c("0.015","0.2"),
                                         baseline_result, c("Velocity","Displacement"), "chemoLowerLinearAdjust", 0.015)

  # Now we can test the structure:
  # In this case should be 6 columns and 1 row
  expect_true(ncol(a_test_result)==6)
  expect_true(nrow(a_test_result)==1)
  # First two columns should have the parameter info
  expect_equal(a_test_result[1,1][[1]],"0.015")
  expect_equal(a_test_result[1,2][[1]],"0.2")
  # Check the scores have been calculated right
  expect_equal(a_test_result[1,3][[1]],"0.213257877374588")
  expect_equal(a_test_result[1,4][[1]],"0.786742122625412")
  expect_equal(a_test_result[1,5][[1]],"0.0102491184165624")
  expect_equal(a_test_result[1,6][[1]],"0.989750881583438")


})

test_that("compare_all_values_of_parameter_to_baseline", {

  exp_params <- as.character(c(0.04, 0.2))
  load(file.path("Robustness_result_for_test.Rda"))
  load(file.path("test_baseline.Rda"))

  # List of parameter values for this parameter
  parameter_value_list <- as.numeric(
    prepare_parameter_value_list(c(0.015, 0.10), c(0.08, 0.50), c(0.005, 0.05), NULL, 1))

  parameter_results <- compare_all_values_of_parameter_to_baseline(
    parameter_value_list, c("chemoLowerLinearAdjust", "chemoUpperLinearAdjust"), 1, c(0.04, 0.2), robustness_result_for_test,
    exp_params, baseline_result, c("Velocity","Displacement"), NULL)

  # Check structure
  expect_true(ncol(parameter_results)==6)
  expect_true(nrow(parameter_results)==13)
  # Check parameter columns
  expect_equal(toString(parameter_results[,1]),"0.015, 0.02, 0.025, 0.03, 0.035, 0.045, 0.05, 0.055, 0.06, 0.065, 0.07, 0.075, 0.08")
  expect_equal(toString(parameter_results[,2]),"0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2, 0.2")
  # Can check the A-Test results never change too, using the same method
  expect_equal(toString(parameter_results[,3]),"0.213257877374588, 0.304886534533456, 0.344790240398644, 0.418134318273952, 0.484440186831126, 0.558381379217152, 0.622669649515287, 0.652914637157415, 0.677869296996814, 0.679927293064877, 0.697088729770376, 0.707829977628635, 0.717253727309581")
  expect_equal(toString(parameter_results[,4]),"0.786742122625412, 0.695113465466544, 0.655209759601356, 0.581865681726048, 0.515559813168874, 0.558381379217152, 0.622669649515287, 0.652914637157415, 0.677869296996814, 0.679927293064877, 0.697088729770376, 0.707829977628635, 0.717253727309581")
  expect_equal(toString(parameter_results[,5]),"0.0102491184165624, 0.0251285044106754, 0.0999416399182959, 0.231847664519616, 0.375974968256848, 0.630726093419215, 0.748333446320024, 0.816536104689008, 0.867025964341401, 0.898266219239374, 0.908655249040426, 0.926498881431767, 0.942322417909103")
  expect_equal(toString(parameter_results[,6]),"0.989750881583438, 0.974871495589325, 0.900058360081704, 0.768152335480384, 0.624025031743152, 0.630726093419215, 0.748333446320024, 0.816536104689008, 0.867025964341401, 0.898266219239374, 0.908655249040426, 0.926498881431767, 0.942322417909103")
  expect_false(any(is.na(parameter_results)))

})

test_that("oat_csv_result_file_analysis", {
  # All internal functions have been tested - now we just need to check that this function produces output
  load(file.path("Robustness_result_for_test.Rda"))
  # write out as CSV file so that we can feed this to function
  write.csv(robustness_result_for_test,file="robustness_result.csv")

  oat_csv_result_file_analysis(getwd(), "robustness_result.csv", c("chemoLowerLinearAdjust", "chemoUpperLinearAdjust"),
                               c(0.04, 0.2), c("Velocity", "Displacement"),
                               "EgSet_ATests.csv",
                               PMIN = c(0.015, 0.10), PMAX = c(0.08, 0.50), PINC = c(0.005, 0.05),
                               PARAMVALS = NULL, TIMEPOINTS = NULL, TIMEPOINTSCALE = NULL)

  # Do we have output
  expect_true(file.exists(file.path(getwd(),"EgSet_ATests.csv")))
  # read it in
  result <- read.csv(file.path(getwd(),"EgSet_ATests.csv"),header=T,sep=",",check.names=F)

  expect_true(nrow(result)==22)
  expect_true(ncol(result)==6)
  expect_false(any(is.na(result)))

  file.remove("robustness_result.csv")
  file.remove("EgSet_ATests.csv")
})

test_that("oat_csv_result_file_analysis_overTime", {

  # Bit of setup involved here
  load(file.path("Robustness_hour12_data.Rda"))
  write.csv(robustness_hour12_data,file="robustness_result_12.csv")
  load(file.path("Robustness_hour36_data.Rda"))
  write.csv(robustness_hour36_data,file="robustness_result_36.csv")

  oat_csv_result_file_analysis(getwd(), "robustness_result.csv", c("chemoLowerLinearAdjust", "chemoUpperLinearAdjust"),
                               c(0.04, 0.2), c("Velocity", "Displacement"),
                               "EgSet_ATests.csv",
                               PMIN = c(0.015, 0.10), PMAX = c(0.08, 0.50), PINC = c(0.005, 0.05),
                               PARAMVALS = NULL, TIMEPOINTS = c(12,36),
                               TIMEPOINTSCALE="Hours")

  # Check for file output
  expect_true(file.exists("EgSet_ATests_12.csv"))
  expect_true(file.exists("EgSet_ATests_36.csv"))

  # Check content
  result <- read.csv(file.path(getwd(),"EgSet_ATests_12.csv"),header=T,sep=",",check.names=F)
  expect_true(nrow(result)==22)
  expect_true(ncol(result)==6)
  expect_false(any(is.na(result)))

  result <- read.csv(file.path(getwd(),"EgSet_ATests_36.csv"),header=T,sep=",",check.names=F)
  expect_true(nrow(result)==22)
  expect_true(ncol(result)==6)
  expect_false(any(is.na(result)))

  file.remove("robustness_result_12.csv")
  file.remove("robustness_result_36.csv")
  file.remove("EgSet_ATests_12.csv")
  file.remove("EgSet_ATests_36.csv")

})

test_that("oat_processParamSubsets_overTime", {

  setup_multiple_parameter_result_analysis_overTime()

  oat_processParamSubsets(getwd(), c("chemoLowerLinearAdjust","chemoUpperLinearAdjust"),1,
                          c("Velocity","Displacement"), RESULTFILENAME="Test_Robustness_Result.csv",
                          ALTERNATIVEFILENAME=NULL, OUTPUTFILECOLSTART=1, OUTPUTFILECOLEND=2, "Test_Summary_File.csv",
                          c(0.05,2),PMIN=c(0.05,1),PMAX=c(0.1,2),
                          PINC=c(0.05,1), PARAMVALS=NULL, TIMEPOINTS = c(12,36), TIMEPOINTSCALE = "Hours")

  # Test for file existance
  expect_true(file.exists("Test_Summary_File_12.csv"))
  expect_true(file.exists("Test_Summary_File_36.csv"))
  result <- read.csv(file.path(getwd(),"Test_Summary_File_36.csv"),header=T,sep=",",check.names=F)
  # Check structure
  expect_true(nrow(result)==3)
  expect_true(ncol(result)==4)
  expect_false(any(is.na(result)))
  result <- read.csv(file.path(getwd(),"Test_Summary_File_12.csv"),header=T,sep=",",check.names=F)
  # Check structure
  expect_true(nrow(result)==3)
  expect_true(ncol(result)==4)
  expect_false(any(is.na(result)))

  cleanup()
  file.remove(file.path(getwd(),"Test_Summary_File_12.csv"))
  file.remove(file.path(getwd(),"Test_Summary_File_36.csv"))

})

test_that("oat_graphATestsForSampleSize", {

  # Setup:
  load(file.path("Robustness_result_for_test.Rda"))
  # write out as CSV file so that we can feed this to function
  write.csv(robustness_result_for_test,file="robustness_result.csv")

  oat_csv_result_file_analysis(getwd(), "robustness_result.csv", c("chemoLowerLinearAdjust", "chemoUpperLinearAdjust"),
                               c(0.04, 0.2), c("Velocity", "Displacement"),
                               "EgSet_ATests.csv",
                               PMIN = c(0.015, 0.10), PMAX = c(0.08, 0.50), PINC = c(0.005, 0.05),
                               PARAMVALS = NULL, TIMEPOINTS = NULL, TIMEPOINTSCALE = NULL)

  oat_graphATestsForSampleSize(getwd(), c("chemoLowerLinearAdjust", "chemoUpperLinearAdjust"),
                               c("Velocity", "Displacement"),0.23, "EgSet_ATests.csv",
                               c(0.04, 0.2), PMIN = c(0.015, 0.10), PMAX = c(0.08, 0.50), PINC = c(0.005, 0.05),
                               PARAMVALS = NULL)

  # Now see if we have any plots
  expect_true(file.exists("chemoLowerLinearAdjust.pdf"))
  expect_true(file.exists("chemoUpperLinearAdjust.pdf"))

  file.remove("robustness_result.csv")
  file.remove("EgSet_ATests.csv")
  file.remove("chemoLowerLinearAdjust.pdf")
  file.remove("chemoUpperLinearAdjust.pdf")

})

test_that("oat_graphATestsForSampleSize_overTime", {
  # Bit of setup involved here
  load(file.path("Robustness_hour12_data.Rda"))
  write.csv(robustness_hour12_data,file="robustness_result_12.csv")
  load(file.path("Robustness_hour36_data.Rda"))
  write.csv(robustness_hour36_data,file="robustness_result_36.csv")

  oat_csv_result_file_analysis(getwd(), "robustness_result.csv", c("chemoLowerLinearAdjust", "chemoUpperLinearAdjust"),
                               c(0.04, 0.2), c("Velocity", "Displacement"),
                               "EgSet_ATests.csv",
                               PMIN = c(0.015, 0.10), PMAX = c(0.08, 0.50), PINC = c(0.005, 0.05),
                               PARAMVALS = NULL, TIMEPOINTS = c(12,36),
                               TIMEPOINTSCALE="Hours")

  oat_graphATestsForSampleSize(getwd(), c("chemoLowerLinearAdjust", "chemoUpperLinearAdjust"),
                               c("Velocity", "Displacement"),0.23, "EgSet_ATests.csv",
                               c(0.04, 0.2), PMIN = c(0.015, 0.10), PMAX = c(0.08, 0.50), PINC = c(0.005, 0.05),
                               PARAMVALS = NULL, TIMEPOINTS = c(12,36), TIMEPOINTSCALE = "Hours")

  expect_true(file.exists("chemoLowerLinearAdjust_12.pdf"))
  expect_true(file.exists("chemoLowerLinearAdjust_36.pdf"))
  expect_true(file.exists("chemoUpperLinearAdjust_12.pdf"))
  expect_true(file.exists("chemoUpperLinearAdjust_36.pdf"))
  file.remove("robustness_result_12.csv")
  file.remove("robustness_result_36.csv")
  file.remove("EgSet_ATests_12.csv")
  file.remove("EgSet_ATests_36.csv")
  file.remove("chemoLowerLinearAdjust_12.pdf")
  file.remove("chemoLowerLinearAdjust_36.pdf")
  file.remove("chemoUpperLinearAdjust_12.pdf")
  file.remove("chemoUpperLinearAdjust_36.pdf")
})

test_that("oat_plotResultDistribution", {

  # Setup:
  load(file.path("Robustness_result_for_test.Rda"))
  # write out as CSV file so that we can feed this to function
  write.csv(robustness_result_for_test,file="robustness_result.csv")

  oat_plotResultDistribution(getwd(), c("chemoLowerLinearAdjust", "chemoUpperLinearAdjust"),
                             c("Velocity", "Displacement"), c("microns/min","microns"), "robustness_result.csv", c(0.04, 0.2), PMIN = c(0.015, 0.10), PMAX = c(0.08, 0.50), PINC = c(0.005, 0.05),
                             PARAMVALS = NULL)

  expect_true(file.exists("BP_chemoLowerLinearAdjust_Displacement.pdf"))
  expect_true(file.exists("BP_chemoLowerLinearAdjust_Velocity.pdf"))
  expect_true(file.exists("BP_chemoUpperLinearAdjust_Displacement.pdf"))
  expect_true(file.exists("BP_chemoUpperLinearAdjust_Velocity.pdf"))

  file.remove("robustness_result.csv")
  file.remove("BP_chemoLowerLinearAdjust_Displacement.pdf")
  file.remove("BP_chemoLowerLinearAdjust_Velocity.pdf")
  file.remove("BP_chemoUpperLinearAdjust_Displacement.pdf")
  file.remove("BP_chemoUpperLinearAdjust_Velocity.pdf")

})

test_that("oat_plotResultDistribution_overTime", {

  load(file.path("Robustness_hour12_data.Rda"))
  write.csv(robustness_hour12_data,file="robustness_result_12.csv")
  load(file.path("Robustness_hour36_data.Rda"))
  write.csv(robustness_hour36_data,file="robustness_result_36.csv")

  oat_plotResultDistribution(getwd(), c("chemoLowerLinearAdjust", "chemoUpperLinearAdjust"),
                             c("Velocity", "Displacement"), c("microns/min","microns"), "robustness_result.csv", c(0.04, 0.2), PMIN = c(0.015, 0.10), PMAX = c(0.08, 0.50), PINC = c(0.005, 0.05),
                             PARAMVALS = NULL, TIMEPOINTS<-c(12,36), TIMEPOINTSCALE="Hours")

  expect_true(file.exists("BP_chemoLowerLinearAdjust_Displacement12.pdf"))
  expect_true(file.exists("BP_chemoLowerLinearAdjust_Velocity12.pdf"))
  expect_true(file.exists("BP_chemoUpperLinearAdjust_Displacement12.pdf"))
  expect_true(file.exists("BP_chemoUpperLinearAdjust_Velocity12.pdf"))
  expect_true(file.exists("BP_chemoLowerLinearAdjust_Displacement36.pdf"))
  expect_true(file.exists("BP_chemoLowerLinearAdjust_Velocity36.pdf"))
  expect_true(file.exists("BP_chemoUpperLinearAdjust_Displacement36.pdf"))
  expect_true(file.exists("BP_chemoUpperLinearAdjust_Velocity36.pdf"))

  file.remove("robustness_result_12.csv")
  file.remove("robustness_result_36.csv")
  file.remove("BP_chemoLowerLinearAdjust_Displacement12.pdf")
  file.remove("BP_chemoLowerLinearAdjust_Velocity12.pdf")
  file.remove("BP_chemoUpperLinearAdjust_Displacement12.pdf")
  file.remove("BP_chemoUpperLinearAdjust_Velocity12.pdf")
  file.remove("BP_chemoLowerLinearAdjust_Displacement36.pdf")
  file.remove("BP_chemoLowerLinearAdjust_Velocity36.pdf")
  file.remove("BP_chemoUpperLinearAdjust_Displacement36.pdf")
  file.remove("BP_chemoUpperLinearAdjust_Velocity36.pdf")

})

