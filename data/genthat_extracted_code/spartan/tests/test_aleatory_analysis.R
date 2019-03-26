library(spartan)
context("Test of Spartan Consistency Analysis")

test_that("read_simulation_results", {

  # Simple function that reads in the simulation results from a CSV or R object
  # The existance of the paths had been checked by pre-execution tests
  # The R object is part of the package



  data("tutorial_consistency_set")
  expect_equal(nrow(read_simulation_results(getwd(), AA_SIM_RESULTS_FILE=NULL,
                                                   tutorial_consistency_set)),9060)
  expect_equal(ncol(read_simulation_results(getwd(), AA_SIM_RESULTS_FILE=NULL,
                                            tutorial_consistency_set)),4)
  # Unfortunately can't test the filepath method on travis, but can locally
  skip_on_travis()
  skip_on_cran()

  #expect_equal(nrow(read_simulation_results("/home/kja505/Dropbox/spartan_web_data/Technique1/AA_Spartan2/CSV_Structure/",
   #                                         AA_SIM_RESULTS_FILE = "AA_SimResponses.csv", AA_SIM_RESULTS_OBJECT = NULL)),9060)
  #expect_equal(ncol(read_simulation_results("/home/kja505/Dropbox/spartan_web_data/Technique1/AA_Spartan2/CSV_Structure/",
  #                                          AA_SIM_RESULTS_FILE = "AA_SimResponses.csv", AA_SIM_RESULTS_OBJECT = NULL)),4)

})

test_that("retrieve_results_for_comparison_result_set", {

  # This should return one set of results, to which everything else is compared
  data("tutorial_consistency_set")
  expect_equal(nrow(retrieve_results_for_comparison_result_set(tutorial_consistency_set,1)),1)
  # Check sample size is 1 and set is 1
  expect_equal(retrieve_results_for_comparison_result_set(tutorial_consistency_set,1)[,1],1)
  expect_equal(retrieve_results_for_comparison_result_set(tutorial_consistency_set,1)[,2],1)
  # Check for sample size of 50
  expect_equal(nrow(retrieve_results_for_comparison_result_set(tutorial_consistency_set,50)),50)
  expect_equal(retrieve_results_for_comparison_result_set(tutorial_consistency_set,50)[1,1],50)
  expect_equal(retrieve_results_for_comparison_result_set(tutorial_consistency_set,50)[1,2],1)

})

test_that("compare_result_sets_to_comparison_set", {

  data("tutorial_consistency_set")
  set1<-retrieve_results_for_comparison_result_set(tutorial_consistency_set,1)
  results <- compare_result_sets_to_comparison_set(20, tutorial_consistency_set, set1, 1, c("Velocity","Displacement"))

  # results should in this case have 19 rows and 6 columns
  expect_equal(nrow(results),19)
  expect_equal(ncol(results),6)
  # Now we can check a few known results
  expect_equal(round(results[6,3][[1]],1),0.0)
  expect_equal(round(results[6,6][[1]],1),1.0)

  # Do the same for sample size of 300
  set300<-retrieve_results_for_comparison_result_set(tutorial_consistency_set,300)
  results <- compare_result_sets_to_comparison_set(20, tutorial_consistency_set, set300, 300, c("Velocity","Displacement"))
  expect_equal(nrow(results),19)
  expect_equal(ncol(results),6)
  # From previous analyses we know that sample size 300 set 4 velocity A-Test was 0.5138565, and displacement 0.5559835
  # Note the rounding to 7 dp to make sure the floating point doesnt cause an issue
  expect_equal(round(results[4,3][[1]],7),0.5138565)
  expect_equal(round(results[4,5][[1]],7),0.5559835)
})

