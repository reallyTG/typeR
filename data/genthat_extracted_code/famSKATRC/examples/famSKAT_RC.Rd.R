library(famSKATRC)


### Name: famSKAT_RC
### Title: famSKAT_RC
### Aliases: famSKAT_RC

### ** Examples

library(kinship2)
sample.ped.geno <- process_data()
KIN = kinship(sample.ped.geno$IID, sample.ped.geno$FA, sample.ped.geno$MO)
IID = sample.ped.geno$IID
wuweights_r <- function(maf) ifelse(maf>0, dbeta(maf,1,25), 0)
wuweights_c <- function(maf) ifelse(maf>0, dbeta(maf,0.5,0.5), 0)
P_VALUES <- famSKAT_RC(PHENO=sample.ped.geno[,"Phenotype"],genotypes=as.matrix(
            sample.ped.geno[,7:ncol(sample.ped.geno)]), binomialimpute=TRUE,
            id=IID,fullkins=KIN,maf=0.05, sqrtweights_c=wuweights_c,
            sqrtweights_r=wuweights_r, phi = c(0,0.2,0.5,0.9))
print(P_VALUES)



