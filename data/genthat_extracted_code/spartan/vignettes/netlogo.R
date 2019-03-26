## ----eval=FALSE----------------------------------------------------------
#  library(spartan)
#  # Directory where the sample file should be stored
#  FILEPATH<-"/home/user/robustness/"
#  # Name to give the setup file. No need for file extension
#  NETLOGO_SETUPFILE_NAME<-"nl_robustness_setup"
#  # Parameters in simulation. List all the parameters that Netlogo is
#  # required to know,
#  PARAMETERS<-c("people","infectiousness","chance-recover","duration")
#  # Now values for each of the parameters above
#  # For parameters not being analysed, simply list the value
#  # For parameters being analysed, put the min, max and increment values
#  # of the parameter in square brackets, in double quotes, e.g.
#  # "[0.1,0.5,0.1]"
#  PARAMVALS<-c(150,"[10,90,10]","[10,90,10]","[5,40,5]")
#  # Name of the setup simulation function in Netlogo simulation
#  # Usually setup
#  NETLOGO_SETUP_FUNCTION<-"setup"
#  # Name of the function that starts the simulation. Usually go
#  NETLOGO_RUN_FUNCTION<-"go"
#  # Simulation output measures
#  MEASURES<-c("death-thru-sickness","death-but-immune",
#  "death-old-age","death-old-and-sick")
#  # Number of times Netlogo should repeat the experiment for each
#  # parameter set
#  EXPERIMENT_REPETITIONS<-1
#  # Whether Netlogo should collect metrics at each timestep
#  RUNMETRICS_EVERYSTEP<-"true"

## ----eval=FALSE----------------------------------------------------------
#  oat_generate_netlogo_behaviour_space_XML(FILEPATH, NETLOGO_SETUPFILE_NAME, PARAMETERS,
#                                           PARAMVALS, NETLOGO_SETUP_FUNCTION, NETLOGO_RUN_FUNCTION,
#                                           MEASURES, EXPERIMENT_REPETITIONS, RUNMETRICS_EVERYSTEP)

## ----eval=FALSE----------------------------------------------------------
#  # Import the package
#  library(spartan)
#  library(XML)
#  # Folder containing the Netlogo Behaviour Space table, AND where the
#  # processed results will be written to
#  FILEPATH<-"/home/user/robustness/"
#  # Name of the Netlogo Behaviour Space Table file
#  NETLOGO_BEHAVIOURSPACEFILE<-"virus_oat.csv"
#  # Array of the parameters to be analysed, but ONLY those perturbed
#  PARAMETERS<-c("infectiousness","chance-recover","duration")
#  # Value assigned to each parameter at calibration (the baseline value)
#  BASELINE<-c(60,50,20)
#  # The maximum value for each parameter
#  PMAX<-c(90,90,40)
#  # The minimum value explored for each parameter
#  PMIN<-c(10,10,5)
#  # Amount the parameter value was incremened during sampling
#  PINC<-c(10,10,5)
#  # Timestep of interest. The behaviour space table is likely to contain
#  # all timesteps - this narrows the analysis
#  TIMESTEP<-5200
#  # The simulation output measures being examined. Should be specified
#  # as they are in the Netlogo file
#  MEASURES<-c("death-thru-sickness","death-but-immune","death-old-age",
#  "death-old-and-sick")
#  # For each parameter value being analysed, a file is created
#  # containing the median of each output measure, of each simulation run
#  # for that value. This sets the name of this file.
#  RESULTFILENAME<-"ParamValResponses.csv"
#  # The results of the A-Test comparisons of each parameter value
#  # against that of the parameters baseline value are output as a file.
#  # This sets the name of this file.
#  ATESTRESULTSFILENAME<-"VirusOAT_ATests.csv"
#  # A-Test result value either side of 0.5 at which the difference
#  # between two sets of results is significant
#  ATESTSIGLEVEL<-0.21
#  # What each measure represents. Used in graphing results
#  MEASURE_SCALE<-c("Number of People","Number of People",
#  "Number of People","Number of People")
#  # Not used in this case, but when a simulation is analysed at multiple
#  # timepoints (see tutorials 1-4)
#  TIMEPOINTS<-NULL; TIMEPOINTSCALE<-NULL
#  
#  oat_process_netlogo_result(FILEPATH,NETLOGO_BEHAVIOURSPACEFILE, PARAMETERS,
#                             BASELINE, PMIN, PMAX, PINC, MEASURES, RESULTFILENAME,
#                             ATESTRESULTSFILENAME, TIMESTEP)
#  
#  # Note that PARAMVALS is set to NULL - we don't use that for Netlogo
#  oat_graphATestsForSampleSize(FILEPATH, PARAMETERS, MEASURES, ATESTSIGLEVEL,
#                               ATESTRESULTSFILENAME, BASELINE, PMIN, PMAX, PINC, NULL,
#                               TIMEPOINTS, TIMEPOINTSCALE)

