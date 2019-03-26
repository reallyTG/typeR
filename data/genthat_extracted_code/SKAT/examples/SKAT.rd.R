library(SKAT)


### Name: SKAT
### Title: SNP-set (Sequence) Kernel Association Test
### Aliases: SKAT SKAT.SSD.OneSet SKAT.SSD.OneSet_SetIndex

### ** Examples



data(SKAT.example)
attach(SKAT.example)



#############################################################
#	SKAT with default Beta(1,25) Weights 
#		- without covariates

# continuous trait
obj<-SKAT_Null_Model(y.c ~ 1, out_type="C")
SKAT(Z, obj)$p.value

# dichotomous trait 
obj<-SKAT_Null_Model(y.b ~ 1, out_type="D")
SKAT(Z, obj)$p.value


##################################################
#	SKAT with default Beta(1,25) Weights
#		- with covariates

# continuous trait
obj<-SKAT_Null_Model(y.c ~ X, out_type="C")
SKAT(Z, obj)$p.value

obj.b<-SKAT_Null_Model(y.b ~ X, out_type="D")
SKAT(Z, obj.b)$p.value

##################################################
#	SKAT with default Beta(1,25) Weights
#		- Optimal Test

SKAT(Z, obj, method="optimal.adj")$p.value

# you can get the same p-value by using method="SKATO"
SKAT(Z, obj, method="SKATO")$p.value

#############################################################
#	SKAT with Beta(1,30) Weights

SKAT(Z, obj, weights.beta=c(1,30))$p.value





