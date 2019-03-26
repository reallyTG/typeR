library(PolyPatEx)


### Name: genotPPE
### Title: Simple paternity exclusion for genotype allele data
### Aliases: genotPPE

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

## gPPE is a large (and rather ugly!) data structure - see
## functions potentialFatherCounts() and potentialFatherIDs() for
## more useful output from the gPPE object.



