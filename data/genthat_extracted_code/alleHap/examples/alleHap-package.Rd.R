library(alleHap)


### Name: alleHap-package
### Title: Allele Imputation and Haplotype Reconstruction from Pedigree
###   Databases
### Aliases: alleHap-package alleHap

### ** Examples

## Generation of 10 simulated families with 2 children per family and 20 markers
dataset <- alleSimulator(10,2,20)  # List with simulated alleles and haplotypes
datasetAlls <- dataset[[1]]        # Dataset containing alleles
datasetHaps <- dataset[[2]]        # Dataset containing haplotypes

## Loading of a dataset in .ped format with alphabetical alleles (A,C,G,T)
example1 <- file.path(find.package("alleHap"), "examples", "example1.ped")
datasetAlls1 <- alleLoader(example1)

## Loading of a dataset in .ped format with numerical alleles
example2 <- file.path(find.package("alleHap"), "examples", "example2.ped")
datasetAlls2 <- alleLoader(example2)

## Allele imputation of families with parental missing data
datasetAlls <- alleSimulator(10,4,6,missParProb=0.2)[[1]]
famsImputed <- alleImputer(datasetAlls)

## Allele imputation of families with offspring missing data
datasetAlls <- alleSimulator(10,4,6,missOffProb=0.2)[[1]]
famsImputed <- alleImputer(datasetAlls)

## Haplotype reconstruction for 3 families without missing data.
simulatedFams <- alleSimulator(3,3,6)  
(famsAlls <- simulatedFams[[1]])      # Original data 
famsList <- alleHaplotyper(famsAlls)  # List containing families' alleles and haplotypes
famsList$reImputedAlls                # Re-imputed alleles
famsList$haplotypes                   # Reconstructed haplotypes

## Haplotype reconstruction from a PED file
pedFamPath <- file.path(find.package("alleHap"), "examples", "example3.ped") # PED file path
pedFamAlls <- alleLoader(pedFamPath,dataSummary=FALSE) 
pedFamList <- alleHaplotyper(pedFamAlls)
pedFamAlls                # Original data 
pedFamList$reImputedAlls  # Re-imputed alleles 
pedFamList$haplotypes     # Reconstructed haplotypes



