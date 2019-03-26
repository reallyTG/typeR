library(HSAUR)


### Name: plasma
### Title: Blood Screening Data
### Aliases: plasma
### Keywords: datasets

### ** Examples


  data("plasma", package = "HSAUR")
  layout(matrix(1:2, ncol = 2))
  boxplot(fibrinogen ~ ESR, data = plasma, varwidth = TRUE)
  boxplot(globulin ~ ESR, data = plasma, varwidth = TRUE)




