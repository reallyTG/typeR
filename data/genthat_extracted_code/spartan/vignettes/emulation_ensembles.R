## ----eval=FALSE----------------------------------------------------------
#  # Read in the dataset. For ease of this tutorial, an exemplar set has been provided in the package,
#  data("sim_data_for_emulation")
#  # Simulation parameters
#  parameters<-c("stableBindProbability","chemokineExpressionThreshold","initialChemokineExpressionValue",
#                "maxChemokineExpressionValue","maxProbabilityOfAdhesion","adhesionFactorExpressionSlope")
#  # Output measures
#  measures<-c("Velocity","Displacement","PatchArea")
#  # Mins and max values used in sampling
#  sampleMaxes <- cbind(100,0.9,0.5,0.08,1,5)
#  sampleMins <-cbind(0,0.1,0.1,0.015,0.1,0.25)
#  
#  ## Partition the dataset, in this case normalising the data
#  partitionedData <- partition_dataset(sim_data_for_emulation, parameters, measures, percent_train=75, percent_test=15,
#  	percent_validation=10, normalise=TRUE, sample_mins = sampleMins, sample_maxes = sampleMaxes)
#  # If you want to specify a seed to use when randomly paritioning the data, add seed=[desired seed],
#  # eg seed=10

## ----eval=FALSE----------------------------------------------------------
#  visualise_data_distribution(partitionedData$training,"Velocity","Velocity_Diagnostic")
#  # If you wish, you can specify the number of bins to use in the plot. A default of 30 is used if not specified
#  visualise_data_distribution(partitionedData$training,"Displacement","Displacement_Diagnostic", num_bins = 10)

## ----eval=FALSE----------------------------------------------------------
#  # Set the algorithm settings. Let's say in this case we're generating a neural
#  # network, so we need to feed in some potential structures to examine
#  networkStructures<-list(c(4),c(3),c(4,3),c(4,4,3),c(4,4),c(4,3,3),c(4,4,4,3),c(4,3,2))
#  # So change the default in the algorithm settings
#  algorithmSettings<-emulation_algorithm_settings(network_structures=networkStructures)

## ----eval=FALSE----------------------------------------------------------
#  # Run the algorithms, here we've given an example for all model types:
#  glm_fit <- generate_requested_emulations(c("GLM"),partitionedData, parameters,measures, normalised=TRUE)
#  svm_fit <- generate_requested_emulations(c("SVM"),partitionedData, parameters,measures, normalised=TRUE)
#  rf_fit <- generate_requested_emulations(c("RF"),partitionedData, parameters,measures, normalised=TRUE)
#  nn_fit <- generate_requested_emulations(c("NNET"),partitionedData, parameters,measures,algorithmSettings, normalised=TRUE)
#  gp_fit <- generate_requested_emulations(c("GP"),partitionedData, parameters,measures, normalised=TRUE)

## ----eval=FALSE----------------------------------------------------------
#  # Generate some predictions for unseen data, let's use the validation set
#  # This has already been normalised:
#  predictions <- emulator_predictions(rf_fit, parameters, measures,	partitionedData$validation, normalise=FALSE, normalise_result=TRUE)

## ----eval=FALSE----------------------------------------------------------
#  # Parameters, measures, partitionedData, and algorithmSettings as declared in Technique 6.
#  # List of the existing emulations created using Technique 6
#  existing_simulations <- list(glm_fit,svm_fit,rf_fit,nn_fit,gp_fit)
#  # Generate an ensemble from these
#  # Note the training on the test set, as the original emulators were trained using the partitioned data training set
#  generated_ensemble <- generate_ensemble_from_existing_emulations(existing_simulations,parameters, measures, partitionedData$testing,algorithm_settings=algorithmSettings, normalise=TRUE, timepoint=NULL)

