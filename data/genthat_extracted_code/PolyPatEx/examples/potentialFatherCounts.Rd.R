library(PolyPatEx)


### Name: potentialFatherCounts
### Title: Count potential fathers
### Aliases: potentialFatherCounts

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

gPPE <- genotPPE(gData)  ## Perform the exclusion analyses

## Obtain counts of potential fathers of each seedling, allowing a
## single allele mismatch:
pFC <- potentialFatherCounts(gPPE,mismatches=1,VLTMin=2)

## pFC can be viewed or written to file via, e.g. write.csv()



