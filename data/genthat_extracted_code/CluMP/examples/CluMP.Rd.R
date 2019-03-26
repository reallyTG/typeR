library(CluMP)


### Name: CluMP
### Title: Cluster Micro-Panel (longitudinal) Data employing the CluMP
###   algorithm
### Aliases: CluMP
### Keywords: CluMP

### ** Examples

data <- GeneratePanel(n = 100, Param = ParamLinear, NbVisit = 10)
CluMP(formula = Y ~ Time, group = "ID", data = data, cl_numb = 3, base_val = FALSE)

CluMP(formula = Y ~ Time, group = "ID", data = data, cl_numb = 3, base_val = TRUE)