## ----eval=FALSE----------------------------------------------------------
#  # List of model types to include:
#  modelList <- c("SVM","RF","GLM","NNET","GP")
#  # Simulation dataset, again using the provided data
#  data("sim_data_for_emulation")
#  # Partition the dataset (mins, maxes as declared in Technique 6)
#  partitionedData <- partition_dataset(sim_data_for_emulation, parameters, measures, percent_train=75, percent_test=15,
#  	percent_validation=10, normalise=TRUE, sample_mins = sampleMins, sample_maxes = sampleMaxes)
#  # Make the ensemble, specifying that the data above has been normalised. Parameters and measures as declared in Technique 6
#  # Recall you must have created an algorithmSettings object with the neural network structures to examine
#  generated_ensemble<-generate_emulators_and_ensemble(modelList, parameters, measures, partitionedData,
#                                                      algorithm_settings = algorithmSettings, normalised=TRUE)

## ----eval=FALSE----------------------------------------------------------
#  # params is a vector of unseen parameter values for which a prediction is being sought.
#  params<-partitionedData$validation
#  predictions <- use_ensemble_to_generate_predictions(generated_ensemble,params,
#  	parameters,measures,normalise_values = FALSE, normalise_result = TRUE)

## ----eval=FALSE----------------------------------------------------------
#  #### The examples below build on those detailed in Techniques 3-4, and
#  #### as such that detail is referred to here rather than repeated.
#  
#  #### Step 1: Use Spartan Technique 3 to generate samples, i.e:
#  #  Filepath: where the produced parameter sample file should be stored
#  filepath <- getwd()
#  # Declare parameters
#  parameters <- c("stableBindProbability","chemokineExpressionThreshold",
#  		"initialChemokineExpressionValue",
#  		"maxChemokineExpressionValue","maxProbabilityOfAdhesion",
#  		"adhesionFactorExpressionSlope")
#  num_samples <- 500
#  # Mins and Maxes
#  pmaxes <- cbind(100,0.9,0.5,0.08,1,5)
#  pmins <-cbind(0,0.1,0.1,0.015,0.1,0.25)
#  # Normal or optimal sampling. Recall from Technique 3 that optimal is
#  # time intensive
#  algorithm <- "normal"
#  
#  # Sampling call
#  sample<-lhc_generate_lhc_sample(filepath,parameters,num_samples,pmins,pmaxes,
#  	algorithm)
#  
#  # However, for the below we do provide an example set of parameters
#  # as an object that can be loaded in
#  
#  #### Step 2: Run the wrapper functions detailed above to emulate the
#  #### simulation, predicting the output for each parameter set
#  # Tutorial parameter value sets, constructed using spartan
#  data("emulated_lhc_values")
#  # Here we assume that Technique 7 has been used to generate an ensemble,
#  # and this is read in from file. This will be read into the object
#  # "built_ensemble"
#  # We haven't put an exemplar ensemble in the package due to the file size
#  # of the object, but this can be downloaded from the package website
#  # Alternatively you can download an ensemble using the two lines:
#  # download.file("www.kieranalden.info/spartan/test_data/built_ensemble_72.Rda", "built_ensemble")
#  # load("built_ensemble")
#  # However if you're following along from the code above, you could
#  # instantiate built_ensemble to be generated_ensemble from the previous
#  # technique
#  load("built_ensemble.Rda")
#  
#  # Declare responses:
#  measures<-c("Velocity","Displacement")
#  measure_scale <- c("microns","microns/min")
#  
#  # Now generate predictions:
#  # You can do this two ways:
#  # 1: Provide an object containing all the parameter value sets (i.e. emulated_lhc_values), as below:
#  # If you have loaded the data from within the package in, use the line below and ignore method 2
#  emulate_lhc_sampled_parameters(filepath, built_ensemble, parameters, measures, measure_scale, dataset = emulated_lhc_values, normalise = TRUE)
#  # 2: Or, if you have generated a CSV file with all the values, give the name of that file (should be in the specified filepath)
#  parameterFileName <- "LHC_Parameters_for_Runs.csv"
#  emulate_lhc_sampled_parameters(filepath, ensemble, parameters, measures, measure_scale, param_file = parameterFileName)
#  
#  # The above will calculate all partial rank correlation coefficiejnts and graph the results into the present working directory
#  
#  # If you wanted, you could do an lhc for a single emulation object, not just an ensemble.
#  # If you wanted to do that, say for the neural network object nn_fit created in previous steps in this vignette, you would do:
#  emulate_lhc_sampled_parameters(filepath, nn_fit, parameters, measures, measure_scale, dataset = emulated_lhc_values,
#                                 ensemble_set = FALSE, normalise = TRUE)

