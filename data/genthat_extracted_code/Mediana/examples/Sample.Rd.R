library(Mediana)


### Name: Sample
### Title: Sample object
### Aliases: Sample

### ** Examples

# Outcome parameter set 1
outcome1.placebo = parameters(mean = 0, sd = 70)
outcome1.treatment = parameters(mean = 40, sd = 70)

# Outcome parameter set 2
outcome2.placebo = parameters(mean = 0, sd = 70)
outcome2.treatment = parameters(mean = 50, sd = 70)

# Data model
case.study1.data.model = DataModel() +
                         OutcomeDist(outcome.dist = "NormalDist") +
                         SampleSize(c(50, 55, 60, 65, 70)) +
                         Sample(id = "Placebo",
                                outcome.par = parameters(outcome1.placebo, outcome2.placebo)) +
                         Sample(id = "Treatment",
                                outcome.par = parameters(outcome1.treatment, outcome2.treatment))



