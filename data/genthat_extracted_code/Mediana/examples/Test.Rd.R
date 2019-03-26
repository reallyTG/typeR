library(Mediana)


### Name: Test
### Title: Test object
### Aliases: Test

### ** Examples

# Analysis model
analysis.model = AnalysisModel() +
                 Test(id = "Placebo vs treatment",
                      samples = samples("Placebo", "Treatment"),
                      method = "TTest")



