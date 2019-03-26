library(PolyPatEx)


### Name: convertToPhenot
### Title: Convert a genotype allele dataset to a phenotype dataset
### Aliases: convertToPhenot

### ** Examples

## Using the example dataset 'FR_Genotype':
data(FR_Genotype)

## Since we did not load this dataset using inputData(), we must
## first process it with preprocessData() before doing anything
## else:
gData <- preprocessData(FR_Genotype,
                        numLoci=7,
                        ploidy=4,
                        dataType="genotype",
                        dioecious=TRUE,
                        mothersOnly=TRUE)

head(gData)  ## Checked and Cleaned version of FR_Genotype

pData <- convertToPhenot(gData)

head(pData)



