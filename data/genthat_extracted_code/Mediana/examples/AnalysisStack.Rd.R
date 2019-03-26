library(Mediana)


### Name: AnalysisStack
### Title: AnalysisStack object
### Aliases: AnalysisStack

### ** Examples

## Not run: 
##D # Generation of an AnalysisStack object
##D ##################################
##D 
##D # Outcome parameter set 1
##D outcome1.placebo = parameters(mean = 0, sd = 70)
##D outcome1.treatment = parameters(mean = 40, sd = 70)
##D 
##D # Outcome parameter set 2
##D outcome2.placebo = parameters(mean = 0, sd = 70)
##D outcome2.treatment = parameters(mean = 50, sd = 70)
##D 
##D # Data model
##D case.study1.data.model = DataModel() +
##D   OutcomeDist(outcome.dist = "NormalDist") +
##D   SampleSize(c(50, 55, 60, 65, 70)) +
##D   Sample(id = "Placebo",
##D          outcome.par = parameters(outcome1.placebo, outcome2.placebo)) +
##D   Sample(id = "Treatment",
##D          outcome.par = parameters(outcome1.treatment, outcome2.treatment))
##D 
##D # Analysis model
##D case.study1.analysis.model = AnalysisModel() +
##D   Test(id = "Placebo vs treatment",
##D        samples = samples("Placebo", "Treatment"),
##D        method = "TTest") +
##D   Statistic(id = "Mean Treatment",
##D             method = "MeanStat",
##D             samples = samples("Treatment"))
##D 
##D 
##D # Simulation Parameters
##D case.study1.sim.parameters = SimParameters(n.sims = 1000,
##D                                            proc.load = 2,
##D                                            seed = 42938001)
##D 
##D # Generate results
##D case.study1.analysis.stack = AnalysisStack(data.model = case.study1.data.model,
##D                                            analysis.model = case.study1.analysis.model,
##D                                            sim.parameters = case.study1.sim.parameters)
##D 
##D # Print the analysis results generated in the 100th simulation run
##D # for the 2nd data scenario for both samples
##D case.study1.analysis.stack$analysis.set[[100]][[2]]
##D 
##D # Extract the same set of data
##D case.study1.extracted.analysis.stack =
##D   ExtractAnalysisStack(analysis.stack = case.study1.analysis.stack,
##D                        data.scenario = 2,
##D                        simulation.run = 100)
##D 
##D # A carefull attention should be paid on the index of the result.
##D # As only one data.scenario has been requested
##D # the result for data.scenario = 2 is now in the first position ($analysis.set[[1]][[1]]).
## End(Not run)



