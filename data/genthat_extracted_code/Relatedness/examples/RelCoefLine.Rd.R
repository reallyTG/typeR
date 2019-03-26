library(Relatedness)


### Name: RelCoefLine
### Title: Relatedness Coefficients Estimation for Lines
### Aliases: RelCoefLine
### Keywords: Relatedness

### ** Examples

require('Relatedness')
data(Genotype)
data(Frequencies)
data(Cross)
SimpleRelatedness <- RelCoefLine(LineGenom=Genotype,Freq=Frequencies,
LinePop=rep(1,8),NbCores=2)
print(SimpleRelatedness)



