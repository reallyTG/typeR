library(dfpk)


### Name: pk.estim
### Title: The pharmacokinetic's (PK) measure of exposure.
### Aliases: pk.estim

### ** Examples

par <- c(2,10,100) 
conc <- c(20,30,40,50,60,70)
t <- seq(0,24,length.out=48)
dose <- c(12.59972,34.65492,44.69007,60.80685,83.68946,100.37111)
pk.estim(par,t,dose,conc)