test_that("generate_a_test_score", {

  # Going to give the function some distributions and check the score is calculated correctly
  data("tutorial_consistency_set")
  set1<-retrieve_results_for_comparison_result_set(tutorial_consistency_set,1)
  COMPAREDSET <- subset_results_by_param_value_set(c("SampleSize", "Set"),
                                                   tutorial_consistency_set,
                                                   c(1, 2))

  expect_equal(as.numeric(generate_a_test_score(NULL, set1, COMPAREDSET, c("Velocity","Displacement"))),c(0,1,0,1))

  # Now a different row, for sample 300
  set300<-retrieve_results_for_comparison_result_set(tutorial_consistency_set,300)
  COMPAREDSET <- subset_results_by_param_value_set(c("SampleSize", "Set"),
                                                   tutorial_consistency_set,
                                                   c(300, 18))

  expect_equal(round(as.numeric(generate_a_test_score(NULL, set300, COMPAREDSET, c("Velocity","Displacement"))),7),c(0.5421483,0.5421483,0.5770353,0.5770353))
})

test_that("graph_sample_size_results", {

  # Difficult one to test - going to test that some output is produced
  SET1 <- retrieve_results_for_comparison_result_set(tutorial_consistency_set, 1)

  # Now do the comparisons for all other sets for this sample size
  SIZE_RESULTS <- compare_result_sets_to_comparison_set(
    20, tutorial_consistency_set, SET1, 1, c("Velocity","Displacement"))

  # Plot
  graph_sample_size_results(getwd(), NULL, 1, SIZE_RESULTS,
                            c("Velocity","Displacement"), 0.23)

  expect_true(file.exists(file.path(getwd(),"/1Samples.pdf")))
  file.remove(file.path(getwd(),"/1Samples.pdf"))

  SET300 <- retrieve_results_for_comparison_result_set(tutorial_consistency_set, 1)
  SIZE_RESULTS <- compare_result_sets_to_comparison_set(
    20, tutorial_consistency_set, SET300, 300, c("Velocity","Displacement"))

  # Plot
  graph_sample_size_results(getwd(), NULL, 300, SIZE_RESULTS,
                            c("Velocity","Displacement"), 0.23)

  expect_true(file.exists(file.path(getwd(),"/300Samples.pdf")))
  file.remove(file.path(getwd(),"/300Samples.pdf"))

})

test_that("generate_scores_for_all_sample_sizes", {

  # The above functions are all called within this one, so we just need to make sure this produces some output
  data("tutorial_consistency_set")
  analysis_result <- generate_scores_for_all_sample_sizes(
    getwd(), c(1,50), tutorial_consistency_set, 20, c("Velocity","Displacement"),
    0.23, NULL)

  # Analysis result should have 19 comparisons per set, so 38 rows
  expect_equal(nrow(analysis_result),38)
  expect_equal(ncol(analysis_result),6)
  expect_true(file.exists(file.path(getwd(),"/50Samples.pdf")))
  expect_true(file.exists(file.path(getwd(),"/1Samples.pdf")))

  file.remove(file.path(getwd(),"/1Samples.pdf"))
  file.remove(file.path(getwd(),"/50Samples.pdf"))
})



test_that("read_model_result_file", {

  # Make a result file:
  result <- cbind(4.4,86.5922532761)
  result <- rbind(result, cbind(4.7621290718,37.8444574614))
  result <- rbind(result, cbind(3.5112582903,52.5471704902))
  write.csv(result,file=file.path(getwd(),"Test_Results_CSV_file.csv"),row.names=F,quote=F)
  # Test a result file is read in correctly
  read_result <- read_model_result_file(getwd(), "Test_Results_CSV_file.csv",
                                     outputfilecolstart = 1,
                                     outputfilecolend = 2)

  expect_equal(ncol(read_result),2)
  expect_equal(nrow(read_result),3)

  # What if we just read the second column, calls a different part of the function:
  read_result <- read_model_result_file(getwd(), "Test_Results_CSV_file.csv",
                                        outputfilecolstart = 2,
                                        outputfilecolend = 2)

  expect_equal(ncol(read_result),1)
  expect_equal(nrow(read_result),3)

  file.remove(file.path(getwd(),"Test_Results_CSV_file.csv"))

})

