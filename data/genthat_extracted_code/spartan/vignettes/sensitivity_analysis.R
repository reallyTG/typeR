## ---- eval = FALSE-------------------------------------------------------
#  # Firstly, import the package
#  library(spartan)
#  # Directory where the example simulation results for this technique were extracted
#  # (i.e. the results downloaded from the website)
#  FILEPATH <- "/home/user/AA"
#  # Sample sizes (number of simulation replicates in each distribution) to be analysed
#  SAMPLESIZES <- c(1, 5, 50, 100, 300)
#  # The simulation output measures to be analysed
#  MEASURES <- c("Velocity", "Displacement")
#  # Number of distributions being compared. Default: 20, as performed by Read et al
#  NUMSUBSETSPERSAMPLESIZE <- 20
#  # Output file name containing the simulation responses.
#  RESULTFILENAME <- "trackedCells_Close.csv"
#  # Not used in this case. Useful where two result files exist (e.g.\ if tracking cells
#  # close and those further away, two output files could be used). Here, results in a
#  # second file are processed if the first is blank or does not exist. Defaults to NULL
#  # if not specified
#  ALTFILENAME <- NULL
#  # Notes the column in the CSV results file where the results start.
#  # Useful as it restricts what is read in to R, getting round potential errors where
#  # the first column contains a label
#  OUTPUTFILECOLSTART <- 10
#  # Last column of the output measure results
#  OUTPUTFILECOLEND <- 11
#  # Use this if simulation results are in CSV format.
#  # Last column of the output measure results
#  OUTPUTFILECOLEND <- 11
#  # File either A: created by method 1 of this technique, containing the median of each
#  # output measure of each simulation run in that subset, or B: The name of the provided
#  # single CSV file containing the simulation responses. So if you are using the CSV
#  # structured tutorial data, this fill be the name of that CSV file.
#  MEDIANS_SUMMARY_FILE_NAME <- "AA_SimResponses.csv"
#  # The results of the A-Test comparisons of the twenty subsets for each sample size
#  # are stored within an output file. This parameter sets the name of this file.
#  # Note no file extension. Current versions of spartan output to CSV files
#  ATESTRESULTSFILENAME <- "AA_ATest_Scores.csv"
#  # A summary file is created containing the maximum and median
#  # A-Test values for each sample size. This parameter sets the name of this file.
#  SUMMARYFILENAME <- "AA_ATestMaxAndMedians.csv"
#  # The A-Test value either side of 0.5 which should be considered a 'large difference'
#  # between two sets of results. Use of 0.23 was taken from the Vargha-Delaney
#  # publication but can be adjusted here as necessary.
#  LARGEDIFFINDICATOR <- 0.23
#  # A-Test values above 0.5 (no difference) which should be considered as small,
#  # medium, and large differences between two result sets. Used in the graph
#  # summarising all sample sizes.
#  SMALL <- 0.56
#  MEDIUM <- 0.66
#  LARGE <- 0.73
#  # Name of the graph which summarises the analysis results for all sample sizes.
#  # Current versions of spartan output to pdf.
#  GRAPHOUTPUTFILE <- "AA_ATestMaxes.pdf"

## ---- eval = FALSE-------------------------------------------------------
#  aa_summariseReplicateRuns(FILEPATH, SAMPLESIZES, MEASURES, RESULTFILENAME, ALTFILENAME, OUTPUTFILECOLSTART, OUTPUTFILECOLEND, MEDIANS_SUMMARY_FILE_NAME)
#  # For timepoints:
#  aa_summariseReplicateRuns(FILEPATH, SAMPLESIZES, MEASURES, RESULTFILENAME, ALTFILENAME, OUTPUTFILECOLSTART, OUTPUTFILECOLEND, MEDIANS_SUMMARY_FILE_NAME,
#                            TIMEPOINTS=c(12,36,48,60),TIMEPOINTSCALE="Hours")

