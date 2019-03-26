library(ivmodel)


### Name: ivmodelFormula
### Title: Fitting Instrumental Variables (IV) Models
### Aliases: ivmodelFormula
### Keywords: Instrumental variables kClass estimation Anderson-Rubin test
###   Sensitivity analysis with Anderson-Rubin test Conditional likelihood
###   ratio test

### ** Examples

data(card.data)
# One instrument #
Y=card.data[,"lwage"]
D=card.data[,"educ"]
Z=card.data[,"nearc4"]
Xname=c("exper", "expersq", "black", "south", "smsa", "reg661", 
        "reg662", "reg663", "reg664", "reg665", "reg666", "reg667", 
		"reg668", "smsa66")
X=card.data[,Xname]
card.model1IV = ivmodelFormula(lwage ~ educ + exper + expersq + black + 
                                south + smsa + reg661 + 
                                reg662 + reg663 + reg664 + 
                                reg665 + reg666 + reg667 + 
                                reg668 + smsa66 | nearc4 + 
                                exper + expersq + black + 
                                south + smsa + reg661 + 
                                reg662 + reg663 + reg664 + 
                                reg665 + reg666 + reg667 + 
                                reg668 + smsa66,data=card.data)
card.model1IV

# Multiple instruments
Z = card.data[,c("nearc4","nearc2")]
card.model2IV = ivmodelFormula(lwage ~ educ + exper + expersq + black + 
                                south + smsa + reg661 + 
                                reg662 + reg663 + reg664 + 
                                reg665 + reg666 + reg667 + 
                                reg668 + smsa66 | nearc4 + nearc2 +
                                exper + expersq + black + 
                                south + smsa + reg661 + 
                                reg662 + reg663 + reg664 + 
                                reg665 + reg666 + reg667 + 
                                reg668 + smsa66,data=card.data)
card.model2IV