## ----eval=FALSE----------------------------------------------------------
#  # Number of curves for eFAST
#  numCurves <- 3
#  # Number of samples to take from each curve
#  numSamples <- 65
#  # Where samples are stored
#  filepath <- getwd()
#  # Recall we need to add a dummy parameter for statistical comparison
#  parameters <- c("stableBindProbability","chemokineExpressionThreshold",
#  		"initialChemokineExpressionValue",
#  		"maxChemokineExpressionValue","maxProbabilityOfAdhesion",
#  		"adhesionFactorExpressionSlope", "dummy")
#  # Max of all parameters. Include a max value for dummy (1 here)
#  PMAX <- cbind(100,0.9,0.5,0.08,1,5,1)
#  # Min of all parameters. Include a min value for dummy (0 here)
#  PMIN <-cbind(0,0.1,0.1,0.015,0.1,0.25,0)
#  
#  #### Step 1: Use Spartan Technique 4 to generate samples
#  efast_generate_sample(filepath, numCurves,numSamples,parameters, PMIN, PMAX)
#  # As this method produces several CSV files (one per parameter/curve), and it is these files which are
#  # read in to make the predictions, these have not been included as an object that can be loaded in.
#  # However an example set is available on the project website. Extract that into the working folder and then run the below.
#  
#  # Make predictions and plot the results
#  emulate_efast_sampled_parameters(filepath, built_ensemble, parameters, measures, numCurves, normalise = TRUE)
#  
#  # Analyse:
#  efast_run_Analysis(filepath,measures,parameters,numCurves, numSamples,1:2,0.95,TRUE,"eFAST_Analysis.csv")
#  
#  # If you wanted to use a single emulator rather than the ensemble, say nn_fit created earlier, you would do:
#  emulate_efast_sampled_parameters(filepath, nn_fit, parameters, measures, numCurves, normalise = TRUE, ensemble_set = FALSE)

## ----eval=FALSE----------------------------------------------------------
#  # Four examples here of applying an ensemble to perform the  sequential ABC methods in EasyABC
#  # Firstly make sure the parameters and measures are declared
#  parameters <- c("stableBindProbability","chemokineExpressionThreshold",
#  	"initialChemokineExpressionValue","maxChemokineExpressionValue",
#  	"maxProbabilityOfAdhesion","adhesionFactorExpressionSlope")
#  measures<-c("Velocity","Displacement")
#  # Load in an ensemble generated in Technique 7, this loads in as built_ensemble
#  load("built_ensemble.Rda")
#  # Whether the parameter sets generated by the ABC algorithm should be normalised
#  # for input into the ensemble
#  normalise_values = TRUE
#  # Whether the predictions for the parameter set should be normalised
#  normalise_result = TRUE
#  
#  # Establish the priors for each parameter
#  prior=list(c("unif",0,100),c("unif",0.1,0.9),c("unif",0.1,0.5),
#  	c("unif",0.015,0.08),c("unif",0.1,1.0),c("unif",0.25,5.0))
#  
#  
#  # Summary statistics to be targetted
#  sum_stat_obs=c(4.4677342593,28.5051144444)
#  
#  # Create the file that will be read in by the wrapper:
#  create_abc_settings_object(parameters, measures, built_ensemble, normalise_values,
#                             normalise_result)

