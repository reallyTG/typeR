library(ivprobit)


### Name: ivprobit
### Title: Instrumental Variables Probit function
### Aliases: ivprobit

### ** Examples

############################################
# Fit the ivprobit model
############################################
# Load data
data(eco)
############################################
pro<-ivprobit(d2~ltass+roe+div|eqrat+bonus|ltass+roe+div+gap+cfa,eco)
summary(pro)




