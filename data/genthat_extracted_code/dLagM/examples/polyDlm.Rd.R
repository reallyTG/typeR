library(dLagM)


### Name: polyDlm
### Title: Implement finite polynomial distributed lag model
### Aliases: polyDlm

### ** Examples

data(warming)
model.poly = polyDlm(x = warming$NoMotorVehicles , y = warming$Warming , 
q = 2 , k = 2 , show.beta = TRUE)
summary(model.poly)



