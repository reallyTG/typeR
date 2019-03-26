library(dLagM)


### Name: ardlDlm
### Title: Implement finite autoregressive distributed lag model
### Aliases: ardlDlm

### ** Examples

# Only one independent series
data(warming)
model.ardl = ardlDlm(x = warming$NoMotorVehicles, 
                     y = warming$Warming, p = 1 , q = 1 )
summary(model.ardl)

# Remove some lags
# Remove some lags
rem.p = c(0,1) # 0 removes the main effect of X.t
rem.q = c(1,3) 
remove = list(p = rem.p , q = rem.q)
model.ardl = ardlDlm(x = warming$NoMotorVehicles, 
                     y = warming$Warming, p = 2 , q = 3 , remove = remove)
summary(model.ardl)

# Multiple independent series
data(M1Germany)
data = M1Germany[1:144,]
model.ardlDlm  = ardlDlm(formula = logprice ~ interest + logm1, 
                         data = data.frame(data) , p = 2 , q = 1 )
summary(model.ardlDlm)

rem.p = list(interest = c(0,2) , logm1 = c(0))
# Remove the main series of interest and logm1 and the secont lag of 
# interest from the model
rem.q = c(1)
remove = list(p = rem.p , q = rem.q)
remove
model.ardlDlm  = ardlDlm(formula = logprice ~ interest + logm1, 
                         data = data.frame(data) , p = 2 , q = 2 , 
                         remove = remove)
summary(model.ardlDlm) 