test_that("import_model_result", {

  # Make a result file:
  result <- cbind(4.4,86.5922532761)
  result <- rbind(result, cbind(4.7621290718,37.8444574614))
  result <- rbind(result, cbind(3.5112582903,52.5471704902))
  write.csv(result,file=file.path(getwd(),"Test_Results_CSV_file.csv"),row.names=F,quote=F)

  sim_result <- import_model_result(getwd(), "Test_Results_CSV_file.csv",
                                  altfilename=NULL, outputfilecolstart = 1,
                                  outputfilecolend = 2)

  # Check the structure of the result
  expect_equal(ncol(sim_result),2)
  expect_equal(nrow(sim_result),3)

  # Now what if the result had 0 entries, and we read an alternative:
  result <- data.frame(matrix(vector(), 0, 2,
                                   dimnames=list(c(), c("Velocity", "Displacement"))),
                            stringsAsFactors=F)

  write.csv(result,file=file.path(getwd(),"Test_Results_CSV_file2.csv"),row.names=F,quote=F)
  result <- cbind(4.4,86.5922532761)
  result <- rbind(result, cbind(3.5112582903,52.5471704902))
  write.csv(result,file=file.path(getwd(),"Test_Results_Alternative_file.csv"),row.names=F,quote=F)

  sim_result <- import_model_result(getwd(), "Test_Results_CSV_file2.csv",
                                    "Test_Results_Alternative_file.csv", outputfilecolstart = 1,
                                    outputfilecolend = 2)

  # Sim_result should contain the alternative results
  expect_equal(ncol(sim_result),2)
  expect_equal(nrow(sim_result),2)

  file.remove(file.path(getwd(),"Test_Results_CSV_file2.csv"))
  file.remove(file.path(getwd(),"Test_Results_CSV_file.csv"))
  file.remove(file.path(getwd(),"Test_Results_Alternative_file.csv"))


})

test_that("append_time_to_argument", {
  expect_equal(append_time_to_argument("ResultFile.csv", 12, "csv"),"ResultFile_12.csv")
})

test_that("produce_atest_score_summary", {

  # Read in the exemplar test data
  data("a_test_results")
  allSubset_ATest_Scores<-read_simulation_results(getwd(),NULL,a_test_results)
  # Produce the a-test summary, using the package exemplar data
  atest_summary <- produce_atest_score_summary(
    c(1,5,50,100,300), allSubset_ATest_Scores, c("Velocity","Displacement"))


  # Check the structure
  expect_equal(nrow(atest_summary), 5)
  expect_equal(ncol(atest_summary), 5)

})

test_that("generate_headers_for_atest_file", {
  # Simple test to make sure the headers are generated correctly
  a<-cbind(1,0.9,0.9,0.6,0.6)
  colnames(a)<-generate_headers_for_atest_file(c("Velocity","Displacement"))
  expect_equal(toString(colnames(a)),
  "samplesize, VelocityMaxA, VelocityMedianA, DisplacementMaxA, DisplacementMedianA")
})