## ----eval=FALSE----------------------------------------------------------
#  library(spartan)
#  # Directory where the samples should be stored
#  FILEPATH<-"/home/user/LHC/"
#  # Parameters in simulation. List all the parameters that Netlogo is
#  # required to know,
#  PARAMETERS<-c("people","infectiousness","chance-recover","duration")
#  # Now values for each of the parameters above
#  # For parameters not being analysed, simply list the value
#  # For parameters being analysed, put the min and max values of the
#  # parameter in square brackets, in double quotes, e.g. "[0.1,0.5]"
#  # Encapsulate strings, i.e.: "\"/home/user/Experiment/\""
#  PARAMVALS<-c(150,"[10,90]","[10,90]","[5,40]")
#  # Number of parameter samples to take from hypercube
#  NUMSAMPLES<-500
#  # Name of function that sets up Netlogo simulation. Usually setup
#  NETLOGO_SETUP_FUNCTION<-"setup"
#  # Name of function that starts Netlogo simulation. Usually go
#  NETLOGO_RUN_FUNCTION<-"go"
#  # Simulation output measures
#  MEASURES<-c("death-thru-sickness","death-but-immune","death-old-age",
#  "death-old-and-sick")
#  # Number of times the Netlogo experiment is repeated for each parameter
#  # set
#  EXPERIMENT_REPETITIONS<-1
#  # Whether Netlogo metrics should be collected at each timestep
#  RUNMETRICS_EVERYSTEP<-"true"
#  # Algorithm to use to generate the hypercube (normal or optimal)
#  ALGORITHM<-"normal"
#  
#  lhc_generate_lhc_sample_netlogo(FILEPATH,PARAMETERS,PARAMVALS,NUMSAMPLES,ALGORITHM,
#                                EXPERIMENT_REPETITIONS,RUNMETRICS_EVERYSTEP,NETLOGO_SETUP_FUNCTION,
#                                NETLOGO_RUN_FUNCTION,MEASURES)

## ----eval=FALSE----------------------------------------------------------
#  # Import the package
#  library(spartan)
#  # Folder containing the Netlogo Behaviour Space table,
#  # and where the processed results will be written to
#  FILEPATH<-"/home/user/LHC/"
#  # Name of the result file (csv) generated by Netlogo, with no file
#  # extension
#  LHCSAMPLE_RESULTFILENAME<-"lhcResult"
#  # Location of a file containing the parameter value sets
#  # generated by the hypercube sampling (i.e. the file generated
#  # in the previous method of this tutorial. U
#  SPARTAN_PARAMETER_FILE<-"LHC_Parameters_for_Runs.csv"
#  # Number of parameter samples generated from the hypercube
#  NUMSAMPLES<-500
#  # The simulation output measures being examined. Should be specified
#  # as they are in the Netlogo file
#  MEASURES<-c("death-thru-sickness","death-but-immune","death-old-age",
#  "death-old-and-sick")
#  # File name to give to the summary file that is produced showing
#  # the parameter value sets alongside the median results for each
#  # simulation output measure.
#  LHC_ALL_SIM_RESULTS_FILE<-"Virus_LHCSummary.csv"
#  # Timestep of interest. The behaviour space table is likely to contain
#  # all timesteps - this narrows the analysis
#  TIMESTEP<-5200
#  # Parameters of interest in this analysis
#  PARAMETERS<-c("infectiousness","chance-recover","duration")
#  # What each measure represents. Used in graphing results
#  MEASURE_SCALE<-c("Number of People","Number of People",
#  "Number of People","Number of People")
#  # File name to give to the file showing the Partial Rank Correlation
#  # Coefficients for each parameter. Again note no file extension
#  CORCOEFFSOUTPUTFILE<-"EgSet_corCoeffs"
#  # Not used in this case, but when a simulation is analysed at
#  # multiple timepoints (see Tutorials 1-4)
#  TIMEPOINTS<-NULL; TIMEPOINTSCALE<-NULL
#  
#  lhc_process_netlogo_result(FILEPATH, LHCSAMPLE_RESULTFILENAME, SPARTAN_PARAMETER_FILE, NUMSAMPLES, MEASURES, LHC_ALL_SIM_RESULTS_FILE, TIMESTEP)
#  
#  lhc_generatePRCoEffs(FILEPATH, PARAMETERS, MEASURES, LHC_ALL_SIM_RESULTS_FILE, CORCOEFFSOUTPUTFILE)
#  
#  lhc_graphMeasuresForParameterChange(FILEPATH, PARAMETERS, MEASURES, MEASURE_SCALE, CORCOEFFSOUTPUTFILE, LHC_ALL_SIM_RESULTS_FILE)
#  

