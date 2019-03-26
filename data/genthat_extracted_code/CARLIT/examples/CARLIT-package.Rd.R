library(CARLIT)


### Name: CARLIT-package
### Title: Ecological Quality Ratios Calculation and Plot
### Aliases: CARLIT-package CARLIT
### Keywords: CARLIT EQR

### ** Examples

data(Community_data)
data(Sensitivity_list)
data(EQR_reference)
Results <- carlit(Community_data, Sensitivity_list, EQR_reference)
Results
barplotEQR(Results)