test_that("aa_getATestResults", {

  # Overarching call to many of the above methods
  # Inputs are checked, we just need to check CSV is output and the results returned
  data("tutorial_consistency_set")
  scores <- aa_getATestResults(getwd(), c(1,50), 20, c("Velocity","Displacement"),
                               "AA_A_Test_Summary.csv", 0.23,
                               AA_SIM_RESULTS_FILE = NULL,
                               AA_SIM_RESULTS_OBJECT = tutorial_consistency_set,
                               TIMEPOINTS = NULL,
                               TIMEPOINTSCALE = NULL, GRAPHNAME = NULL)

  expect_equal(nrow(scores),38)
  expect_equal(ncol(scores),6)
  expect_true(file.exists(file.path(getwd(),"AA_A_Test_Summary.csv")))
  expect_true(file.exists(file.path(getwd(),"/50Samples.pdf")))
  expect_true(file.exists(file.path(getwd(),"/1Samples.pdf")))

  file.remove(file.path(getwd(),"AA_A_Test_Summary.csv"))
  file.remove(file.path(getwd(),"/1Samples.pdf"))
  file.remove(file.path(getwd(),"/50Samples.pdf"))

  # By file:
  setup_aleatory_analysis_tests()

  aa_summariseReplicateRuns(file.path(getwd(),"AA"), c(1,2), c("Velocity","Displacement"),
                            "trackedCells_Close.csv", ALTFILENAME = NULL,
                            10,11,"AA_Summary.csv",NUMSUBSETSPERSAMPLESIZE=2)

  aa_getATestResults(file.path(getwd(),"AA"), c(1,2), 2, c("Velocity","Displacement"), "ATests.csv", 0.23,
                     AA_SIM_RESULTS_FILE = "AA_Summary.csv", AA_SIM_RESULTS_OBJECT = NULL)

  expect_true(file.exists(file.path(getwd(),"AA","ATests.csv")))
  expect_true(file.exists(file.path(getwd(),"AA","2Samples.pdf")))
  expect_true(file.exists(file.path(getwd(),"AA","1Samples.pdf")))

  unlink(file.path(getwd(),"AA"),recursive = TRUE)

})

test_that("aa_getATestResults_overTime", {

  setup_aleatory_analysis_overTime()

  aa_summariseReplicateRuns(file.path(getwd(),"AA"), c(1,2), c("Velocity","Displacement"),
                            "trackedCells_Close.csv", ALTFILENAME = NULL,
                            10,11,"AA_Summary.csv",NUMSUBSETSPERSAMPLESIZE=2, TIMEPOINTS=c(12,36), TIMEPOINTSCALE="Hours")

  aa_getATestResults(file.path(getwd(),"AA"), c(1,2), 2, c("Velocity","Displacement"), "ATests.csv", 0.23,
                     AA_SIM_RESULTS_FILE = "AA_Summary.csv", AA_SIM_RESULTS_OBJECT = NULL,TIMEPOINTS=c(12,36), TIMEPOINTSCALE="Hours")

  expect_true(file.exists(file.path(getwd(),"AA","ATests_12.csv")))
  expect_true(file.exists(file.path(getwd(),"AA","ATests_36.csv")))
  expect_true(file.exists(file.path(getwd(),"AA","2Samples_12.pdf")))
  expect_true(file.exists(file.path(getwd(),"AA","1Samples_12.pdf")))
  expect_true(file.exists(file.path(getwd(),"AA","2Samples_36.pdf")))
  expect_true(file.exists(file.path(getwd(),"AA","1Samples_36.pdf")))

  unlink(file.path(getwd(),"AA"),recursive = TRUE)

})

test_that("aa_summariseReplicateRuns", {

  setup_aleatory_analysis_tests()

  aa_summariseReplicateRuns(file.path(getwd(),"AA"), c(1,2), c("Velocity","Displacement"),
                            "trackedCells_Close.csv", ALTFILENAME = NULL,
                            10,11,"AA_Summary.csv",NUMSUBSETSPERSAMPLESIZE=2)

  expect_true(file.exists(file.path(getwd(),"AA","AA_Summary.csv")))
  # Check structure
  result<-read_from_csv(file.path(getwd(),"AA","AA_Summary.csv"))
  expect_true(ncol(result)==4)
  expect_true(nrow(result)==6)
  expect_true(nrow(subset(result, result$SampleSize==1))==2)
  expect_true(nrow(subset(result, result$SampleSize==2))==4)
  expect_false(any(is.na(result)))

  unlink(file.path(getwd(),"AA"),recursive=TRUE)
})