## ----eval=FALSE----------------------------------------------------------
#  library(spartan)
#  # The directory where the samples should be stored
#  FILEPATH<-"/home/user/eFAST/"
#  # Parameters for this simulation. List ALL the parameters that Netlogo needs to know, even those not being perturbed. Make # sure you include the dummy
#  PARAMETERS<-c("people","infectiousness","chance-recover","duration", "dummy")
#  # Now values for each of the parameters above. For parameters not being analysed, simply list the value
#  # For parameters being analysed, put the min and max values of the parameter in square brackets, in double quotes, e.g.
#  # "[0.1,0.5]" Encapsulate strings, i.e.: "\"/home/user/Experiment/\""
#  PARAMVALS<-c(150,"[10,90]","[10,90]","[5,40]","[1,10]")
#  # Number of resampling curves to use
#  NUMCURVES<-3
#  # Number of value samples to take from each parameter curve
#  NUMSAMPLES<-65
#  # The name of the function in Netlogo that sets up the simulation (Usually setup)
#  NETLOGO_SETUP_FUNCTION<-"setup"
#  # Name of the function in Netlogo that starts the simulation (Usually go)
#  NETLOGO_RUN_FUNCTION<-"go"
#  MEASURES<-c("death-thru-sickness","death-but-immune","death-old-age","death-old-and-sick")
#  # Number of times the Netlogo run should be repeated for each parameter set
#  EXPERIMENT_REPETITIONS<-1
#  # Whether Netlogo should collect metrics at all timesteps
#  RUNMETRICS_EVERYSTEP<-"true"
#  
#  efast_generate_sample_netlogo(FILEPATH,NUMCURVES,NUMSAMPLES,MEASURES,PARAMETERS,PARAMVALS,EXPERIMENT_REPETITIONS,
#                                RUNMETRICS_EVERYSTEP,NETLOGO_SETUP_FUNCTION,NETLOGO_RUN_FUNCTION)

## ----eval=FALSE----------------------------------------------------------
#  library(spartan)
#  # The directory where the netlogo experiment file should be stored
#  FILEPATH<-"/home/kieran/Documents/Tutorial/eFAST/"
#  # Name of the result file generated by Netlogo. The sample number and
#  # .csv are added to this
#  EFASTSAMPLE_RESULTFILENAME<-"efast_result_set"
#  # The parameters being examined in this analysis. Include the dummy
#  PARAMETERS<-c("infectiousness","chance-recover","duration","dummy")
#  # Number of resampling curves to use
#  NUMCURVES<-3
#  # Number of value samples to take from each curve
#  NUMSAMPLES<-65
#  # The output measures by which you are analysing the results.
#  MEASURES<-c("death-thru-sickness","death-but-immune","death-old-age","death-old-and-sick")
#  # File created containing the median of each output measure, of each
#  # simulation for this parameter set. Note no file extension
#  RESULTFILENAME<-"ParamValResponses"
#  # Timestep of interest. The behaviour space table is likely to contain
#  # all timesteps. This narrows the analysis
#  TIMESTEP<-5200
#  # Output measures to t-test to gain statistical significance
#  OUTPUTMEASURES_TO_TTEST<-1:4
#  # T-Test confidence interval
#  TTEST_CONF_INT<-0.95
#  # Boolean noting whether graphs should be produced
#  GRAPH_FLAG<-TRUE
#  # Name of the final result file summarising the analysis, showing the
#  # partitioning of the variance between parameters. Note no file
#  # extension
#  EFASTRESULTFILENAME<-"Virus_eFAST_Analysis"
#  # Not used in this case, but when a simulation is analysed at
#  # multiple timepoints (see Tutorials 1-4)
#  TIMEPOINTS<-NULL; TIMEPOINTSCALE<-NULL
#  
#  efast_process_netlogo_result(FILEPATH, EFASTSAMPLE_RESULTFILENAME, PARAMETERS, NUMCURVES,
#             NUMSAMPLES, MEASURES, RESULTFILENAME, TIMESTEP)
#  
#  # Get all the results for each curve into one summary file for each curve
#  efast_get_overall_medians(FILEPATH, NUMCURVES, PARAMETERS, NUMSAMPLES, MEASURES)
#  
#  # Run the eFAST analysis
#  efast_run_Analysis(FILEPATH, MEASURES, PARAMETERS, NUMCURVES, NUMSAMPLES, OUTPUTMEASURES_TO_TTEST, TTEST_CONF_INT,
#              GRAPH_FLAG, EFASTRESULTFILENAME, TIMEPOINTS, TIMEPOINTSCALE)
#  

