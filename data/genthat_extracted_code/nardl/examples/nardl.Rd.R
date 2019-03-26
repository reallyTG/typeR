library(nardl)


### Name: nardl
### Title: Nonlinear ARDL function
### Aliases: nardl

### ** Examples


############################################
# Fit the nonlinear cointegrating autoregressive distributed lag model
############################################
# Load data
data(fod)
############################################
#example 1: nardl with fixed p and q lags
############################################
reg<-nardl(food~inf,p=4,q=4,fod,ic="aic",maxlags = FALSE,graph = FALSE,case=3)
summary(reg)

############################################
# example 2:auto selected lags (maxlags=TRUE)
############################################
reg<-nardl(food~inf,fod,ic="aic",maxlags = TRUE,graph = FALSE,case=3)
summary(reg)

############################################
# example 3: Cusum and CusumQ plot (graph=TRUE)
############################################
reg<-nardl(food~inf,fod,ic="aic",maxlags = TRUE,graph = TRUE,case=3)




