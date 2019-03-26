library(alleHap)


### Name: alleHaplotyper
### Title: Haplotyping of a dataset composed by several families.
### Aliases: alleHaplotyper

### ** Examples


## Haplotype reconstruction for 3 families without missing data.
simulatedFams <- alleSimulator(3,3,6)  
(famsAlls <- simulatedFams[[1]])      # Original data 
famsList <- alleHaplotyper(famsAlls)  # List containing families' alleles and haplotypes
famsList$reImputedAlls                # Re-imputed alleles
famsList$haplotypes                   # Reconstructed haplotypes

## Haplotype reconstruction of a family containing missing data in a parent. 
infoFam <- data.frame(famID="FAM002",indID=1:6,patID=c(0,0,1,1,1,1),
                     matID=c(0,0,2,2,2,2),sex=c(1,2,1,2,1,2),phenot=c(2,1,1,2,1,2))
Mkrs <- rbind(c(1,4,2,5,3,6),rep(NA,6),c(1,7,2,3,3,2),
              c(4,7,5,3,6,2),c(1,1,2,2,3,3),c(1,4,2,5,3,6))
colnames(Mkrs) <- c("Mk1_1","Mk1_2","Mk2_1","Mk2_2","Mk3_1","Mk3_2")
(family <- cbind(infoFam,Mkrs))    # Original data 
famList <- alleHaplotyper(family)  # List containing family's alleles and haplotypes
famList$reImputedAlls              # Re-imputed alleles
famList$haplotypes                 # Reconstructed haplotypes

## Haplotype reconstruction from a PED file
pedFamPath <- file.path(find.package("alleHap"), "examples", "example3.ped") # PED file path
pedFamAlls <- alleLoader(pedFamPath,dataSummary=FALSE) 
pedFamList <- alleHaplotyper(pedFamAlls)
pedFamAlls                # Original data 
pedFamList$reImputedAlls  # Re-imputed alleles 
pedFamList$haplotypes     # Reconstructed haplotypes