## ---- eval = FALSE-------------------------------------------------------
#  # To read from an R object
#  data("tutorial_consistency_set")
#  a_test_results <- aa_getATestResults(FILEPATH, SAMPLESIZES, NUMSUBSETSPERSAMPLESIZE, MEASURES, ATESTRESULTSFILENAME, LARGEDIFFINDICATOR, AA_SIM_RESULTS_OBJECT = tutorial_consistency_set)
#  # Or to read from a file (an example can be downloaded from the website)
#  a_test_results <- aa_getATestResults(FILEPATH, SAMPLESIZES, NUMSUBSETSPERSAMPLESIZE, MEASURES, ATESTRESULTSFILENAME, LARGEDIFFINDICATOR, AA_SIM_RESULTS_FILE = MEDIANS_SUMMARY_FILE_NAME)
#  
#  # For a number of timepoints:
#  a_test_results <- aa_getATestResults(FILEPATH, SAMPLESIZES, NUMSUBSETSPERSAMPLESIZE, MEASURES, ATESTRESULTSFILENAME, LARGEDIFFINDICATOR, AA_SIM_RESULTS_FILE = MEDIANS_SUMMARY_FILE_NAME,
#                                       TIMEPOINTS=c(12,36,48,60),TIMEPOINTSCALE="Hours")

## ---- eval = FALSE-------------------------------------------------------
#  # Similarly to the previous function, from 3.0 you can supply the name of the CSV file containing the a test results (produced by above),
#  # or the name of the object. For the latter:
#  sample_summary <- aa_sampleSizeSummary(FILEPATH, SAMPLESIZES, MEASURES, SUMMARYFILENAME, ATESTRESULTS_OBJECT = a_test_results)
#  # Or by file name (make sure ATESTRESULTSFILENAME is declared)
#  sample_summary <- aa_sampleSizeSummary(FILEPATH, SAMPLESIZES, MEASURES, SUMMARYFILENAME, ATESTRESULTS_FILE = ATESTRESULTSFILENAME)
#  # For timepoints:
#  sample_summary <- aa_sampleSizeSummary(FILEPATH, SAMPLESIZES, MEASURES, SUMMARYFILENAME, ATESTRESULTS_FILE = ATESTRESULTSFILENAME,
#                                         TIMEPOINTS=c(12,36,48,60),TIMEPOINTSCALE="Hours")
#  
#  # Graphs, by the sample_summary object:
#  aa_graphSampleSizeSummary(FILEPATH, MEASURES, 300, SMALL, MEDIUM, LARGE, GRAPHOUTPUTFILE, SAMPLESUMMARY_OBJECT = sample_summary)
#  # By the CSV file that method produces:
#  aa_graphSampleSizeSummary(FILEPATH, MEASURES, 300, SMALL, MEDIUM, LARGE, GRAPHOUTPUTFILE, SAMPLESUMMARY_FILE = SUMMARYFILENAME)
#  # For multiple timepoints:
#  aa_graphSampleSizeSummary(FILEPATH, MEASURES, 300, SMALL, MEDIUM, LARGE, GRAPHOUTPUTFILE, SAMPLESUMMARY_FILE = SUMMARYFILENAME,
#                            TIMEPOINTS=c(12,36,48,60),TIMEPOINTSCALE="Hours")

