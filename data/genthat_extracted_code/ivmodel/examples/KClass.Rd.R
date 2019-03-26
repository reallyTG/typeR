library(ivmodel)


### Name: KClass
### Title: k-Class Estimator
### Aliases: KClass
### Keywords: k-Class estimator Instrumental variables

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
KClass(card.model2IV,
          k=c(0,1,length(Y)/(length(Y) - ncol(X) - ncol(Z) + 1)))




