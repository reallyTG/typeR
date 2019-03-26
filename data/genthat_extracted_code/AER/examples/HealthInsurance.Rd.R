library(AER)


### Name: HealthInsurance
### Title: Medical Expenditure Panel Survey Data
### Aliases: HealthInsurance
### Keywords: datasets

### ** Examples

data("HealthInsurance")
summary(HealthInsurance)
prop.table(xtabs(~ selfemp + insurance, data = HealthInsurance), 1)



