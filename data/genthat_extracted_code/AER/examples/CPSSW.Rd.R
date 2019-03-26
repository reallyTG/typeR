library(AER)


### Name: CPSSW
### Title: Stock and Watson CPS Data Sets
### Aliases: CPSSW CPSSW9298 CPSSW9204 CPSSW04 CPSSW3 CPSSW8 CPSSWEducation
### Keywords: datasets

### ** Examples

data("CPSSW3")
with(CPSSW3, interaction.plot(year, gender, earnings))

## Stock and Watson, p. 165
data("CPSSWEducation")
plot(earnings ~ education, data = CPSSWEducation)
fm <- lm(earnings ~ education, data = CPSSWEducation)
coeftest(fm, vcov = sandwich)
abline(fm)



