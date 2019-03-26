library(Mediana)


### Name: Mediana-package
### Title: Clinical Trial Simulations
### Aliases: Mediana-package Mediana
### Keywords: package

### ** Examples

## Not run: 
##D # Clinical trial in patients with rheumatoid arthritis
##D 
##D # Variable types
##D var.type = parameters("BinomDist", "NormalDist")
##D 
##D # Outcome distribution parameters
##D plac.par = parameters(parameters(prop = 0.3),
##D                       parameters(mean = -0.10, sd = 0.5))
##D 
##D dosel.par1 = parameters(parameters(prop = 0.40),
##D                         parameters(mean = -0.20, sd = 0.5))
##D dosel.par2 = parameters(parameters(prop = 0.45),
##D                         parameters(mean = -0.25, sd = 0.5))
##D dosel.par3 = parameters(parameters(prop = 0.50),
##D                         parameters(mean = -0.30, sd = 0.5))
##D 
##D doseh.par1 = parameters(parameters(prop = 0.50),
##D                         parameters(mean = -0.30, sd = 0.5))
##D doseh.par2 = parameters(parameters(prop = 0.55),
##D                         parameters(mean = -0.35, sd = 0.5))
##D doseh.par3 = parameters(parameters(prop = 0.60),
##D                         parameters(mean = -0.40, sd = 0.5))
##D 
##D # Correlation between two endpoints
##D corr.matrix = matrix(c(1.0, 0.5,
##D                        0.5, 1.0), 2, 2)
##D 
##D # Outcome parameter set 1
##D outcome1.plac = parameters(type = var.type,
##D                            par = plac.par,
##D                            corr = corr.matrix)
##D outcome1.dosel = parameters(type = var.type,
##D                             par = dosel.par1,
##D                             corr = corr.matrix)
##D outcome1.doseh = parameters(type = var.type,
##D                             par = doseh.par1,
##D                             corr = corr.matrix)
##D 
##D # Outcome parameter set 2
##D outcome2.plac = parameters(type = var.type,
##D                            par = plac.par,
##D                            corr = corr.matrix)
##D outcome2.dosel = parameters(type = var.type,
##D                             par = dosel.par2,
##D                             corr = corr.matrix)
##D outcome2.doseh = parameters(type = var.type,
##D                             par = doseh.par2,
##D                             corr = corr.matrix)
##D 
##D # Outcome parameter set 3
##D outcome3.plac = parameters(type = var.type,
##D                            par = plac.par,
##D                            corr = corr.matrix)
##D outcome3.doseh = parameters(type = var.type,
##D                             par = doseh.par3,
##D                             corr = corr.matrix)
##D outcome3.dosel = parameters(type = var.type,
##D                             par = dosel.par3,
##D                             corr = corr.matrix)
##D 
##D # Data model
##D data.model = DataModel() +
##D   OutcomeDist(outcome.dist = "MVMixedDist") +
##D   SampleSize(c(100, 120)) +
##D   Sample(id = list("Plac ACR20", "Plac HAQ-DI"),
##D          outcome.par = parameters(outcome1.plac, outcome2.plac, outcome3.plac)) +
##D   Sample(id = list("DoseL ACR20", "DoseL HAQ-DI"),
##D          outcome.par = parameters(outcome1.dosel, outcome2.dosel, outcome3.dosel)) +
##D   Sample(id = list("DoseH ACR20", "DoseH HAQ-DI"),
##D          outcome.par = parameters(outcome1.doseh, outcome2.doseh, outcome3.doseh))
##D 
##D family = families(family1 = c(1, 2), family2 = c(3, 4))
##D component.procedure = families(family1 ="HolmAdj", family2 = "HolmAdj")
##D gamma = families(family1 = 0.8, family2 = 1)
##D 
##D # Tests to which the multiplicity adjustment will be applied
##D test.list = tests("Pl vs DoseH - ACR20",
##D                   "Pl vs DoseL - ACR20",
##D                   "Pl vs DoseH - HAQ-DI",
##D                   "Pl vs DoseL - HAQ-DI")
##D 
##D # Analysis model
##D analysis.model = AnalysisModel() +
##D   MultAdjProc(proc = "MultipleSequenceGatekeepingAdj",
##D               par = parameters(family = family,
##D                                proc = component.procedure,
##D                                gamma = gamma),
##D               tests = test.list) +
##D   Test(id = "Pl vs DoseL - ACR20",
##D        method = "PropTest",
##D        samples = samples("Plac ACR20", "DoseL ACR20")) +
##D   Test(id = "Pl vs DoseH - ACR20",
##D        method = "PropTest",
##D        samples = samples("Plac ACR20", "DoseH ACR20")) +
##D   Test(id = "Pl vs DoseL - HAQ-DI",
##D        method = "TTest",
##D        samples = samples("DoseL HAQ-DI", "Plac HAQ-DI")) +
##D   Test(id = "Pl vs DoseH - HAQ-DI",
##D        method = "TTest",
##D        samples = samples("DoseH HAQ-DI", "Plac HAQ-DI"))
##D 
##D # Evaluation model
##D evaluation.model = EvaluationModel() +
##D   Criterion(id = "Marginal power",
##D             method = "MarginalPower",
##D             tests = tests("Pl vs DoseL - ACR20",
##D                           "Pl vs DoseH - ACR20",
##D                           "Pl vs DoseL - HAQ-DI",
##D                           "Pl vs DoseH - HAQ-DI"),
##D             labels = c("Pl vs DoseL - ACR20",
##D                        "Pl vs DoseH - ACR20",
##D                        "Pl vs DoseL - HAQ-DI",
##D                        "Pl vs DoseH - HAQ-DI"),
##D             par = parameters(alpha = 0.025)) +
##D   Criterion(id = "Disjunctive power - ACR20",
##D             method = "DisjunctivePower",
##D             tests = tests("Pl vs DoseL - ACR20",
##D                           "Pl vs DoseH - ACR20"),
##D             labels = "Disjunctive power - ACR20",
##D             par = parameters(alpha = 0.025)) +
##D   Criterion(id = "Disjunctive power - HAQ-DI",
##D             method = "DisjunctivePower",
##D             tests = tests("Pl vs DoseL - HAQ-DI",
##D                           "Pl vs DoseH - HAQ-DI"),
##D             labels = "Disjunctive power - HAQ-DI",
##D             par = parameters(alpha = 0.025))
##D 
##D # Simulation Parameters
##D sim.parameters =  SimParameters(n.sims = 1000, proc.load = 2, seed = 42938001)
##D 
##D # Perform clinical scenario evaluation
##D results = CSE(data.model,
##D               analysis.model,
##D               evaluation.model,
##D               sim.parameters)
##D 
##D # Reporting
##D presentation.model = PresentationModel() +
##D   Project(username = "[Mediana's User]",
##D           title = "Case study",
##D           description = "Clinical trial in patients with rheumatoid arthritis") +
##D   Section(by = c("outcome.parameter")) +
##D   Table(by = c("multiplicity.adjustment")) +
##D   CustomLabel(param = "sample.size",
##D               label = paste0("N = ", c(100, 120)))
##D 
##D # Report Generation
##D GenerateReport(presentation.model = presentation.model,
##D                cse.results = results,
##D                report.filename = "Case study.docx")
##D 
## End(Not run)



