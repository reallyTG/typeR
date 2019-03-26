library(BayLum)


### Name: Age_OSLC14
### Title: Bayesian analysis for age estimation of OSL measerments and C-14
###   ages of various samples
### Aliases: Age_OSLC14

### ** Examples

## Load data
# OSL data
data(DATA1,envir = environment())
data(DATA2,envir = environment())
Data <- combine_DataFiles(DATA2,DATA1)

# 14C data
C14Cal <- DATA_C14$C14[1,1]
SigmaC14Cal <- DATA_C14$C14[1,2]
Names <- DATA_C14$Names[1]

# Prior Age
prior=rep(c(1,60),3)
samplenature=matrix(data=c(1,0,1,0,1,0),ncol=3,nrow=2,byrow=TRUE)
SC <- matrix(data=c(1,1,1,0,1,1,0,0,1,0,0,0),ncol=3,nrow=4,byrow=TRUE)

## Age computation of samples
Age <- Age_OSLC14(DATA=Data,Data_C14Cal=C14Cal,Data_SigmaC14Cal=SigmaC14Cal,
   SampleNames=c("GDB5",Names,"GDB3"),Nb_sample=3,SampleNature=samplenature,
   PriorAge=prior,StratiConstraints=SC,Iter=50,n.chains=2)



