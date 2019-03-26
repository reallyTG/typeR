library(Mediana)


### Name: EvaluationModel
### Title: EvaluationModel object
### Aliases: EvaluationModel

### ** Examples

## Initialize a EvaluationModel and add objects to it
evaluation.model = EvaluationModel() +
                   Criterion(id = "Marginal power",
                             method = "MarginalPower",
                             tests = tests("Placebo vs treatment"),
                             labels = c("Placebo vs treatment"),
                             par = parameters(alpha = 0.025))



