### R code from vignette source 'SKAT.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: data
###################################################
library(SKAT)
data(SKAT.example)
names(SKAT.example)

attach(SKAT.example)


###################################################
### code chunk number 2: SKAT1
###################################################
# continuous trait 
obj<-SKAT_Null_Model(y.c ~ X, out_type="C")
SKAT(Z, obj)$p.value

# dichotomous trait 
obj<-SKAT_Null_Model(y.b ~ X, out_type="D")
SKAT(Z, obj)$p.value



###################################################
### code chunk number 3: SKAT11
###################################################

IDX<-c(1:100,1001:1100)	
# With-adjustment
obj.s<-SKAT_Null_Model(y.b[IDX] ~ X[IDX,],out_type="D")
SKAT(Z[IDX,], obj.s, kernel = "linear.weighted")$p.value



###################################################
### code chunk number 4: SKAT12
###################################################
# Without-adjustment
obj.s<-SKAT_Null_Model(y.b[IDX] ~ X[IDX,],out_type="D", Adjustment=FALSE)
SKAT(Z[IDX,], obj.s, kernel = "linear.weighted")$p.value


###################################################
### code chunk number 5: SKAT22
###################################################

# default hybrid approach 
out<-SKATBinary(Z[IDX,], obj.s, kernel = "linear.weighted")
out$p.value



###################################################
### code chunk number 6: SKAT3
###################################################
SKAT(Z, obj, kernel = "linear.weighted", weights.beta=c(0.5,0.5))$p.value


###################################################
### code chunk number 7: SKAT4
###################################################
# Shape of the logistic weight

MAF<-1:1000/1000
W<-Get_Logistic_Weights_MAF(MAF, par1=0.07, par2=150)
par(mfrow=c(1,2))
plot(MAF,W,xlab="MAF",ylab="Weights",type="l")
plot(MAF[1:100],W[1:100],xlab="MAF",ylab="Weights",type="l")
par(mfrow=c(1,2))

# Use logistic weight
weights<-Get_Logistic_Weights(Z, par1=0.07, par2=150)
SKAT(Z, obj, kernel = "linear.weighted", weights=weights)$p.value


###################################################
### code chunk number 8: SKAT41
###################################################
#rho=0, SKAT
SKAT(Z, obj, r.corr=0)$p.value

#rho=0.9
SKAT(Z, obj, r.corr=0.9)$p.value

#rho=1, Burden test
SKAT(Z, obj, r.corr=1)$p.value


###################################################
### code chunk number 9: SKAT42
###################################################

#Optimal Test
SKAT(Z, obj, method="SKATO")$p.value



###################################################
### code chunk number 10: SKAT43
###################################################
# Combined sum test (SKAT-C and Burden-C)

SKAT_CommonRare(Z, obj)$p.value
SKAT_CommonRare(Z, obj, r.corr.rare=1, r.corr.common=1 )$p.value

# Adaptive test (SKAT-A and Burden-A)

SKAT_CommonRare(Z, obj, method="A")$p.value
SKAT_CommonRare(Z, obj, r.corr.rare=1, r.corr.common=1, method="A" )$p.value



###################################################
### code chunk number 11: SKAT5
###################################################
# Assign missing 
Z1<-Z
Z1[1,1:3]<-NA

# bestguess imputation
SKAT(Z1,obj,impute.method = "bestguess")$p.value

# fixed imputation
SKAT(Z1,obj,impute.method = "fixed")$p.value

# random imputation
SKAT(Z1,obj,impute.method = "random")$p.value




###################################################
### code chunk number 12: SKAT6
###################################################
# parametric boostrap.
obj<-SKAT_Null_Model(y.b ~ X, out_type="D", n.Resampling=5000, 
type.Resampling="bootstrap")

# SKAT p-value
re<- SKAT(Z, obj, kernel = "linear.weighted")
re$p.value	# SKAT p-value
Get_Resampling_Pvalue(re)	# get resampling p-value

detach(SKAT.example)


###################################################
### code chunk number 13: SKATKin1
###################################################
data(SKAT.fam.example)
attach(SKAT.fam.example)

