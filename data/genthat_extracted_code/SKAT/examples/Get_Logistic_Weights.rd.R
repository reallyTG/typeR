library(SKAT)


### Name: Get_Logistic_Weights
### Title: Get the logistic weight
### Aliases: Get_Logistic_Weights Get_Logistic_Weights_MAF

### ** Examples



data(SKAT.example)
attach(SKAT.example)


#############################################################
#	Compute the P-value of SKAT with the logistic Weight (par1=0.07, par2=150)

# Use logistic weight
obj<-SKAT_Null_Model(y.c ~ X, out_type="C")
weights<-Get_Logistic_Weights(Z, par1=0.07, par2=150)
SKAT(Z, obj, kernel = "linear.weighted", weights=weights)$p.value

# Weights function
MAF<-colMeans(Z)/2
plot(MAF,weights)





