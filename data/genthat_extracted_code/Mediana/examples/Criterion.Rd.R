library(Mediana)


### Name: Criterion
### Title: Criterion object
### Aliases: Criterion

### ** Examples

## Add a Criterion to an EvaluationModel object
evaluation.model = EvaluationModel() +
                   Criterion(id = "Marginal power",
                   method = "MarginalPower",
                   tests = tests("Placebo vs treatment"),
                   labels = c("Placebo vs treatment"),
                   par = parameters(alpha = 0.025))



