library(spartan)
context("Test of Spartan eFAST Analysis")

test_that("efast_generate_medians_for_all_parameter_subsets", {
  # Fortunate here as this function can reuse much of the LHC analysis code, that has
  # already been tested
  setup_efast_result_analysis()

  efast_generate_medians_for_all_parameter_subsets(getwd(), 2, c("A","B"), 2, 2,
                                                   c("Velocity","Displacement"), "Test_eFAST_Result.csv", NULL, 1,
                                                   2)

  # check for output
  expect_true(file.exists(file.path(getwd(),"Curve1_Parameter1_Results.csv")))
  expect_true(file.exists(file.path(getwd(),"Curve1_Parameter2_Results.csv")))
  expect_true(file.exists(file.path(getwd(),"Curve2_Parameter1_Results.csv")))
  expect_true(file.exists(file.path(getwd(),"Curve2_Parameter2_Results.csv")))

  # Check structure
  result<-read_from_csv(file.path(getwd(),"Curve1_Parameter1_Results.csv"))
  expect_true(nrow(result)==4)
  expect_true(ncol(result)==4)
  expect_false(any(is.na(result)))

  result<-read_from_csv(file.path(getwd(),"Curve1_Parameter2_Results.csv"))
  expect_true(nrow(result)==4)
  expect_true(ncol(result)==4)
  expect_false(any(is.na(result)))

  result<-read_from_csv(file.path(getwd(),"Curve2_Parameter1_Results.csv"))
  expect_true(nrow(result)==4)
  expect_true(ncol(result)==4)
  expect_false(any(is.na(result)))

  result<-read_from_csv(file.path(getwd(),"Curve2_Parameter2_Results.csv"))
  expect_true(nrow(result)==4)
  expect_true(ncol(result)==4)
  expect_false(any(is.na(result)))

  cleanup_efast()

})

test_that("efast_generate_medians_for_all_parameter_subsets_overTime", {

  setup_efast_result_analysis(overTime=TRUE)
  efast_generate_medians_for_all_parameter_subsets(getwd(), 2, c("A","B"), 2, 2,
                                                   c("Velocity","Displacement"), "Test_eFAST_Result.csv", NULL, 1,
                                                   2,TIMEPOINTS=c(12,36),TIMEPOINTSCALE="Hours")

  # check for output
  expect_true(file.exists(file.path(getwd(),"Curve1_Parameter1_Results_12.csv")))
  expect_true(file.exists(file.path(getwd(),"Curve1_Parameter2_Results_12.csv")))
  expect_true(file.exists(file.path(getwd(),"Curve2_Parameter1_Results_12.csv")))
  expect_true(file.exists(file.path(getwd(),"Curve2_Parameter2_Results_12.csv")))
  expect_true(file.exists(file.path(getwd(),"Curve1_Parameter1_Results_36.csv")))
  expect_true(file.exists(file.path(getwd(),"Curve1_Parameter2_Results_36.csv")))
  expect_true(file.exists(file.path(getwd(),"Curve2_Parameter1_Results_36.csv")))
  expect_true(file.exists(file.path(getwd(),"Curve2_Parameter2_Results_36.csv")))

  # Check structure
  result<-read_from_csv(file.path(getwd(),"Curve1_Parameter1_Results_12.csv"))
  expect_true(nrow(result)==4)
  expect_true(ncol(result)==4)
  expect_false(any(is.na(result)))
  result<-read_from_csv(file.path(getwd(),"Curve1_Parameter1_Results_36.csv"))
  expect_true(nrow(result)==4)
  expect_true(ncol(result)==4)
  expect_false(any(is.na(result)))

  result<-read_from_csv(file.path(getwd(),"Curve1_Parameter2_Results_12.csv"))
  expect_true(nrow(result)==4)
  expect_true(ncol(result)==4)
  expect_false(any(is.na(result)))
  result<-read_from_csv(file.path(getwd(),"Curve1_Parameter2_Results_36.csv"))
  expect_true(nrow(result)==4)
  expect_true(ncol(result)==4)
  expect_false(any(is.na(result)))

  result<-read_from_csv(file.path(getwd(),"Curve2_Parameter1_Results_12.csv"))
  expect_true(nrow(result)==4)
  expect_true(ncol(result)==4)
  expect_false(any(is.na(result)))
  result<-read_from_csv(file.path(getwd(),"Curve2_Parameter1_Results_36.csv"))
  expect_true(nrow(result)==4)
  expect_true(ncol(result)==4)
  expect_false(any(is.na(result)))

  result<-read_from_csv(file.path(getwd(),"Curve2_Parameter2_Results_12.csv"))
  expect_true(nrow(result)==4)
  expect_true(ncol(result)==4)
  expect_false(any(is.na(result)))
  result<-read_from_csv(file.path(getwd(),"Curve2_Parameter2_Results_36.csv"))
  expect_true(nrow(result)==4)
  expect_true(ncol(result)==4)
  expect_false(any(is.na(result)))

  cleanup_efast(overTime=TRUE)

})

