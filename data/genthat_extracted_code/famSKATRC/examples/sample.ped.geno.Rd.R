library(famSKATRC)


### Name: sample.ped.geno
### Title: Sample Pedigree Genotype Data
### Aliases: sample.ped.geno
### Keywords: datasets

### ** Examples

data(sample.ped.geno)
library(kinship2)
sample.ped.geno$FA[sample.ped.geno$FA == "0"] <- NA
sample.ped.geno$MO[sample.ped.geno$MO == "0"] <- NA
sample.ped.geno$Phenotype[sample.ped.geno$Phenotype >= 0] <- 1
sample.ped.geno$Phenotype[sample.ped.geno$Phenotype < 0] <- 0
ped.list <- pedigree(id = sample.ped.geno$IID, dadid = sample.ped.geno$FA,
                     momid = sample.ped.geno$MO, sex = sample.ped.geno$SEX,
                     famid = sample.ped.geno$FID,
                     affected = sample.ped.geno$Phenotype)
ped1 <- ped.list[1]
ped2 <- ped.list[2]
plot(ped1)
plot(ped2)



