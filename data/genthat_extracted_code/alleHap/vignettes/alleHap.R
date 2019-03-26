## ----include=FALSE, echo=FALSE-------------------------------------------
library(knitr)
opts_chunk$set(concordance=TRUE)
library(alleHap)
library(abind)
library(tools)
set.seed(12345678)

## ----echo=FALSE, comment=NA,highlight=TRUE-------------------------------
famIDs <- data.frame(famID="FAM001",indID=1:5,patID=c(0,0,1,1,1),
                     matID=c(0,0,2,2,2),sex=c(1,2,1,2,1),phenot=c(1,2,2,1,2))
Mkrs <- rbind(c(1,2, NA,NA, 1,2),c(3,4, 1,2, 3,4),
              c(1,3, 1,2, 1,3),c(NA,NA, 1,1, 2,4),c(1,4, 1,1, 2,4))
colnames(Mkrs)=c("Mk1_1","Mk1_2","Mk2_1","Mk2_2","Mk3_1","Mk3_2")
(family <- cbind(famIDs,Mkrs))

## ----comment=NA,prompt=TRUE,background='#EFF5FB'-------------------------
simulatedFam1 <- alleSimulator(1,2,3,missParProb=0.3)
simulatedFam1[[1]] # Alleles (genotypes) of the 1st simulated family
simulatedFam1[[2]] # 1st simulated family haplotypes (without missing values)

## ----comment=NA,prompt=TRUE,background='#EFF5FB'-------------------------
simulatedFam2 <- alleSimulator(1,2,3,missOffProb=0.3)
simulatedFam2[[1]] # Alleles (genotypes) of the 2nd simulated family
simulatedFam2[[2]] # 2nd simulated family haplotypes (without missing values)

## ----comment=NA,prompt=TRUE,background='#EFF5FB'-------------------------
example1 <- file.path(find.package("alleHap"), "examples", "example1.ped")

example1Alls <- alleLoader(example1)  # Loaded alleles of the example 1
example1Alls[1:14,1:12]  # Alleles of the first 17 subjects

## ----comment=NA,prompt=TRUE,background='#EFF5FB'-------------------------
example2 <- file.path(find.package("alleHap"), "examples", "example2.ped")

example2Alls <- alleLoader(example2)  # Loaded alleles of the example 2
example2Alls[1:9,]  # Alleles of the first 9 subjects

## ----comment=NA,prompt=TRUE,background='#EFF5FB'-------------------------
## Simulation of a family containing parental missing data
simulatedFam1 <- alleSimulator(1,2,3,missParProb=0.6)
# Simulated alleles
simulatedFam1[[1]]  

## Genotype imputation of previously simulated data
imputedFam1 <- alleImputer(simulatedFam1[[1]])  
# Imputed alleles (markers)
imputedFam1$imputedMkrs 

## ----comment=NA,prompt=TRUE,background='#EFF5FB'-------------------------
## Simulation of two families containing offspring missing data
simulatedFam2 <- alleSimulator(2,2,3,missOffProb=0.6)

# Simulated alleles
simulatedFam2[[1]] 

## Genotype imputation of previously simulated data
imputedFam2 <- alleImputer(simulatedFam2[[1]], dataSummary=FALSE)

# Imputed alleles (markers)
imputedFam2$imputedMkrs 

## ----comment=NA,prompt=TRUE,background='#EFF5FB'-------------------------
## Simulation of families containing parental missing data
simulatedFams1 <- alleSimulator(2,3,6,missParProb=0.2,ungenotPars=0.3)
## Haplotype reconstruction of previously simulated data
fams1List <- alleHaplotyper(simulatedFams1[[1]])
# Original data
simulatedFams1[[1]][,-(1:6)]  
# Re-imputed alleles 
fams1List$reImputedAlls[,-(1:6)]  
# Reconstructed haplotypes
fams1List$haplotypes  

## ----comment=NA,prompt=TRUE,background='#EFF5FB'-------------------------
## Simulation of families containing offspring missing data
simulatedFams2 <- alleSimulator(2,3,6,missOffProb=0.3,ungenotOffs=0.2)
## Haplotype reconstruction of previously simulated data
fams2List <- alleHaplotyper(simulatedFams2[[1]],dataSummary=FALSE)
# Original data
simulatedFams2[[1]][,-(1:6)]  
# Re-imputed alleles 
fams2List$reImputedAlls[,-(1:6)]  
# Reconstructed haplotypes
fams2List$haplotypes  

## ----comment=NA,prompt=TRUE,background='#EFF5FB'-------------------------
## PED file path
family3path <- file.path(find.package("alleHap"), "examples", "example3.ped") 

## Loading of the ped file placed in previous path
family3Alls <- alleLoader(family3path,dataSummary=FALSE) 

## Haplotype reconstruction of previously loaded data
family3List <- alleHaplotyper(family3Alls,dataSummary=FALSE)


# Original data 
family3Alls  
# Re-imputed alleles 
family3List$reImputedAlls  
# Reconstructed haplotypes
family3List$haplotypes  

