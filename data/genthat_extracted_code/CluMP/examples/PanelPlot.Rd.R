library(CluMP)


### Name: PanelPlot
### Title: Plot Micro-Panel (longitudinal) Data
### Aliases: PanelPlot
### Keywords: CLUMP

### ** Examples

dataMale <- GeneratePanel(n = 50, Param = ParamLinear, NbVisit = 10)
dataMale$Gender <- "M"
dataFemale <- GeneratePanel(n = 50, Param = ParamLinear, NbVisit = 10)
dataFemale$ID <- dataFemale$ID + 50
dataFemale$Gender <- "F"
data <- rbind(dataMale, dataFemale)

PanelPlot(data = data, formula = Y ~ Time, group = "ID", color = "Gender")




