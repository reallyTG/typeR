library(Mediana)


### Name: GenerateReport
### Title: Clinical Scenario Evaluation Report
### Aliases: GenerateReport

### ** Examples

## Not run: 
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
##D 
##D # Analysis model
##D case.study1.analysis.model = AnalysisModel() +
##D   Test(id = "Placebo vs treatment",
##D        samples = samples("Placebo", "Treatment"),
##D        method = "TTest")
##D 
##D # Evaluation model
##D case.study1.evaluation.model = EvaluationModel() +
##D   Criterion(id = "Marginal power",
##D             method = "MarginalPower",
##D             tests = tests("Placebo vs treatment"),
##D             labels = c("Placebo vs treatment"),
##D             par = parameters(alpha = 0.025))
##D 
##D # Simulation Parameters
##D case.study1.sim.parameters = SimParameters(n.sims = 1000, proc.load = 2, seed = 42938001)
##D 
##D # Perform clinical scenario evaluation
##D case.study1.results = CSE(case.study1.data.model,
##D                           case.study1.analysis.model,
##D                           case.study1.evaluation.model,
##D                           case.study1.sim.parameters)
##D 
##D 
##D # Reporting
##D case.study1.presentation.model = PresentationModel() +
##D   Section(by = "outcome.parameter") +
##D   Table(by = "sample.size") +
##D   CustomLabel(param = "sample.size",
##D               label= paste0("N = ",c(50, 55, 60, 65, 70))) +
##D   CustomLabel(param = "outcome.parameter",
##D               label=c("Standard 1", "Standard 2"))
##D 
##D # Report Generation
##D GenerateReport(presentation.model = case.study1.presentation.model,
##D                cse.results = case.study1.results,
##D                report.filename = "Case study 1 (normally distributed endpoint).docx")
##D 
## End(Not run)



