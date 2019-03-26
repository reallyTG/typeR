library(dLagM)


### Name: dlm
### Title: Implement finite distributed lag model
### Aliases: dlm

### ** Examples

# Only one independent series
data(warming)
model.dlm = dlm(x = warming$NoMotorVehicles , 
                y = warming$Warming , q = 2)
summary(model.dlm)

removed = list(x = c(1,3))
model.dlm = dlm(x = warming$NoMotorVehicles , 
                y = warming$Warming , q = 5,
                remove = removed)
summary(model.dlm)

removed = list(x = c(0,1,3))
model.dlm = dlm(x = warming$NoMotorVehicles , 
                y = warming$Warming , q = 5,
                remove = removed)
summary(model.dlm)

model.dlm = dlm(formula = Warming ~ NoMotorVehicles , 
                data = warming , q = 2)
summary(model.dlm)

removed = list(x = c(0,3))
model.dlm = dlm(formula = Warming ~ NoMotorVehicles , 
                data = warming , q = 4,
                remove = removed)
summary(model.dlm)

# Multiple independent series
data(M1Germany)
data = M1Germany[1:144,]
model.dlm  = dlm(formula = logprice ~ interest + logm1, 
                 data = data.frame(data) , q = 4)
summary(model.dlm)

removed = list(interest = c(1,3), logm1 = c(2))
removed
model.dlm  = dlm(formula = logprice ~ interest + logm1, 
                 data = data.frame(data) , q = 4 , remove = removed)
summary(model.dlm)

removed = list(interest = c(0,1,3), logm1 = c(0,2))
removed
model.dlm  = dlm(formula = logprice ~ interest + logm1, 
                 data = data.frame(data) , q = 4 , remove = removed)
summary(model.dlm)

removed = list( logm1 = c(1,2))
removed
model.dlm  = dlm(formula = logprice ~ interest + logm1, 
                 data = data.frame(data) , q = 4 , remove = removed)
summary(model.dlm)



