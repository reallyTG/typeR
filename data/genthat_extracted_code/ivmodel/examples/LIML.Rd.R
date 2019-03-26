library(ivmodel)


### Name: LIML
### Title: Limited Information Maximum Likelihood Ratio (LIML) Estimator
### Aliases: LIML
### Keywords: Limited information maximum likelihood (LIML) estimator
###   Instrumental variables

### ** Examples

data(card.data)
Y=card.data[,"lwage"]
D=card.data[,"educ"]
Z=card.data[,c("nearc4","nearc2")]
Xname=c("exper", "expersq", "black", "south", "smsa", "reg661", 
        "reg662", "reg663", "reg664", "reg665", "reg666", "reg667", 
		"reg668", "smsa66")
X=card.data[,Xname]
card.model2IV = ivmodel(Y=Y,D=D,Z=Z,X=X)
LIML(card.model2IV,alpha=0.01)



