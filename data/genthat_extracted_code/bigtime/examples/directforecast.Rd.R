library(bigtime)


### Name: directforecast
### Title: Function to obtain h-step ahead direct forecast based on
###   estimated VAR, VARX or VARMA model
### Aliases: directforecast

### ** Examples

data(Y)
VARfit <- sparseVAR(Y) # sparse VAR
VARforecast <- directforecast(fit=VARfit, model="VAR", h=1)



