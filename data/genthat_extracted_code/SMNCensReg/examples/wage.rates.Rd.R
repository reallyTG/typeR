library(SMNCensReg)


### Name: wage.rates
### Title: Wage Rates of 753 Women
### Aliases: wage.rates
### Keywords: datasets

### ** Examples

##Load the data
data(wage.rates)

##Set the response y and covariate x
y <- wage.rates$wage
x <- cbind(wage.rates$age,wage.rates$educ,wage.rates$kidslt6,wage.rates$kidsge6)
cc<- c(rep(0,428),rep(1,325))

##Fits a left censored Student-t model to the data

T <- CensReg.SMN(cc,x,y,nu=3,cens="left",dist="T",show.envelope="TRUE")

##Fits a left censored Normal model to the data

Normal <- CensReg.SMN(cc,x,y,cens="left",dist="Normal",show.envelope="TRUE")



