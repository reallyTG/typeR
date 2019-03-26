library(GeneralOaxaca)


### Name: GeneralOaxaca
### Title: General Blinder-Oaxaca Decomposition
### Aliases: GeneralOaxaca
### Keywords: Oaxaca decomposition

### ** Examples

data("chicago")
chicago$real.wage=exp(chicago$ln.real.wage)
formula=ln.real.wage~ age + female + LTHS + some.college + college + 
advanced.degree

# exemple with gamma distribution
BO_A <- GeneralOaxaca(formula,  family= Gamma, data=chicago, 
groupInd=chicago$foreign.born,B=100)
BO_A$twofold 
BO_A$regoutput$GroupA 
BO_A$threefold 




