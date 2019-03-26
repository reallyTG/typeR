library(Rfit)


### Name: CardioRiskFactors
### Title: Cardiovascular risk factors
### Aliases: CardioRiskFactors
### Keywords: datasets

### ** Examples

data(CardioRiskFactors)
fitF<-rfit(Uric~bmi+sys+choles+ldl+sex+smok+alco+apoa+trig+age,data=CardioRiskFactors)
fitR<-rfit(Uric~bmi+sys+choles+ldl+sex,data=CardioRiskFactors)
drop.test(fitF,fitR)
summary(fitR)



