library(Mediana)


### Name: Statistic
### Title: Statistic object
### Aliases: Statistic

### ** Examples

# Analysis model
analysis.model = AnalysisModel() +
                 Test(id = "Placebo vs treatment",
                      samples = samples("Placebo", "Treatment"),
                      method = "TTest") +
                 Statistic(id = "Mean Treatment",
                           method = "MeanStat",
                           samples = samples("Treatment"))



