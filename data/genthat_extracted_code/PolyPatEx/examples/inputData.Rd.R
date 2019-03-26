library(PolyPatEx)


### Name: inputData
### Title: Read in, check and preprocess the allele dataset
### Aliases: inputData

### ** Examples

## Not run: 
##D 
##D ## Obtain path to the example genotype data file
##D ## 'FR_Genotype.csv'
##D gDataFile <- system.file("extdata/FR_Genotype.csv",
##D                          package="PolyPatEx")
##D print(gDataFile)
##D 
##D gData <- inputData(gDataFile,
##D                    numLoci=7,
##D                    ploidy=4,
##D                    dataType="genotype",
##D                    dioecious=TRUE,
##D                    mothersOnly=TRUE)
##D 
##D ## ...or use 'mothersOnly=FALSE' if you wish to retain
##D ## non-maternal females in the dataset.
##D 
##D ## gData now contains the checked and preprocessed allele dataset,
##D ## ready to be passed to other PolyPatEx analysis functions.
##D 
##D ## In your own workflow, you would typically specify the path to
##D ## your allele dataset directly - e.g. if the dataset
##D ## myAlleleData.csv is on the Data subdirectory of the current R
##D ## working directory (see R function setwd()), then:
##D ##
##D ## gData <- inputData("Data/myAlleleData.csv",
##D ##                    numLoci= etc etc etc...,
##D 
## End(Not run)



