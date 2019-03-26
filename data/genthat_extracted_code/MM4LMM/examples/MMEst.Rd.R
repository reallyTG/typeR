library(MM4LMM)


### Name: MMEst
### Title: MM inference method for variance component mixed models
### Aliases: MMEst
### Keywords: ~kwd1 ~kwd2

### ** Examples

require('MM4LMM')

#### Example 1: variance component analysis, 1 model
data(VarianceComponentExample)
DataHybrid <- VarianceComponentExample$Data
KinF <- VarianceComponentExample$KinshipF
KinD <- VarianceComponentExample$KinshipD

##Build incidence matrix for each random effect
Zf <- t(sapply(as.character(DataHybrid$CodeFlint), function(x)
  as.numeric(rownames(KinF)==x)))
Zd <- t(sapply(as.character(DataHybrid$CodeDent), function(x)
  as.numeric(rownames(KinD)==x)))

##Build the VarList and ZList objects
VL = list(Flint=KinF , Dent=KinD , Error = diag(1,nrow(DataHybrid)))
ZL <- list(Flint=Zf , Dent=Zd , Error = diag(1,nrow(DataHybrid)))

##Perform inference
#A first way to call MMEst
ResultVA <- MMEst(Y=DataHybrid$Trait  , Cofactor = matrix(DataHybrid$Trial)
                  , ZList = ZL  ,  VarList = VL)
length(ResultVA)
print(ResultVA)

#A second way to call MMEst (same result)
Formula <- as.formula('~ Trial')
ResultVA2 <- MMEst(Y=DataHybrid$Trait  , Cofactor = DataHybrid,
                   formula = Formula
                  , ZList = ZL  ,  VarList = VL)
length(ResultVA2)
print(ResultVA2)



#### Example 2: Marker Selection with interaction between Cofactor and X matrix
Formula <- as.formula('~ Trial+Xeffect+Xeffect:Trial')
ResultVA3 <- MMEst(Y=DataHybrid$Trait  , Cofactor = DataHybrid,
                  X = VarianceComponentExample$Markers,
                   formula = Formula
                  , ZList = ZL  ,  VarList = VL)
length(ResultVA3)
print(ResultVA3[[1]])


#### Example 3: QTL detection with two variance components
data(QTLDetectionExample)
Pheno <- QTLDetectionExample$Phenotype
Geno <- QTLDetectionExample$Genotype
Kinship <- QTLDetectionExample$Kinship

##Build the VarList object
VLgd <- list(Additive=Kinship , Error=diag(1,length(Pheno)))

##Perform inference
ResultGD <- MMEst(Y=Pheno , X=Geno
                  , VarList=VLgd , CritVar = 10e-5)

length(ResultGD)
print(ResultGD[[1]])