# K: kinship matrix 
obj<-SKAT_NULL_emmaX(y ~ X, K=K)
SKAT(Z, obj)$p.value

# SKAT-O
SKAT(Z, obj, method="SKATO")$p.value	

detach(SKAT.fam.example)


###################################################
### code chunk number 14: SKATX1
###################################################
data(SKAT.example.ChrX)
attach(SKAT.example.ChrX)

Z = SKAT.example.ChrX$Z
#############################################################
#	Compute the P-value of SKAT 

# binary trait
obj.x<-SKAT_Null_Model_ChrX(y ~ x1 +x2 + Gender, SexVar="Gender", out_type="D", data=SKAT.example.ChrX)

# run SKAT-O
SKAT_ChrX(Z, obj.x, method="SKATO")$p.value
detach(SKAT.example.ChrX)


###################################################
### code chunk number 15: SKAT_B1
###################################################
# To run this code, first download and unzip example files

##############################################
# 	Generate SSD file

# Create the MW File
File.Bed<-"./Example1.bed"
File.Bim<-"./Example1.bim"
File.Fam<-"./Example1.fam"
File.SetID<-"./Example1.SetID"
File.SSD<-"./Example1.SSD"
File.Info<-"./Example1.SSD.info"

# To use binary ped files, you have to generate SSD file first.
# If you already have a SSD file, you do not need to call this function. 
Generate_SSD_SetID(File.Bed, File.Bim, File.Fam, File.SetID, File.SSD, File.Info)


###################################################
### code chunk number 16: SKAT_B2
###################################################
FAM<-Read_Plink_FAM(File.Fam, Is.binary=FALSE)
y<-FAM$Phenotype

# To use a SSD file, please open it first. After finishing using it, you must close it.
 
SSD.INFO<-Open_SSD(File.SSD, File.Info)

# Number of samples 
SSD.INFO$nSample 

# Number of Sets
SSD.INFO$nSets

obj<-SKAT_Null_Model(y ~ 1, out_type="C")


###################################################
### code chunk number 17: SKAT_B21
###################################################
out<-SKAT.SSD.All(SSD.INFO, obj)


###################################################
### code chunk number 18: SKAT_B22
###################################################
out


###################################################
### code chunk number 19: SKAT_B2Cov
###################################################
File.Cov<-"./Example1.Cov"
FAM_Cov<-Read_Plink_FAM_Cov(File.Fam, File.Cov, Is.binary=FALSE)

# First 5 rows
FAM_Cov[1:5,]

# Run with covariates
X1 = FAM_Cov$X1
X2 = FAM_Cov$X2
y<-FAM_Cov$Phenotype

obj<-SKAT_Null_Model(y ~ X1 + X2, out_type="C")


###################################################
### code chunk number 20: SKAT_B2Cov1
###################################################
out<-SKAT.SSD.All(SSD.INFO, obj)


###################################################
### code chunk number 21: SKAT_B2Cov2
###################################################
out


###################################################
### code chunk number 22: SKAT_B2Weight
###################################################

# Custom weight
# File: Example1_Weight.txt
obj.SNPWeight<-Read_SNP_WeightFile("./Example1_Weight.txt")


###################################################
### code chunk number 23: SKAT_B2Weight1
###################################################
out<-SKAT.SSD.All(SSD.INFO, obj, obj.SNPWeight=obj.SNPWeight)


###################################################
### code chunk number 24: SKAT_B2Weight2
###################################################
out


###################################################
### code chunk number 25: SKAT_B2Save
###################################################

output.df = out$results
write.table(output.df, file="./save.txt", col.names=TRUE, row.names=FALSE)



###################################################
### code chunk number 26: SKAT_B3
###################################################
obj<-SKAT_Null_Model(y ~ 1, out_type="C", n.Resampling=1000, type.Resampling="bootstrap")
out<-SKAT.SSD.All(SSD.INFO, obj)


###################################################
### code chunk number 27: SKAT_B31
###################################################
# No gene is significant with controling FWER = 0.05
Resampling_FWER(out,FWER=0.05)

# 1 gene is significnat with controling FWER = 0.5
Resampling_FWER(out,FWER=0.5)


###################################################
### code chunk number 28: SKAT_B4
###################################################

