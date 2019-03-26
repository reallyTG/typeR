library(PolyPatEx)


### Name: FR_Genotype
### Title: Example genotype allele dataset
### Aliases: FR_Genotype
### Keywords: data

### ** Examples

## Not run: 
##D ## To locate this dataset in your filesystem, use:
##D 
##D gDataFile <- system.file("extdata/FR_Genotype.csv",
##D                          package="PolyPatEx")
##D print(gDataFile)
##D 
##D ## To load this file using PolyPatEx's 'inputData' function, use:
##D 
##D gData <- inputData(gDataFile,
##D                   numLoci=7,
##D                   ploidy=4,
##D                   dataType="genotype",
##D                   dioecious=TRUE,
##D                   mothersOnly=TRUE)
##D 
##D ## ...or use 'mothersOnly=FALSE' if you wish to retain
##D ## non-maternal females in the dataset.
##D 
##D ## gData now contains the checked and preprocessed allele dataset,
##D ## ready to be passed to other PolyPatEx analysis functions.
## End(Not run)



