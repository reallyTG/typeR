library(PolyPatEx)


### Name: preprocessData
### Title: Check and preprocess an allele dataset
### Aliases: preprocessData

### ** Examples

## If using inputData to input the allele dataset from CSV file,
## preprocessData() is applied automatically before the dataset is
## returned by inputData().

## Otherwise, if the allele dataset is created or loaded into R
## by other means, such preprocessData() must be applied before
## other PolyPatEx analysis routines are applied:

## Using the example dataset 'GF_Phenotype':
data(GF_Phenotype)

## Since we did not load this dataset using inputData(), we must
## first process it with preprocessData() before doing anything
## else:
pData <- preprocessData(GF_Phenotype,
                        numLoci=7,
                        ploidy=6,
                        dataType="phenotype",
                        dioecious=FALSE,
                        selfCompatible=FALSE)

head(pData)  ## Checked and Cleaned version of GF_Phenotype

## pData is now ready to be passed to other PolyPatEx analysis
## functions...



