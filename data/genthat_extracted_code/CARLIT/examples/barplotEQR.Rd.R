library(CARLIT)


### Name: barplotEQR
### Title: Plot Results of the carlit() Function.
### Aliases: barplotEQR
### Keywords: CARLIT EQR

### ** Examples

data(Community_data)
data(Sensitivity_list)
data(EQR_reference)
Results <- carlit(Community_data, Sensitivity_list, EQR_reference)
Results
barplotEQR(Results)