test_that("aa_summariseReplicateRuns_overTime", {

  setup_aleatory_analysis_overTime()

  aa_summariseReplicateRuns(file.path(getwd(),"AA"), c(1,2), c("Velocity","Displacement"),
                            "trackedCells_Close.csv", ALTFILENAME = NULL,
                            10,11,"AA_Summary.csv",NUMSUBSETSPERSAMPLESIZE=2,TIMEPOINTS=c(12,36),
                            TIMEPOINTSCALE="Hours")

  expect_true(file.exists(file.path(getwd(),"AA","AA_Summary_12.csv")))
  # Check structure
  result<-read_from_csv(file.path(getwd(),"AA","AA_Summary_12.csv"))
  expect_true(ncol(result)==4)
  expect_true(nrow(result)==6)
  expect_true(nrow(subset(result, result$SampleSize==1))==2)
  expect_true(nrow(subset(result, result$SampleSize==2))==4)
  expect_false(any(is.na(result)))

  expect_true(file.exists(file.path(getwd(),"AA","AA_Summary_36.csv")))
  # Check structure
  result<-read_from_csv(file.path(getwd(),"AA","AA_Summary_36.csv"))
  expect_true(ncol(result)==4)
  expect_true(nrow(result)==6)
  expect_true(nrow(subset(result, result$SampleSize==1))==2)
  expect_true(nrow(subset(result, result$SampleSize==2))==4)
  expect_false(any(is.na(result)))

  unlink(file.path(getwd(),"AA"),recursive=TRUE)



})

test_that("aa_sampleSizeSummary", {

    # File:
    setup_aleatory_analysis_tests()

    aa_summariseReplicateRuns(file.path(getwd(),"AA"), c(1,2), c("Velocity","Displacement"),
                            "trackedCells_Close.csv", ALTFILENAME = NULL,
                            10,11,"AA_Summary.csv",NUMSUBSETSPERSAMPLESIZE=2)

    scores <- aa_getATestResults(file.path(getwd(),"AA"), c(1,2), 2, c("Velocity","Displacement"),
                                 "AA_A_Test_Summary.csv", 0.23,
                                 AA_SIM_RESULTS_FILE = "AA_Summary.csv",
                                 AA_SIM_RESULTS_OBJECT = NULL,
                                 TIMEPOINTS = NULL,
                                 TIMEPOINTSCALE = NULL, GRAPHNAME = NULL)

    aa_sampleSizeSummary(file.path(getwd(),"AA"), c(1,2), c("Velocity","Displacement"), "Sample_Summary.csv", ATESTRESULTS_FILE = "AA_A_Test_Summary.csv",
                                     ATESTRESULTS_OBJECT = NULL, TIMEPOINTS = NULL, TIMEPOINTSCALE = NULL)

    expect_true(file.exists(file.path(getwd(),"AA","Sample_Summary.csv")))

    # Check structure:
    result<-read_from_csv(file.path(getwd(),"AA","Sample_Summary.csv"))
    expect_true(nrow(result)==2)
    expect_true(ncol(result)==5)
    expect_false(any(is.na(result)))

    unlink(file.path(getwd(),"AA"),recursive=TRUE)

    # Object
    dir.create(file.path(getwd(),"AA"))
    data("tutorial_consistency_set")
    scores <- aa_getATestResults(file.path(getwd(),"AA"), c(1,2), 2, c("Velocity","Displacement"),
                                 "AA_A_Test_Summary.csv", 0.23,
                                 AA_SIM_RESULTS_FILE = NULL,
                                 AA_SIM_RESULTS_OBJECT = tutorial_consistency_set,
                                 TIMEPOINTS = NULL,
                                 TIMEPOINTSCALE = NULL, GRAPHNAME = NULL)

    aa_sampleSizeSummary(file.path(getwd(),"AA"), c(1,2), c("Velocity","Displacement"), "Sample_Summary.csv", ATESTRESULTS_FILE = NULL,
                         ATESTRESULTS_OBJECT = scores, TIMEPOINTS = NULL, TIMEPOINTSCALE = NULL)

    expect_true(file.exists(file.path(getwd(),"AA","Sample_Summary.csv")))

    # Check structure:
    result<-read_from_csv(file.path(getwd(),"AA","Sample_Summary.csv"))
    expect_true(nrow(result)==2)
    expect_true(ncol(result)==5)
    expect_false(any(is.na(result)))

    unlink(file.path(getwd(),"AA"),recursive=TRUE)
})

