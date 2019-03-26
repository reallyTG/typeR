library(Mediana)


### Name: ExtractDataStack
### Title: ExtractDataStack function
### Aliases: ExtractDataStack

### ** Examples

## Not run: 
##D   # Generation of a DataStack object
##D   ##################################
##D 
##D   # Outcome parameter set 1
##D   outcome1.placebo = parameters(mean = 0, sd = 70)
##D   outcome1.treatment = parameters(mean = 40, sd = 70)
##D 
##D   # Outcome parameter set 2
##D   outcome2.placebo = parameters(mean = 0, sd = 70)
##D   outcome2.treatment = parameters(mean = 50, sd = 70)
##D 
##D   # Data model
##D   case.study1.data.model = DataModel() +
##D     OutcomeDist(outcome.dist = "NormalDist") +
##D     SampleSize(c(50, 55, 60, 65, 70)) +
##D     Sample(id = "Placebo",
##D            outcome.par = parameters(outcome1.placebo, outcome2.placebo)) +
##D     Sample(id = "Treatment",
##D            outcome.par = parameters(outcome1.treatment, outcome2.treatment))
##D 
##D 
##D   # Simulation Parameters
##D   case.study1.sim.parameters = SimParameters(n.sims = 1000,
##D                                              proc.load = 2,
##D                                              seed = 42938001)
##D 
##D   # Generate data
##D   case.study1.data.stack = DataStack(data.model = case.study1.data.model,
##D                                      sim.parameters = case.study1.sim.parameters)
##D 
##D   # Print the data set generated in the 100th simulation run
##D   # for the 2nd data scenario for both samples
##D   case.study1.data.stack$data.set[[100]]$data.scenario[[2]]$sample
##D 
##D   # Extract the same set of data
##D   case.study1.extracted.data.stack = ExtractDataStack(data.stack = case.study1.data.stack,
##D                                                       data.scenario = 2,
##D                                                       simulation.run = 100)
##D 
##D   # A carefull attention should be paid on the index of the result.
##D   # As only one data.scenario has been requested
##D   # the result for data.scenario = 2 is now in the first position (data.scenario[[1]]).
## End(Not run)