test_that("efast_get_overall_medians", {

  # Setup:
  setup_efast_result_analysis(overTime=FALSE)
  efast_generate_medians_for_all_parameter_subsets(getwd(), 2, c("A","B"), 2, 2,
                                                   c("Velocity","Displacement"), "Test_eFAST_Result.csv", NULL, 1,
                                                   2)

  # Now run the summary method:
  efast_get_overall_medians(getwd(),2,c("A","B"),2,c("Velocity","Displacement"))

  # Now check for existance of results
  expect_true(file.exists(file.path(getwd(),"Curve1_Results_Summary.csv")))
  expect_true(file.exists(file.path(getwd(),"Curve2_Results_Summary.csv")))

  # Test structures:
  result<-read_from_csv(file.path(getwd(),"Curve1_Results_Summary.csv"))
  expect_true(nrow(result)==2)
  expect_true(ncol(result)==4)
  expect_false(any(is.na(result)))

  result<-read_from_csv(file.path(getwd(),"Curve2_Results_Summary.csv"))
  expect_true(nrow(result)==2)
  expect_true(ncol(result)==4)
  expect_false(any(is.na(result)))

  # Cleanup
  cleanup_efast()
  file.remove(file.path(getwd(),"Curve1_Results_Summary.csv"))
  file.remove(file.path(getwd(),"Curve2_Results_Summary.csv"))
})

test_that("efast_get_overall_medians_overTime", {

  # Setup:
  setup_efast_result_analysis(overTime=TRUE)
  efast_generate_medians_for_all_parameter_subsets(getwd(), 2, c("A","B"), 2, 2,
                                                   c("Velocity","Displacement"), "Test_eFAST_Result.csv", NULL, 1,
                                                   2,TIMEPOINTS=c(12,36),TIMEPOINTSCALE="Hours")

  # Now run the summary method:
  efast_get_overall_medians(getwd(),2,c("A","B"),2,c("Velocity","Displacement"), TIMEPOINTS=c(12,36),TIMEPOINTSCALE="Hours")

  # Now check for existance of results
  expect_true(file.exists(file.path(getwd(),"Curve1_Results_Summary_12.csv")))
  expect_true(file.exists(file.path(getwd(),"Curve2_Results_Summary_12.csv")))
  expect_true(file.exists(file.path(getwd(),"Curve1_Results_Summary_36.csv")))
  expect_true(file.exists(file.path(getwd(),"Curve2_Results_Summary_36.csv")))

  # Test structures:
  result<-read_from_csv(file.path(getwd(),"Curve1_Results_Summary_12.csv"))
  expect_true(nrow(result)==2)
  expect_true(ncol(result)==4)
  expect_false(any(is.na(result)))

  result<-read_from_csv(file.path(getwd(),"Curve2_Results_Summary_12.csv"))
  expect_true(nrow(result)==2)
  expect_true(ncol(result)==4)
  expect_false(any(is.na(result)))

  result<-read_from_csv(file.path(getwd(),"Curve1_Results_Summary_36.csv"))
  expect_true(nrow(result)==2)
  expect_true(ncol(result)==4)
  expect_false(any(is.na(result)))

  result<-read_from_csv(file.path(getwd(),"Curve2_Results_Summary_36.csv"))
  expect_true(nrow(result)==2)
  expect_true(ncol(result)==4)
  expect_false(any(is.na(result)))

  # Cleanup
  cleanup_efast(overTime=TRUE)
  file.remove(file.path(getwd(),"Curve1_Results_Summary_12.csv"))
  file.remove(file.path(getwd(),"Curve2_Results_Summary_12.csv"))
  file.remove(file.path(getwd(),"Curve1_Results_Summary_36.csv"))
  file.remove(file.path(getwd(),"Curve2_Results_Summary_36.csv"))
})