test_that("aa_sampleSizeSummary_overTime", {

  # By File:
  setup_aleatory_analysis_overTime()

  aa_summariseReplicateRuns(file.path(getwd(),"AA"), c(1,2), c("Velocity","Displacement"),
                            "trackedCells_Close.csv", ALTFILENAME = NULL,
                            10,11,"AA_Summary.csv",NUMSUBSETSPERSAMPLESIZE=2,TIMEPOINTS=c(12,36),
                            TIMEPOINTSCALE="Hours")

  scores <- aa_getATestResults(file.path(getwd(),"AA"), c(1,2), 2, c("Velocity","Displacement"),
                               "AA_A_Test_Summary.csv", 0.23,
                               AA_SIM_RESULTS_FILE = "AA_Summary.csv",
                               AA_SIM_RESULTS_OBJECT = NULL,
                               TIMEPOINTS = c(12,36),
                               TIMEPOINTSCALE = "Hours")

  aa_sampleSizeSummary(file.path(getwd(),"AA"), c(1,2), c("Velocity","Displacement"), "Sample_Summary.csv", ATESTRESULTS_FILE = "AA_A_Test_Summary.csv",
                       ATESTRESULTS_OBJECT = NULL, TIMEPOINTS = c(12,36), TIMEPOINTSCALE = "Hours")

  expect_true(file.exists(file.path(getwd(),"AA","Sample_Summary_12.csv")))

  # Check structure:
  result<-read_from_csv(file.path(getwd(),"AA","Sample_Summary_12.csv"))
  expect_true(nrow(result)==2)
  expect_true(ncol(result)==5)
  expect_false(any(is.na(result)))

  result<-read_from_csv(file.path(getwd(),"AA","Sample_Summary_36.csv"))
  expect_true(nrow(result)==2)
  expect_true(ncol(result)==5)
  expect_false(any(is.na(result)))

  unlink(file.path(getwd(),"AA"),recursive=TRUE)

  # By Object isn't available yet

})

test_that("get_medians_for_size_subsets", {

  setup_aleatory_analysis_tests()

  subset_medians <- get_medians_for_size_subsets(file.path(getwd(),"AA"), 2,
                                           1, c("Velocity","Displacement"), "trackedCells_Close.csv",
                                           ALTFILENAME=NULL, 10, 11)

  expect_true(nrow(subset_medians)==2)
  expect_true(ncol(subset_medians)==4)
  expect_false(any(is.na(subset_medians)))

  unlink(file.path(getwd(),"AA"),recursive=TRUE)
})