## ----eval=FALSE----------------------------------------------------------
#  # Beaumont method using spartan ensemble wrapper
#  library(EasyABC)
#  numRunsUnderThreshold=100
#  tolerance=c(20,15,10.00,7,5.00)
#  abc_resultSet<-ABC_sequential(method="Beaumont",
#  	model=ensemble_abc_wrapper, prior=prior,
#  	nb_simul=numRunsUnderThreshold,
#  	summary_stat_target=sum_stat_obs,
#  	tolerance_tab=tolerance, verbose=TRUE)
#  
#  # Graph the result
#  # Ranges:
#  sampleMins <- c(0,0.1,0.1,0.015,0.1,0.25)
#  sampleMaxes<- c(100,0.9,0.5,0.08,1.0,5.0)
#  graph_Posteriors_All_Parameters(abc_resultSet,
#  	parameters, sampleMins, sampleMaxes)
#  
#  
#  # Delmoral method using spartan ensemble wrapper
#  initialSims=500
#  decreaseSampleSizeEachStep <- 0.5
#  numberSimsPerformedPerParticle <- 1
#  minSampleSizeForResampling <- initialSims/2
#  finalToleranceLevel <- 0.05
#  
#  abc_resultSet<-ABC_sequential(method="Delmoral",
#  	model=ensemble_abc_wrapper, prior=prior, nb_simul=initialSims,
#  	summary_stat_target=sum_stat_obs,
#  	alpha=decreaseSampleSizeEachStep,
#  	tolerance_target=finalToleranceLevel,
#  	M=numberSimsPerformedPerParticle,
#  	nb_threshold=minSampleSizeForResampling,
#  	verbose=TRUE)
#  
#  # Graph the result
#  graph_Posteriors_All_Parameters(abc_resultSet,
#  	parameters, sampleMins, sampleMaxes)
#  
#  
#  # Drovandi method:
#  initialSims=500
#  finalToleranceLevel = 0.05
#  proportionBestFitToUpdate=0.7
#  targetProportionUnovedParticles=0.01
#  abc_resultSet<-ABC_sequential(method="Drovandi",
#  	model=ensemble_abc_wrapper,prior=prior,
#  	summary_stat_target=sum_stat_obs,
#  	alpha = proportionBestFitToUpdate,
#  	c=targetProportionUnovedParticles,
#  	nb_simul = initialSims,
#  	tolerance=finalToleranceLevel,
#  	verbose=TRUE)
#  
#  # Graph the result
#  graph_Posteriors_All_Parameters(abc_resultSet,
#  	parameters, sampleMins, sampleMaxes)
#  

## ----eval=FALSE----------------------------------------------------------
#  # Declare a fitness function in a R script. Fitness function below can be downloaded from the website
#  fitness_function <- "eval_function.R"
#  # Read in the fitness function
#  source(fitness_function)
#  # In this case, the name of the fitness funtion in the file eval_function.R is evalfunction - this is then
#  # referred to in the methods parameter_sensitivities and emulator_parameter_evolution
#  # Load a ensemble generated by Technique 7
#  load("built_ensemble.Rda")
#  # The target values for objectives that the ngsa2 should try to produce using the emulator (minimising the error between prediction and these observed values).
#  desiredResponses <- c(4.3,24)
#  # Measures, parameters, sampleMins, sampleMaxes as those declared previously above
#  # Set the parameters and settings
#  sensitivityParams <- set.nsga_sensitivity_params(generation_min=100, crossover_min=0.1,mutation_min=0.1,
#                                                  generation_max=500,crossover_max=1.0, mutation_max=1.0, seed=500)
#  
#  nsga2_params <- nsga2_set_user_params(built_ensemble, parameters, measures, desiredResponses, sampleMins, sampleMaxes)
#  
#  nsga2_settings <- list("popsize"=100,"generations" = 100, "cprob" = 0.3, "mprob" = 0.1)
#  
#  # Screen the parameters using nsga2
#  parameter_sensitivities <- screen_nsga2_parameters(evalfunction, nsga2_params, sensitivityParams, nsga2_settings)
#  
#  # Evolve parameters
#  emulator_parameter_evolution(evalfunction, nsga2_params, nsga2_settings)

