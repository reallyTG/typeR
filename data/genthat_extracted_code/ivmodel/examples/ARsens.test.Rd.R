library(ivmodel)


### Name: ARsens.test
### Title: Sensitivity Analysis for the Anderson-Rubin (1949) Test
### Aliases: ARsens.test
### Keywords: Anderson-Rubin (1949) test Sensitivity analysis

### ** Examples

data(card.data)
Y=card.data[,"lwage"]
D=card.data[,"educ"]
Z=card.data[,"nearc4"]
Xname=c("exper", "expersq", "black", "south", "smsa", "reg661", 
        "reg662", "reg663", "reg664", "reg665", "reg666", "reg667", 
		"reg668", "smsa66")
X=card.data[,Xname]
foo = ivmodel(Y=Y,D=D,Z=Z,X=X)
ARsens.test(foo, deltarange=c(-0.03, 0.03))