## ---- eval = FALSE-------------------------------------------------------
#  # Import the package
#  library(spartan)
#  # Set a folder where the parameter value samples should be output to
#  FILEPATH <- "/home/user/OAT/Sampling"
#  # Set the names of the parameters for which values are being generated for
#  PARAMETERS <- c("thresholdBindProbability", "chemoThreshold",
#  "chemoUpperLinearAdjust", "chemoLowerLinearAdjust",
#  "maxVCAMeffectProbabilityCutoff", "vcamSlope")
#  # The calibrated values, or baseline values, of each stated parameter
#  BASELINE <- c(50, 0.3, 0.2, 0.04, 0.60, 1.0)
#  # Parameter Value Information
#  # You can specify this in two ways:
#  # 1. The minimum and maximum of each parameter, and increment over which
#  # sampling should be increased.
#  # 2. A string list of values that parameter should be assigned in sampling
#  # Example of 1:
#  PMIN <- c(0, 0.10, 0.10, 0.015, 0.1, 0.25)
#  PMAX <- c(100, 0.9, 0.50, 0.08, 1.0, 5.0)
#  PINC <- c(10, 0.1, 0.05, 0.005, 0.05, 0.25)
#  PARAMVALS <- NULL
#  # Example of 2:
#  #PARAMVALS <- c("0, 50, 90","0.10, 0.3, 0.8","0.10, 0.25, 0.4",
#  #"0.015, 0.04, 0.08", "0.1, 0.5, 0.9","0.25, 1.25, 2.0, 3.0, 5.0")
#  # If using method 1, PARAMVALS must be set to NULL. If using method 2, PMIN,
#  # PMAX, and PINC must be set to NULL
#  oat_parameter_sampling(FILEPATH, PARAMETERS, BASELINE, PMIN, PMAX,
#  PINC, PARAMVALS)

## ---- eval=FALSE---------------------------------------------------------
#  library(spartan)
#  # Folder containing the example simulation results. Make sure the folder is unzipped
#  FILEPATH <- "/home/user/OAT/Results"
#  # Array of the parameters to be analysed.
#  # Note only two of the six here for download size reasons
#  PARAMETERS <- c("chemoLowerLinearAdjust", "chemoUpperLinearAdjust")
#  # Similar to the sampling function discussed above, there are two ways to specify
#  # parameter value information in the analysis. Ensure you are using the appropriate
#  # method, setting these to NULL if using the alternative (see comments in sampling
#  # function description).
#  # Method 1:
#  PMIN <- c(0.015, 0.10)
#  PMAX <- c(0.08, 0.50)
#  PINC <- c(0.005, 0.05)
#  PARAMVALS<-NULL
#  # Method 2:
#  #PARAMVALS <- c("0.015, 0.02, 0.025, 0.03, 0.035, 0.04, 0.045, 0.05, 0.055, 0.06,
#  # 0.065, 0.07,0.075, 0.08", "0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5")
#  #PMIN <- NULL; PMAX <- NULL; PINC <- NULL
#  BASELINE <- c(0.04, 0.2)
#  MEASURES <- c("Velocity", "Displacement")
#  # What each measure represents. Used in graphing results
#  MEASURE_SCALE <- c("microns/min", "microns")
#  RESULTFILENAME <- "trackedCells_Close.csv"
#  OUTPUTCOLSTART <- 10
#  OUTPUTCOLEND <- 11
#  ALTERNATIVEFILENAME <- NULL
#  # Either 1: The name of the CSV file containing all simulation output (see description
#  # that follows in this section) or name to give the summary file that spartan generates
#  CSV_FILE_NAME <- "OAT_Medians.csv"
#  # Number of replicate runs performed for each parameter value set
#  NUMRUNSPERSAMPLE <- 300
#  # The results of the A-Test comparisons of each parameter value against that of the
#  # parameters baseline value are output as a file. This sets the name of this file.
#  # Current versions of spartan output this to a CSV file
#  ATESTRESULTSFILENAME <- "EgSet_ATests.csv"
#  # A-Test result value either side of 0.5 at which the difference between two sets of
#  # results is significant
#  ATESTSIGLEVEL <- 0.23

## ---- eval = FALSE-------------------------------------------------------
#  oat_processParamSubsets(FILEPATH, PARAMETERS, NUMRUNSPERSAMPLE, MEASURES,RESULTFILENAME, ALTERNATIVEFILENAME, OUTPUTCOLSTART, OUTPUTCOLEND,CSV_FILE_NAME,
#                          BASELINE, PMIN, PMAX, PINC, PARAMVALS)
#  # For multiple timepoints:
#  oat_processParamSubsets(FILEPATH, PARAMETERS, NUMRUNSPERSAMPLE, MEASURES,RESULTFILENAME, ALTERNATIVEFILENAME, OUTPUTCOLSTART, OUTPUTCOLEND,CSV_FILE_NAME,
#                          BASELINE, PMIN, PMAX, PINC, PARAMVALS, TIMEPOINTS=c(12,36,48,60), TIMEPOINTSCALE="Hours")

