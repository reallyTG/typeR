library(dLagM)


### Name: MASE
### Title: Compute mean absolute scaled error (MASE) for distributed lag
###   models
### Aliases: MASE

### ** Examples

data(warming)
# Fit a bunch of polynomial DLMs
model.poly1 = polyDlm(x = warming$NoMotorVehicles , y = warming$Warming , 
                     q = 2 , k = 2 , show.beta = TRUE)
model.poly2 = polyDlm(x = warming$NoMotorVehicles , y = warming$Warming , 
                      q = 3 , k = 2 , show.beta = TRUE)
model.poly3 = polyDlm(x = warming$NoMotorVehicles , y = warming$Warming , 
                      q = 4 , k = 2 , show.beta = TRUE)
MASE(model.poly1, model.poly2, model.poly3)

# Fit a bunch of finite DLMs
model.dlm1 = dlm(x = warming$NoMotorVehicles , y = warming$Warming, q =2)
model.dlm2 = dlm(x = warming$NoMotorVehicles , y = warming$Warming, q =3)
model.dlm3 = dlm(x = warming$NoMotorVehicles , y = warming$Warming, q =4)
MASE(model.dlm1, model.dlm2, model.dlm3)

# Fit a linear model
model.lm = lm(Warming ~ NoMotorVehicles , data = warming)
MASE(model.lm)

# Fit a Koyck model
model.koyck = koyckDlm(x = warming$NoMotorVehicles , y = warming$Warming )
MASE(model.koyck)

# Fit a bunch of ARDLs
model.ardl1 = ardlDlm(x = warming$NoMotorVehicles , y = warming$Warming, p=1, q=2)
model.ardl2 = ardlDlm(x = warming$NoMotorVehicles , y = warming$Warming, p=2, q=2)
model.ardl3 = ardlDlm(x = warming$NoMotorVehicles , y = warming$Warming, p=3, q=2)
MASE(model.ardl1 , model.ardl2 , model.ardl3)

# Find MASEs of different model objects
MASE(model.ardl1 , model.dlm1 , model.poly1, model.lm)



