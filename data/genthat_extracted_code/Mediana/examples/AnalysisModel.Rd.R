library(Mediana)


### Name: AnalysisModel
### Title: AnalysisModel object
### Aliases: AnalysisModel

### ** Examples

## Initialize an AnalysisModel and add objects to it
analysis.model = AnalysisModel() +
                 Test(id = "Placebo vs treatment",
                      samples = samples("Placebo", "Treatment"),
                      method = "TTest")



