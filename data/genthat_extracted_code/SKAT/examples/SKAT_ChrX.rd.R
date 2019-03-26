library(SKAT)


### Name: SKAT_ChrX
### Title: SNP-set (Sequence) Kernel Association Test for X chromosome
###   variables
### Aliases: SKAT_ChrX

### ** Examples




data(SKAT.example.ChrX)
attach(SKAT.example.ChrX)

#############################################################
#	Compute the P-value of SKAT 

# binary trait
obj.x<-SKAT_Null_Model_ChrX(y ~ x1 +x2 + Gender, SexVar="Gender", out_type="D")

# SKAT
SKAT_ChrX(Z, obj.x, kernel = "linear.weighted")

# Burden
SKAT_ChrX(Z, obj.x, kernel = "linear.weighted", r.corr=1)

# SKAT-O
SKAT_ChrX(Z, obj.x, kernel = "linear.weighted", method="SKATO")







