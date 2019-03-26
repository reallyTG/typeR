library(CARLIT)


### Name: carlit
### Title: Ecological Quality Ratios
### Aliases: carlit
### Keywords: CARLIT EQR

### ** Examples

data(Community_data)
data(Sensitivity_list)
data(EQR_reference)
Results <- carlit(Community_data, Sensitivity_list, EQR_reference)
Results
barplotEQR(Results)