## ---- eval = FALSE-------------------------------------------------------
#  oat_csv_result_file_analysis(FILEPATH, CSV_FILE_NAME, PARAMETERS, BASELINE, MEASURES, ATESTRESULTSFILENAME, PMIN, PMAX, PINC, PARAMVALS)
#  # For multiple timepoints
#  oat_csv_result_file_analysis(FILEPATH, CSV_FILE_NAME, PARAMETERS, BASELINE, MEASURES, ATESTRESULTSFILENAME, PMIN, PMAX, PINC, PARAMVALS,
#                               TIMEPOINTS=c(12,36,48,60), TIMEPOINTSCALE="Hours")

## ---- eval = FALSE-------------------------------------------------------
#  oat_graphATestsForSampleSize(FILEPATH, PARAMETERS, MEASURES, ATESTSIGLEVEL, ATESTRESULTSFILENAME, BASELINE, PMIN, PMAX, PINC, PARAMVALS)
#  # For multiple timepoints:
#  oat_graphATestsForSampleSize(FILEPATH, PARAMETERS, MEASURES, ATESTSIGLEVEL, ATESTRESULTSFILENAME, BASELINE, PMIN, PMAX, PINC, PARAMVALS,
#                               TIMEPOINTS=c(12,36,48,60), TIMEPOINTSCALE="Hours")

## ---- eval = FALSE-------------------------------------------------------
#  oat_plotResultDistribution(FILEPATH, PARAMETERS, MEASURES, MEASURE_SCALE, CSV_FILE_NAME, BASELINE, PMIN, PMAX, PINC, PARAMVALS)
#  # For multiple timepoints:
#  oat_plotResultDistribution(FILEPATH, PARAMETERS, MEASURES, MEASURE_SCALE, CSV_FILE_NAME, BASELINE, PMIN, PMAX, PINC, PARAMVALS,
#                             TIMEPOINTS=c(12,36,48,60), TIMEPOINTSCALE="Hours")

## ---- eval = FALSE-------------------------------------------------------
#  library(spartan)
#  # Folder containing the example simulation results. Make sure the folder is unzipped
#  FILEPATH <- "/home/user/LHC/LHC_Results"
#  PARAMETERS <- c("thresholdBindProbability", "chemoThreshold", "chemoUpperLinearAdjust",
#  "chemoLowerLinearAdjust", "maxVCAMeffectProbabilityCutoff", "vcamSlope")
#  MEASURES <- c("Velocity", "Displacement")
#  MEASURE_SCALE <- c("microns/min", "microns")
#  # Number of parameter value sets created in latin-hypercube sampling
#  NUMSAMPLES <- 500
#  # Number of simulation runs performed for each parameter value set
#  NUMRUNSPERSAMPLE <- 300
#  RESULTSFILENAME <- "trackedCells_Close.csv"
#  ALTERNATIVEFILENAME <- NULL
#  OUTPUTCOLSTART <- 10
#  OUTPUTCOLEND <- 11
#  # This is either 1: The name of the single CSV file that summarises all simulation runs
#  # of all parameter sets generated by the hypercube (using input format 2), or the name
#  # to assign this file when spartan produces it from simulation results (using input
#  # format 1).
#  LHC_ALL_SIM_RESULTS_FILE <- "LHC_AllResults.csv"
#  # Location of a file containing the parameter value sets generated by the hypercube
#  # sampling (i.e. the file generated in the previous function of this paper). However
#  # if providing a CSV file with all results, you do not need to provide this
#  LHC_PARAM_CSV_LOCATION <- "Tutorial_Parameters_for_Runs.csv"
#  # spartan produces a summary file showing the parameter value sets alongside the
#  # median results for each simulation output measure. This names this file.
#  # Note no file extension
#  LHCSUMMARYFILENAME <- "LHC_Summary.csv"
#  # File name to give to the file showing the Partial Rank Correlation Coefficients
#  # for each parameter.
#  CORCOEFFSOUTPUTFILE <- "LHC_corCoeffs.csv"
#  TIMEPOINTS<-NULL
#  TIMEPOINTSCALE<-NULL