obj<-SKAT_Null_Model(y ~ 1, out_type="C")

# test the second gene
id<-2
SetID<-SSD.INFO$SetInfo$SetID[id]
SKAT.SSD.OneSet(SSD.INFO,SetID, obj)$p.value
 
SKAT.SSD.OneSet_SetIndex(SSD.INFO,id, obj)$p.value

# test the second gene with the logistic weight.
Z<-Get_Genotypes_SSD(SSD.INFO, id)
weights = Get_Logistic_Weights(Z, par1=0.07, par2=150)
SKAT(Z, obj, weights=weights)$p.value



###################################################
### code chunk number 29: SKAT_B5
###################################################

# test all genes in SSD file
obj<-SKAT_Null_Model(y ~ X1 + X2, out_type="C")
out<-SKAT_CommonRare.SSD.All(SSD.INFO, obj)



###################################################
### code chunk number 30: SKAT_B51
###################################################
out


###################################################
### code chunk number 31: SKAT_B5
###################################################
Close_SSD()


###################################################
### code chunk number 32: SKAT_BB1
###################################################

# File names
File.Bed<-"./SKATBinary.example.bed"
File.Bim<-"./SKATBinary.example.bim"
File.Fam<-"./SKATBinary.example.fam"
File.Cov<-"./SKATBinary.example.cov"
File.SetID<-"./SKATBinary.example.SetID"
File.SSD<-"./SKATBinary.example.SSD"
File.Info<-"./SKATBinary.example.SSD.info"

# Generate SSD file, and read fam and cov files
# If you already have a SSD file, you do not need to call this function. 
Generate_SSD_SetID(File.Bed, File.Bim, File.Fam, File.SetID, File.SSD, File.Info)
FAM<-Read_Plink_FAM_Cov(File.Fam, File.Cov, Is.binary=TRUE, cov_header=FALSE)

# open SSD files
 
SSD.INFO<-Open_SSD(File.SSD, File.Info)

# No adjustment is needed
obj<-SKAT_Null_Model(Phenotype ~ COV1 + COV2, out_type="D", data=FAM, Adjustment=FALSE)


###################################################
### code chunk number 33: SKAT_BB1
###################################################
# SKAT
out.skat<-SKATBinary.SSD.All(SSD.INFO, obj, method="SKAT")

# SKAT-O
out.skato<-SKATBinary.SSD.All(SSD.INFO, obj, method="SKATO")


###################################################
### code chunk number 34: SKAT_BB2
###################################################
# First 5 variant sets, SKAT
out.skat$results[1:5,]



###################################################
### code chunk number 35: SKAT_BB2
###################################################

# Effective number of test is smaller than 30 (number of variant sets)
# Use SKAT results
Get_EffectiveNumberTest(out.skat$results$MAP, alpha=0.05)

# QQ plot
QQPlot_Adj(out.skat$results$P.value, out.skat$results$MAP)



###################################################
### code chunk number 36: data
###################################################
data(SKAT.haplotypes)
names(SKAT.haplotypes)

attach(SKAT.haplotypes)


###################################################
### code chunk number 37: SKAT_P1
###################################################
set.seed(500)
out.c<-Power_Continuous(Haplotype,SNPInfo$CHROM_POS, SubRegion.Length=5000,    
Causal.Percent= 20, N.Sim=10, MaxBeta=2,Negative.Percent=20)
out.b<-Power_Logistic(Haplotype,SNPInfo$CHROM_POS, SubRegion.Length=5000,   
Causal.Percent= 20, N.Sim=10 ,MaxOR=7, Negative.Percent=20)

out.c
out.b

Get_RequiredSampleSize(out.c, Power=0.8)
Get_RequiredSampleSize(out.b, Power=0.8)



###################################################
### code chunk number 38: SKAT_P2
###################################################
set.seed(500)
out.c<-Power_Continuous_R(Haplotype,SNPInfo$CHROM_POS, SubRegion.Length=5000,    
Causal.Percent= 20, N.Sim=10, MaxBeta=2,Negative.Percent=20, r.corr=2)

out.c

Get_RequiredSampleSize(out.c, Power=0.8)