test_that("read_all_curve_results", {

  # Setup:
  setup_efast_result_analysis(overTime=FALSE)
  efast_generate_medians_for_all_parameter_subsets(getwd(), 2, c("A","B"), 2, 2,
                                                   c("Velocity","Displacement"), "Test_eFAST_Result.csv", NULL, 1,
                                                   2)
  # Summary method:
  efast_get_overall_medians(getwd(),2,c("A","B"),2,c("Velocity","Displacement"))

  # Now see if we can read these results in:
  efast_sim_results <- read_all_curve_results(getwd(), GRAPHTIME=NULL, 2,
                                              2,  c("Velocity","Displacement"), c("A","B"))

  # Check the structure - should be a multi-dimensional array
  expect_true(all(dim(efast_sim_results)==c(2,4,2)))
  # Each of the curves should have 2 rows and 4 columns in this case:
  expect_true(nrow(efast_sim_results[,,1])==2)
  expect_true(nrow(efast_sim_results[,,2])==2)
  expect_true(ncol(efast_sim_results[,,1])==4)
  expect_true(ncol(efast_sim_results[,,2])==4)
  expect_false(any(is.na(efast_sim_results[,,1])))
  expect_false(any(is.na(efast_sim_results[,,2])))

  cleanup_efast()
  file.remove(file.path(getwd(),"Curve1_Results_Summary.csv"))
  file.remove(file.path(getwd(),"Curve2_Results_Summary.csv"))

})

test_that("construct_result_filename", {
  expect_equal(construct_result_filename(getwd(), "Test.csv", timepoint=NULL),file.path(getwd(),"Test.csv"))
  expect_equal(construct_result_filename(getwd(), "Test.csv", timepoint=12),file.path(getwd(),"Test_12.csv"))
})

test_that("generate_sensitivity_indices", {
  # Load in the exemplar summaries
  load(file.path("efast_curve1_summary.Rda"))
  load(file.path("efast_curve2_summary.Rda"))
  # write these to file
  write_data_to_csv(efast_curve1_summary,"Curve1_Results_Summary.csv")
  write_data_to_csv(efast_curve2_summary,"Curve2_Results_Summary.csv")
  # Read these in
  efast_sim_results <- read_all_curve_results(
    getwd(), GRAPHTIME=NULL, 2, 65,  c("Velocity","Displacement"),
    c("BindProbability","ChemoThreshold","ChemoUpperLinearAdjust","ChemoLowerLinearAdjust","VCAMProbabilityThreshold","VCAMSlope","Dummy"))

  # Now generate sensitivity indexes
  # omi is floor( ( (wanted_n / NUMCURVES) - 1) / (2 * MI) / length(PARAMETERS)), or 12, MI is 4
  sensitivities <- generate_sensitivity_indices(efast_sim_results, 12, 4,
                                                c("Velocity","Displacement"),
                                                c("BindProbability","ChemoThreshold","ChemoUpperLinearAdjust","ChemoLowerLinearAdjust","VCAMProbabilityThreshold","VCAMSlope","Dummy"), 2)

  # Check structures:
  # Should be a list of 6 elements
  expect_true(length(sensitivities)==8)
  expect_true(ncol(sensitivities$si)==1)
  expect_true(ncol(sensitivities$sti)==1)
  expect_true(nrow(sensitivities$si)==7)
  expect_true(nrow(sensitivities$sti)==7)
  expect_false(any(is.na(sensitivities$sti)))
  expect_false(any(is.na(sensitivities$si)))
  # All should be between 0 and 1
  expect_false(any(sensitivities$si<0))
  expect_false(any(sensitivities$si>1))
  expect_false(any(sensitivities$sti<0))
  expect_false(any(sensitivities$sti>1))

  expect_true(ncol(sensitivities$cv_si_coeffs)==2)
  expect_true(ncol(sensitivities$cv_sti_coeffs)==2)
  expect_true(nrow(sensitivities$cv_si_coeffs)==7)
  expect_true(nrow(sensitivities$cv_sti_coeffs)==7)
  expect_false(any(is.na(sensitivities$cv_si_coeffs)))
  expect_false(any(is.na(sensitivities$cv_sti_coeffs)))
  expect_false(any(sensitivities$cv_sti_coeffs<0))
  expect_false(any(sensitivities$cv_si_coeffs<0))

  expect_true(ncol(sensitivities$errors_si)==2)
  expect_true(ncol(sensitivities$errors_sti)==2)
  expect_true(nrow(sensitivities$errors_si)==7)
  expect_true(nrow(sensitivities$errors_sti)==7)
  expect_false(any(is.na(sensitivities$errors_si)))
  expect_false(any(is.na(sensitivities$errors_sti)))
  expect_false(any(sensitivities$errors_si<0))
  expect_false(any(sensitivities$errors_si>1))
  expect_false(any(sensitivities$errors_sti<0))
  expect_false(any(sensitivities$errors_sti>1))

  file.remove("Curve1_Results_Summary.csv")
  file.remove("Curve2_Results_Summary.csv")

})

