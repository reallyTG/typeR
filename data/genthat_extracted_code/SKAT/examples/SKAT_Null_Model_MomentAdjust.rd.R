library(SKAT)


### Name: SKAT_Null_Model_MomentAdjust
### Title: Get parameters and residuals from the NULL model for small
###   sample adjustment
### Aliases: SKAT_Null_Model_MomentAdjust

### ** Examples



data(SKAT.example)
attach(SKAT.example)

#############################################################
#	Compute the P-value of SKAT 

IDX<-c(1:100,1001:1100)

# binary trait
obj<-SKAT_Null_Model_MomentAdjust(y.b[IDX] ~ X[IDX,])
SKAT(Z[IDX,], obj, kernel = "linear.weighted")$p.value





