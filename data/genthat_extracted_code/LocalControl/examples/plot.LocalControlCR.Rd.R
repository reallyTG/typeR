library(LocalControl)


### Name: plot.LocalControlCR
### Title: Plot cumulative incidence functions (CIFs) from Local Control.
### Aliases: plot.LocalControlCR

### ** Examples

data("cardSim")
results = LocalControl(data = cardSim,
                       outcomeType = "survival",
                       outcomeColName = "status",
                       timeColName = "time",
                       treatmentColName = "drug",
                       treatmentCode = 1,
                       clusterVars = c("age", "bmi"))
plot(results)