test_that("format_efast_result_for_output", {

  # Load in the exemplar summaries
  load(file.path("efast_curve1_summary.Rda"))
  load(file.path("efast_curve2_summary.Rda"))
  # write these to file
  write_data_to_csv(efast_curve1_summary,"Curve1_Results_Summary.csv")
  write_data_to_csv(efast_curve2_summary,"Curve2_Results_Summary.csv")
  # Read these in
  efast_sim_results <- read_all_curve_results(
    getwd(), GRAPHTIME=NULL, 2, 65,  c("Velocity","Displacement"),
    c("BindProbability","ChemoThreshold","ChemoUpperLinearAdjust","ChemoLowerLinearAdjust","VCAMProbabilityThreshold","VCAMSlope","Dummy"))

  # Now generate sensitivity indexes
  # omi is floor( ( (wanted_n / NUMCURVES) - 1) / (2 * MI) / length(PARAMETERS)), or 12, MI is 4
  sensitivities <- generate_sensitivity_indices(efast_sim_results, 8, 4,
                                                c("Velocity","Displacement"),
                                                c("BindProbability","ChemoThreshold","ChemoUpperLinearAdjust","ChemoLowerLinearAdjust","VCAMProbabilityThreshold","VCAMSlope","Dummy"), 2)

  t_tests  <-  efast_ttest(sensitivities$si, sensitivities$range_si, sensitivities$sti, sensitivities$range_sti, 1:2, 7,2,0.95)

  formatted_results <- format_efast_result_for_output(
    sensitivities, t_tests, 1:2, c("Velocity","Displacement"),
    c("BindProbability","ChemoThreshold","ChemoUpperLinearAdjust","ChemoLowerLinearAdjust","VCAMProbabilityThreshold","VCAMSlope","Dummy"))

  # Check structure:
  expect_true(nrow(formatted_results)==7)
  expect_true(ncol(formatted_results)==18)
  # Can check data here to make sure the calculation was right, for an influential and not influential parameter
  expect_equal(toString(sprintf("%.5f",formatted_results[5,])),"0.57879, 0.00583, 0.77713, 0.01522, 0.22287, 0.59946, 5.28405, 0.00245, 0.02904, 0.43465, 0.00414, 0.77066, 0.02590, 0.22934, 5.30798, 5.29939, 0.01634, 0.02883", tolerance=1e-5)
  expect_equal(toString(sprintf("%.5f",formatted_results[1,])),"0.08813, 0.05700, 0.24784, 0.02469, 0.75216, 26.86857, 3.71013, 0.01717, 0.00648, 0.22511, 0.12915, 0.54497, 0.06276, 0.45503, 51.91940, 6.50279, 0.07777, 0.02486", tolerance=1e-5)

  # Cleanup
  file.remove("Curve1_Results_Summary.csv")
  file.remove("Curve2_Results_Summary.csv")

})