## ---- eval = FALSE-------------------------------------------------------
#  lhc_process_sample_run_subsets(FILEPATH, LHC_PARAM_CSV_LOCATION, PARAMETERS, NUMSAMPLES, NUMRUNSPERSAMPLE, MEASURES, RESULTFILENAME, ALTERNATIVEFILENAME,
#                                 OUTPUTCOLSTART, OUTPUTCOLEND, LHC_ALL_SIM_RESULTS_FILE)
#  # For multiple timepoints:
#  lhc_process_sample_run_subsets(FILEPATH, LHC_PARAM_CSV_LOCATION, PARAMETERS, NUMSAMPLES, NUMRUNSPERSAMPLE, MEASURES, RESULTFILENAME, ALTERNATIVEFILENAME,
#                                 OUTPUTCOLSTART, OUTPUTCOLEND, LHC_ALL_SIM_RESULTS_FILE, TIMEPOINTS=c(12,36,48,60), TIMEPOINTSCALE="Hours")

## ---- eval=FALSE---------------------------------------------------------
#  lhc_generateLHCSummary(FILEPATH, PARAMETERS, MEASURES, LHC_ALL_SIM_RESULTS_FILE, LHCSUMMARYFILENAME, LHC_PARAM_CSV_LOCATION)
#  # For multiple timepoints:
#  lhc_generateLHCSummary(FILEPATH, PARAMETERS, MEASURES, LHC_ALL_SIM_RESULTS_FILE, LHCSUMMARYFILENAME, LHC_PARAM_CSV_LOCATION, TIMEPOINTS=c(12,36,48,60), TIMEPOINTSCALE="Hours")

## ---- eval=FALSE---------------------------------------------------------
#  lhc_generatePRCoEffs(FILEPATH, PARAMETERS, MEASURES, LHCSUMMARYFILENAME, CORCOEFFSOUTPUTFILE, TIMEPOINTS, TIMEPOINTSCALE)
#  # Depending on your application, you can change the method by which the PRCC is calculated, from the default Spearmans (s),
#  # to Kendall (k) or Pearsons (p), as below:
#  lhc_generatePRCoEffs(FILEPATH, PARAMETERS, MEASURES, LHCSUMMARYFILENAME, CORCOEFFSOUTPUTFILE, TIMEPOINTS, TIMEPOINTSCALE, cor_calc_method=c("p"))
#  
#  # Graphing:
#  lhc_graphMeasuresForParameterChange(FILEPATH, PARAMETERS, MEASURES, MEASURE_SCALE, CORCOEFFSOUTPUTFILE, LHCSUMMARYFILENAME)
#  
#  # Note that from Spartan 3 you can choose the output format of this graph, by:
#  lhc_graphMeasuresForParameterChange(FILEPATH, PARAMETERS, MEASURES, MEASURE_SCALE, CORCOEFFSOUTPUTFILE, LHCSUMMARYFILENAME,
#                                      OUTPUT_TYPE = c("PDF","PNG","BMP","TIFF"))
#  
#  # For multiple timepoints, add them onto end of call as done previously, i.e. TIMEPOINTS=c(12,36,48,60), TIMEPOINTSCALE="Hours"

## ----eval = FALSE--------------------------------------------------------
#  # Import the package
#  library(spartan)
#  # The folder where the parameter samples should be output to
#  FILEPATH <- "/home/user/eFAST/"
#  # Number of resample curves (phase shifts) to use in the sampling procedure
#  NUMCURVES <- 3
#  # Names of the parameters to generate parameter value samples for.
#  PARAMETERS <- c("BindProbability", "ChemoThreshold", "ChemoUpperLinearAdjust",
#  "ChemoLowerLinearAdjust", "VCAMProbabilityThreshold", "VCAMSlope", "Dummy")
#  # The number of parameter sample sets to create for each curve
#  NUMSAMPLES <- 65
#  PMIN <- c(0, 0.10, 0.10, 0.015, 0.1, 0.25, 1)
#  # The maximum value in the range for each parameter
#  PMAX <- c(100, 0.9, 0.50, 0.08, 1.0, 5.0, 10)
#  efast_generate_sample(FILEPATH, NUMCURVES, NUMSAMPLES, PARAMETERS, PMIN, PMAX)