test_that("aa_graphSampleSizeSummary", {

  setup_aleatory_analysis_tests()

  aa_summariseReplicateRuns(file.path(getwd(),"AA"), c(1,2), c("Velocity","Displacement"),
                            "trackedCells_Close.csv", ALTFILENAME = NULL,
                            10,11,"AA_Summary.csv",NUMSUBSETSPERSAMPLESIZE=2)

  scores <- aa_getATestResults(file.path(getwd(),"AA"), c(1,2), 2, c("Velocity","Displacement"),
                               "AA_A_Test_Summary.csv", 0.23,
                               AA_SIM_RESULTS_FILE = "AA_Summary.csv",
                               AA_SIM_RESULTS_OBJECT = NULL,
                               TIMEPOINTS = NULL,
                               TIMEPOINTSCALE = NULL, GRAPHNAME = NULL)

  results <- aa_sampleSizeSummary(file.path(getwd(),"AA"), c(1,2), c("Velocity","Displacement"), "Sample_Summary.csv", ATESTRESULTS_FILE = "AA_A_Test_Summary.csv",
                       ATESTRESULTS_OBJECT = NULL, TIMEPOINTS = NULL, TIMEPOINTSCALE = NULL)

  aa_graphSampleSizeSummary(file.path(getwd(),"AA"), c("Velocity","Displacement"), 2, 0.56,
                                        0.66, 0.73, "AA_ATestMaxes.pdf",
                                        SAMPLESUMMARY_OBJECT = NULL,
                                        SAMPLESUMMARY_FILE = "Sample_Summary.csv")

  expect_true(file.exists(file.path(getwd(),"AA","AA_ATestMaxes.pdf")))
  expect_message(aa_graphSampleSizeSummary(file.path(getwd(),"AA"), c("Velocity","Displacement"), 2, 0.56,
                                        0.66, 0.73, "AA_ATestMaxes.pdf",
                                        SAMPLESUMMARY_OBJECT = NULL,
                                        SAMPLESUMMARY_FILE = "Sample_Summary_Wrong.csv"), "Specified A-Test Summary File does not exist")

  # By object:
  aa_graphSampleSizeSummary(file.path(getwd(),"AA"), c("Velocity","Displacement"), 2, 0.56,
                            0.66, 0.73, "AA_ATestMaxes.pdf",
                            SAMPLESUMMARY_OBJECT = results,
                            SAMPLESUMMARY_FILE = NULL)

  expect_true(file.exists(file.path(getwd(),"AA","AA_ATestMaxes.pdf")))

  unlink(file.path(getwd(),"AA"),recursive=TRUE)

  # Timepoints:
  setup_aleatory_analysis_overTime()

  aa_summariseReplicateRuns(file.path(getwd(),"AA"), c(1,2), c("Velocity","Displacement"),
                            "trackedCells_Close.csv", ALTFILENAME = NULL,
                            10,11,"AA_Summary.csv",NUMSUBSETSPERSAMPLESIZE=2,TIMEPOINTS=c(12,36),
                            TIMEPOINTSCALE="Hours")

  scores <- aa_getATestResults(file.path(getwd(),"AA"), c(1,2), 2, c("Velocity","Displacement"),
                               "AA_A_Test_Summary.csv", 0.23,
                               AA_SIM_RESULTS_FILE = "AA_Summary.csv",
                               AA_SIM_RESULTS_OBJECT = NULL,
                               TIMEPOINTS = c(12,36),
                               TIMEPOINTSCALE = "Hours")

  results <- aa_sampleSizeSummary(file.path(getwd(),"AA"), c(1,2), c("Velocity","Displacement"), "Sample_Summary.csv", ATESTRESULTS_FILE = "AA_A_Test_Summary.csv",
                       ATESTRESULTS_OBJECT = NULL, TIMEPOINTS = c(12,36), TIMEPOINTSCALE = "Hours")

  aa_graphSampleSizeSummary(file.path(getwd(),"AA"), c("Velocity","Displacement"), 2, 0.56,
                            0.66, 0.73, "AA_ATestMaxes.pdf",
                            SAMPLESUMMARY_OBJECT = NULL,
                            SAMPLESUMMARY_FILE = "Sample_Summary.csv",TIMEPOINTS=c(12,36), TIMEPOINTSCALE="Hours")

  expect_true(file.exists(file.path(getwd(),"AA","AA_ATestMaxes_12.pdf")))
  expect_true(file.exists(file.path(getwd(),"AA","AA_ATestMaxes_36.pdf")))
  unlink(file.path(getwd(),"AA"),recursive=TRUE)
})