test_that("efast_run_Analysis_overTime", {

  # Again we have tested underlying functions, we just need to test for output
  # Load in the exemplar summaries
  load(file.path("efast_curve1_summary.Rda"))
  load(file.path("efast_curve2_summary.Rda"))
  load(file.path("efast_curve1_summary60.Rda"))
  load(file.path("efast_curve2_summary60.Rda"))
  # write these to file
  write_data_to_csv(efast_curve1_summary,"Curve1_Results_Summary_12.csv")
  write_data_to_csv(efast_curve2_summary,"Curve2_Results_Summary_12.csv")
  write_data_to_csv(efast_curve1_summary_60,"Curve1_Results_Summary_60.csv")
  write_data_to_csv(efast_curve2_summary_60,"Curve2_Results_Summary_60.csv")

  efast_run_Analysis(getwd(),c("Velocity","Displacement"),
                     c("BindProbability","ChemoThreshold","ChemoUpperLinearAdjust","ChemoLowerLinearAdjust","VCAMProbabilityThreshold","VCAMSlope","Dummy"),
                     2,65,1:2,0.95,GRAPH_FLAG=TRUE, "efast_summary.csv",TIMEPOINTS=c(12,60))

  expect_true(file.exists(file.path(getwd(),"efast_summary_12.csv")))
  # Read in the result
  result <- read.csv("efast_summary_12.csv",header=T,check.names=F)

  # Can check strucure as we did in test above
  expect_true(nrow(result)==7)
  expect_true(ncol(result)==19)
  # Can check data here to make sure the calculation was right, for an influential and not influential parameter
  expect_equal(toString(sprintf("%.5f",result[5,])),"6.00000, 0.57879, 0.00583, 0.77713, 0.01522, 0.22287, 0.59946, 5.28405, 0.00245, 0.02904, 0.43465, 0.00414, 0.77066, 0.02590, 0.22934, 5.30798, 5.29939, 0.01634, 0.02883", tolerance=1e-5)
  expect_equal(toString(sprintf("%.5f",result[1,])),"1.00000, 0.08813, 0.05700, 0.24784, 0.02469, 0.75216, 26.86857, 3.71013, 0.01717, 0.00648, 0.22511, 0.12915, 0.54497, 0.06276, 0.45503, 51.91940, 6.50279, 0.07777, 0.02486", tolerance=1e-5)

  # Test the plots exist
  expect_true(file.exists(file.path("Displacement12.pdf")))
  expect_true(file.exists(file.path("Velocity12.pdf")))

  # Now for hour 60:
  expect_true(file.exists(file.path(getwd(),"efast_summary_60.csv")))
  # Read in the result
  result <- read_from_csv(file.path(getwd(),"efast_summary_60.csv"))

  # Can check strucure as we did in test above
  expect_true(nrow(result)==7)
  expect_true(ncol(result)==19)
  # Can check data here to make sure the calculation was right, for an influential and not influential parameter
  expect_equal(toString(sprintf("%.5f",result[5,])),"6.00000, 0.85639, 0.04031, 0.92080, 0.00472, 0.07920, 18.02270, 8.23447, 0.10862, 0.05350, 0.33446, 0.14938, 0.40855, 0.13412, 0.59145, 71.27568, 58.21869, 0.20046, 0.19331", tolerance=1e-5)
  expect_equal(toString(sprintf("%.5f",result[1,])),"1.00000, 0.09799, 0.01383, 0.19954, 0.12078, 0.80046, 13.97981, 24.01992, 0.00968, 0.03386, 0.07279, 0.00795, 0.29447, 0.01611, 0.70553, 3.98752, 1.48493, 0.00206, 0.00310",tolerance=1e-5)

  # Test the plots exist
  expect_true(file.exists(file.path("Displacement60.pdf")))
  expect_true(file.exists(file.path("Velocity60.pdf")))

  # Cleanup
  file.remove("Curve1_Results_Summary_12.csv")
  file.remove("Curve2_Results_Summary_12.csv")
  file.remove("Curve1_Results_Summary_60.csv")
  file.remove("Curve2_Results_Summary_60.csv")
  file.remove("efast_summary_12.csv")
  file.remove("efast_summary_60.csv")
  file.remove("Displacement12.pdf")
  file.remove("Displacement60.pdf")
  file.remove("Velocity12.pdf")
  file.remove("Velocity60.pdf")

})

