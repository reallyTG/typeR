library(CluMP)


### Name: CluMP_view
### Title: Cluster profiles' (CluMP results) visualisation
### Aliases: CluMP_view
### Keywords: CluMP

### ** Examples

dataMale <- GeneratePanel(n = 50, Param = ParamLinear, NbVisit = 10)
dataMale$Gender <- "M"
dataFemale <- GeneratePanel(n = 50, Param = ParamLinear, NbVisit = 10)
dataFemale$ID <- dataFemale$ID + 50
dataFemale$Gender <- "F"
data <- rbind(dataMale, dataFemale)

CluMPoutput <- CluMP(formula = Y ~ Time, group = "ID", data = data, cl_numb = 3)
title <- "Plotting clusters' representatives with error bars"
CluMP_view(CluMPoutput, type = "all" , return_table = TRUE, title = title)
CluMP_view(CluMPoutput, type = "cont")
CluMP_view(CluMPoutput, type = "breaks", nb_intervals = 5, return_table=TRUE)




