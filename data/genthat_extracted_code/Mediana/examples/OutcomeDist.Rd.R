library(Mediana)


### Name: OutcomeDist
### Title: OutcomeDist object
### Aliases: OutcomeDist

### ** Examples

# Simple example with a univariate distribution
# Outcome parameter set 1
outcome1.placebo = parameters(mean = 0, sd = 70)
outcome1.treatment = parameters(mean = 40, sd = 70)

# Outcome parameter set 2
outcome2.placebo = parameters(mean = 0, sd = 70)
outcome2.treatment = parameters(mean = 50, sd = 70)

# Data model
data.model = DataModel() +
             OutcomeDist(outcome.dist = "NormalDist") +
             SampleSize(c(50, 55, 60, 65, 70)) +
             Sample(id = "Placebo",
                    outcome.par = parameters(outcome1.placebo, outcome2.placebo)) +
             Sample(id = "Treatment",
                    outcome.par = parameters(outcome1.treatment, outcome2.treatment))

# Complex example with multivariate distribution following a Binomial and a Normal distribution
# Variable types
var.type = list("BinomDist", "NormalDist")

# Outcome distribution parameters
plac.par = list(list(prop = 0.3), list(mean = -0.10, sd = 0.5))

dosel.par1 = list(list(prop = 0.40), list(mean = -0.20, sd = 0.5))
dosel.par2 = list(list(prop = 0.45), list(mean = -0.25, sd = 0.5))
dosel.par3 = list(list(prop = 0.50), list(mean = -0.30, sd = 0.5))

doseh.par1 = list(list(prop = 0.50), list(mean = -0.30, sd = 0.5))
doseh.par2 = list(list(prop = 0.55), list(mean = -0.35, sd = 0.5))
doseh.par3 = list(list(prop = 0.60), list(mean = -0.40, sd = 0.5))

# Correlation between two endpoints
corr.matrix = matrix(c(1.0, 0.5,
                       0.5, 1.0), 2, 2)

# Outcome parameter set 1
outcome1.plac = list(type = var.type, par = plac.par, corr = corr.matrix)
outcome1.dosel = list(type = var.type, par = dosel.par1, corr = corr.matrix)
outcome1.doseh = list(type = var.type, par = doseh.par1, corr = corr.matrix)

# Outcome parameter set 2
outcome2.plac = list(type = var.type, par = plac.par, corr = corr.matrix)
outcome2.dosel = list(type = var.type, par = dosel.par2, corr = corr.matrix)
outcome2.doseh = list(type = var.type, par = doseh.par2, corr = corr.matrix)

# Outcome parameter set 3
outcome3.plac = list(type = var.type, par = plac.par, corr = corr.matrix)
outcome3.doseh = list(type = var.type, par = doseh.par3, corr = corr.matrix)
outcome3.dosel = list(type = var.type, par = dosel.par3, corr = corr.matrix)

# Data model
data.model = DataModel() +
             OutcomeDist(outcome.dist = "MVMixedDist") +
             SampleSize(c(100, 120)) +
             Sample(id = list("Plac ACR20", "Plac HAQ-DI"),
                    outcome.par = parameters(outcome1.plac, outcome2.plac, outcome3.plac)) +
             Sample(id = list("DoseL ACR20", "DoseL HAQ-DI"),
                    outcome.par = parameters(outcome1.dosel, outcome2.dosel, outcome3.dosel)) +
             Sample(id = list("DoseH ACR20", "DoseH HAQ-DI"),
                    outcome.par = parameters(outcome1.doseh, outcome2.doseh, outcome3.doseh))



