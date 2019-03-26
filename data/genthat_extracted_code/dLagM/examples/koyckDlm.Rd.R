library(dLagM)


### Name: koyckDlm
### Title: Implement distributed lag models with Koyck transformation
### Aliases: koyckDlm

### ** Examples

data(warming)
model.koyck = koyckDlm(x = warming$NoMotorVehicles , 
                       y = warming$Warming)
summary(model.koyck)                       



