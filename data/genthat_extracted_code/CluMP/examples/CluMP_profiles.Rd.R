library(CluMP)


### Name: CluMP_profiles
### Title: Summary characteristics of identified clusters via CluMP
### Aliases: CluMP_profiles
### Keywords: CluMP

### ** Examples

dataMale <- GeneratePanel(n = 50, Param = ParamLinear, NbVisit = 10)
dataMale$Gender <- "M"
dataFemale <- GeneratePanel(n = 50, Param = ParamLinear, NbVisit = 10)
dataFemale$ID <- dataFemale$ID + 50
dataFemale$Gender <- "F"
data <- rbind(dataMale, dataFemale)

CLUMP3 <- CluMP(formula = Y ~ Time, group = "ID", data = data, cl_numb = 3)
CluMP_profiles(CLUMP3, cat_vars = "Gender")




