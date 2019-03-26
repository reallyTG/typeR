library(SKAT)


### Name: SKAT_Null_Model
### Title: Get parameters and residuals from the NULL model
### Aliases: SKAT_Null_Model SKAT_Null_Model_ChrX

### ** Examples



data(SKAT.example)
attach(SKAT.example)

#############################################################
#	Compute the P-value of SKAT 

# binary trait
obj<-SKAT_Null_Model(y.b ~ X, out_type="D")
SKAT(Z, obj, kernel = "linear.weighted")$p.value


#############################################################
# 	When you have no covariate to adjust.

# binary trait
obj<-SKAT_Null_Model(y.b ~ 1, out_type="D")
SKAT(Z, obj, kernel = "linear.weighted")$p.value



#########################################################
# Small sample adjustment
IDX<-c(1:100,1001:1100)

# With-adjustment
obj<-SKAT_Null_Model(y.b[IDX] ~ X[IDX,],out_type="D")
SKAT(Z[IDX,], obj, kernel = "linear.weighted")$p.value

# Without-adjustment
obj<-SKAT_Null_Model(y.b[IDX] ~ X[IDX,],out_type="D", Adjustment=FALSE)
SKAT(Z[IDX,], obj, kernel = "linear.weighted")$p.value

#########################################################
# 	Use SKATBinary 

SKATBinary(Z[IDX,], obj, kernel = "linear.weighted")$p.value