test_that("efast_run_Analysis", {

  # Load in the exemplar summaries
  load("efast_curve1_summary.Rda")
  load("efast_curve2_summary.Rda")
  # write these to file
  write.csv(efast_curve1_summary,file="Curve1_Results_Summary.csv",row.names=F,quote=F)
  write.csv(efast_curve2_summary,file="Curve2_Results_Summary.csv",row.names=F,quote=F)

  # With all internal methods tested, we just need to make sure we are getting CSV and graph output
  efast_run_Analysis(getwd(),c("Velocity","Displacement"),
                     c("BindProbability","ChemoThreshold","ChemoUpperLinearAdjust","ChemoLowerLinearAdjust","VCAMProbabilityThreshold","VCAMSlope","Dummy"),
                     2,65,1:2,0.95,GRAPH_FLAG=TRUE, "efast_summary.csv")

  expect_true(file.exists(file.path("efast_summary.csv")))
  # Read in the result
  result <- read.csv(file.path("efast_summary.csv"),header=T,check.names=F)

  # Can check strucure as we did in test above
  expect_true(nrow(result)==7)
  expect_true(ncol(result)==19)
  # Can check data here to make sure the calculation was right, for an influential and not influential parameter
  #expect_equal(toString(sprintf("%.8f",result[5,])),"6.000000000000000, 0.578785503097756, 0.005826966688968, 0.777133954645919, 0.015216871357387, 0.222866045354081, 0.599460745968321, 5.284051583487950, 0.002453347330475, 0.029039314695841, 0.434647015238436, 0.004137403448815, 0.770658449061400, 0.025898974104577, 0.229341550938600, 5.307976315215720, 5.299390407735170, 0.016342084931543, 0.028828272319620", tolerance=1e-8)
  #expect_equal(toString(sprintf("%.8f",result[1,])),"1.000000000000000, 0.088130856214053, 0.056998122703055, 0.247844101345894, 0.024689078852174, 0.752155898654106, 26.868566676839400, 3.710134571592970, 0.017171952366310, 0.006479791830568, 0.225106348126848, 0.129146980550747, 0.544969237508613, 0.062759858390368, 0.455030762491387, 51.919404170180002, 6.502787609720710, 0.077770730072642, 0.024863517908328", tolerance=1e-8)

  expect_equal(toString(sprintf("%.5f",result[5,])),"6.00000, 0.57879, 0.00583, 0.77713, 0.01522, 0.22287, 0.59946, 5.28405, 0.00245, 0.02904, 0.43465, 0.00414, 0.77066, 0.02590, 0.22934, 5.30798, 5.29939, 0.01634, 0.02883", tolerance=1e-5)
  expect_equal(toString(sprintf("%.5f",result[1,])),"1.00000, 0.08813, 0.05700, 0.24784, 0.02469, 0.75216, 26.86857, 3.71013, 0.01717, 0.00648, 0.22511, 0.12915, 0.54497, 0.06276, 0.45503, 51.91940, 6.50279, 0.07777, 0.02486", tolerance=1e-5)

  # Test the plots exist
  expect_true(file.exists(file.path("Displacement.pdf")))
  expect_true(file.exists(file.path("Velocity.pdf")))

  # Cleanup
  file.remove("Curve1_Results_Summary.csv")
  file.remove("Curve2_Results_Summary.csv")
  file.remove("efast_summary.csv")
  file.remove("Displacement.pdf")
  file.remove("Velocity.pdf")

})

test_that("efast_netlogo_get_overall_medians", {
  expect_warning(efast_netlogo_get_overall_medians(getwd(), 3, c("A"), 2, c("B")),"'efast_netlogo_get_overall_medians' is deprecated");
})

test_that("efast_netlogo_run_Analysis", {
  expect_warning(efast_netlogo_run_Analysis(getwd(), c("A"),c("B","C"), 3, 2, 1:2, 0.95, GRAPH_FLAG=TRUE, "NoResult.csv", TIMEPOINTS=NULL, TIMEPOINTSCALE=NULL));
})

