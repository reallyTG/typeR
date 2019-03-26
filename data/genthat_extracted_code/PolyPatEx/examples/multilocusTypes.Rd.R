library(PolyPatEx)


### Name: multilocusTypes
### Title: Genotype summaries
### Aliases: multilocusTypes

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

mTypes <- multilocusTypes(gData)

## mTypes is a list structure - individual components can be
## printed to the screen, or saved to file via, e.g. read.csv().

mTypes$numUniqueProgenyTypes

## Components of mTypes
names(mTypes)



