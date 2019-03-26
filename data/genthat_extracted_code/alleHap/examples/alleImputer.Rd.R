library(alleHap)


### Name: alleImputer
### Title: Imputation of missing alleles from a dataset composed by
###   families.
### Aliases: alleImputer

### ** Examples


## Imputation of families containing parental missing data
simulatedFams <- alleSimulator(10,4,6,missParProb=0.2) 
famsAlls <- simulatedFams[[1]]       # Original data 
alleImputer(famsAlls)                # Imputed alleles (genotypes)

## Imputation of families containing offspring missing data
datasetAlls <- alleSimulator(10,4,6,missOffProb=0.2)
famsAlls <- simulatedFams[[1]]       # Original data 
alleImputer(famsAlls)                # Imputed alleles (genotypes)

## Imputation of a family marker containing missing values in one parent and one child
infoFam <- data.frame(famID="FAM03",indID=1:5,patID=c(0,0,1,1,1),
                      matID=c(0,0,2,2,2),sex=c(1,2,1,2,1),phenot=0)
mkr <- rbind(father=c(NA,NA),mother=c(1,3),child1=c(1,1),child2=c(2,3),child3=c(NA,NA))
colnames(mkr) <- c("Mkr1_1","Mkr1_2")
famMkr <- cbind(infoFam,mkr)         # Original data 
alleImputer(famMkr)                  # Imputed alleles (genotypes)




