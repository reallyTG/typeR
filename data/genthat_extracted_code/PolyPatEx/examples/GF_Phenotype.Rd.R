library(PolyPatEx)


### Name: GF_Phenotype
### Title: Example phenotype allele dataset
### Aliases: GF_Phenotype
### Keywords: data

### ** Examples

## Not run: 
##D ## To locate this dataset in your filesystem, use:
##D 
##D pDataFile <- system.file("extdata/GF_Phenotype.csv",
##D                          package="PolyPatEx")
##D print(pDataFile)
##D 
##D ## To load this file using PolyPatEx's 'inputData' function use:
##D 
##D pData <- inputData(pDataFile,
##D                   numLoci=7,
##D                   ploidy=6,
##D                   dataType="phenotype",
##D                   dioecious=FALSE,
##D                   selfCompatible=FALSE)
##D 
##D ## pData now contains the checked and preprocessed allele dataset,
##D ## ready to be passed to other PolyPatEx analysis functions.
##D 
## End(Not run)