test_that("efast_process_netlogo_result", {

  # Due to package size, netlogo_efast.zip is now online, so needs downloading first
  download.file("http://www.kieranalden.info/spartan/test_data/netlogo_efast.zip","netlogo_efast.zip")

  unzip(file.path(getwd(),"netlogo_efast.zip"))
  params <- rbind(cbind(75.243533999874,20.8659777539209),
                  cbind(72.7819955383356,19.7890546769978))
  write.csv(params,file.path(getwd(),"test_data","Curve1_duration.csv"))
  params <- rbind(cbind(60.9800740342874,17.0678570512324),
                  cbind(58.5185355727489,18.1447801281555))
  write.csv(params,file.path(getwd(),"test_data","Curve1_infectiousness.csv"))

  params <- rbind(cbind(28.9835400518316,13.8958840938643),
                  cbind(26.5220015902932,12.8189610169412))
  write.csv(params,file.path(getwd(),"test_data","Curve2_duration.csv"))
  params <- rbind(cbind(83.0367824074167,32.0177571749888),
                  cbind(80.5752439458783,33.0946802519119))
  write.csv(params,file.path(getwd(),"test_data","Curve2_infectiousness.csv"))
  efast_process_netlogo_result(file.path(getwd(),"test_data"), "efast_result_set", c("infectiousness","duration"), 2,
             2, c("death-thru-sickness","death-but-immune","death-old-age","death-old-and-sick"), "ParamValResponses", 5200)

  expect_true(file.exists(file.path(getwd(),"test_data","Curve1_Parameter1_Results.csv")))
  expect_true(file.exists(file.path(getwd(),"test_data","Curve1_Parameter2_Results.csv")))
  expect_true(file.exists(file.path(getwd(),"test_data","Curve2_Parameter1_Results.csv")))
  expect_true(file.exists(file.path(getwd(),"test_data","Curve2_Parameter2_Results.csv")))

  unlink(file.path(getwd(),"test_data"),recursive = TRUE)
  file.remove(file.path(getwd(),"netlogo_efast.zip"))

})

test_that("ploteFASTSiFromTimepointFiles", {

  # Again we have tested underlying functions, we just need to test for output
  # Load in the exemplar summaries
  load(file.path("efast_curve1_summary.Rda"))
  load(file.path("efast_curve2_summary.Rda"))
  load(file.path("efast_curve1_summary60.Rda"))
  load(file.path("efast_curve2_summary60.Rda"))
  # write these to file
  write_data_to_csv(efast_curve1_summary,"Curve1_Results_Summary_12.csv")
  write_data_to_csv(efast_curve2_summary,"Curve2_Results_Summary_12.csv")
  write_data_to_csv(efast_curve1_summary_60,"Curve1_Results_Summary_60.csv")
  write_data_to_csv(efast_curve2_summary_60,"Curve2_Results_Summary_60.csv")

  efast_run_Analysis(getwd(),c("Velocity","Displacement"),
                     c("BindProbability","ChemoThreshold","ChemoUpperLinearAdjust","ChemoLowerLinearAdjust","VCAMProbabilityThreshold","VCAMSlope","Dummy"),
                     2,65,1:2,0.95,GRAPH_FLAG=TRUE, "efast_summary.csv",TIMEPOINTS=c(12,60))

  ploteFASTSiFromTimepointFiles(getwd(), c("BindProbability","ChemoThreshold","ChemoUpperLinearAdjust","ChemoLowerLinearAdjust","VCAMProbabilityThreshold","VCAMSlope","Dummy"),
                                c("Velocity","Displacement"),
                                "efast_summary.csv", TIMEPOINTS=c(12,60), TIMEPOINTSCALE="Hours")

  expect_true(file.exists(file.path(getwd(),"Displacement_OT.pdf")))
  expect_true(file.exists(file.path(getwd(),"Velocity_OT.pdf")))

  # Cleanup
  file.remove("Curve1_Results_Summary_12.csv")
  file.remove("Curve2_Results_Summary_12.csv")
  file.remove("Curve1_Results_Summary_60.csv")
  file.remove("Curve2_Results_Summary_60.csv")
  file.remove("efast_summary_12.csv")
  file.remove("efast_summary_60.csv")
  file.remove("Displacement12.pdf")
  file.remove("Displacement60.pdf")
  file.remove("Velocity12.pdf")
  file.remove("Velocity60.pdf")
  file.remove(file.path(getwd(),"Displacement_OT.pdf"))
  file.remove(file.path(getwd(),"Velocity_OT.pdf"))
})