## ----eval = FALSE--------------------------------------------------------
#  library(spartan)
#  library(gplots)
#  # Folder containing the eFAST simulation results. Make sure example data is unzipped
#  FILEPATH <- "/home/user/eFAST/Results"
#  PARAMETERS <- c("BindProbability", "ChemoThreshold", "ChemoUpperLinearAdjust",
#  "ChemoLowerLinearAdjust", "VCAMProbabilityThreshold", "VCAMSlope", "Dummy")
#  MEASURES <- c("Velocity", "Displacement")
#  RESULTFILENAME <- "trackedCells_Close.csv"
#  ALTERNATIVEFILENAME <- NULL
#  OUTPUTCOLSTART <- 10
#  OUTPUTCOLEND <- 11
#  # Number of resample curves employed when the parameter space was sampled
#  NUMCURVES <- 3
#  # The number of parameter sample sets taken from each curve
#  NUMSAMPLES <- 65
#  # Number of simulation runs performed for each parameter value set
#  NUMRUNSPERSAMPLE <- 300
#  # Which of the output measures to T-Test for significance
#  OUTPUTMEASURES_TO_TTEST <- 1:2
#  # T-Test confidence level
#  TTEST_CONF_INT <- 0.95
#  # Name of the final result file for this analysis, showing the partitioning of
#  # the variance between input parameters
#  EFASTRESULTFILENAME <- "EgSet_eFAST_Analysis.csv"
#  # Boolean to note whether summary graphs should be produced
#  GRAPH_FLAG <- TRUE

## ---- eval = FALSE-------------------------------------------------------
#  efast_generate_medians_for_all_parameter_subsets(FILEPATH, NUMCURVES, PARAMETERS, NUMSAMPLES, NUMRUNSPERSAMPLE, MEASURES, RESULTFILENAME,
#                                                   ALTERNATIVEFILENAME, OUTPUTCOLSTART, OUTPUTCOLEND)
#  # For multiple timepoints:
#  efast_generate_medians_for_all_parameter_subsets(FILEPATH, NUMCURVES, PARAMETERS, NUMSAMPLES, NUMRUNSPERSAMPLE, MEASURES, RESULTFILENAME,
#                                                   ALTERNATIVEFILENAME, OUTPUTCOLSTART, OUTPUTCOLEND, TIMEPOINTS=c(12,36,48,60), TIMEPOINTSCALE="Hours")

## ---- eval=FALSE---------------------------------------------------------
#  efast_get_overall_medians(FILEPATH, NUMCURVES, PARAMETERS, NUMSAMPLES, MEASURES)
#  # For timepoints:
#  efast_get_overall_medians(FILEPATH, NUMCURVES, PARAMETERS, NUMSAMPLES, MEASURES, TIMEPOINTS=c(12,36,48,60), TIMEPOINTSCALE="Hours")

## ----eval=FALSE----------------------------------------------------------
#  efast_run_Analysis(FILEPATH, MEASURES, PARAMETERS, NUMCURVES, NUMSAMPLES, OUTPUTMEASURES_TO_TTEST, TTEST_CONF_INT, GRAPH_FLAG, EFASTRESULTFILENAME)
#  # For multiple timepoints:
#  efast_run_Analysis(FILEPATH, MEASURES, PARAMETERS, NUMCURVES, NUMSAMPLES, OUTPUTMEASURES_TO_TTEST, TTEST_CONF_INT, GRAPH_FLAG,
#                     EFASTRESULTFILENAME, TIMEPOINTS=c(12,36,48,60), TIMEPOINTSCALE="Hours")

