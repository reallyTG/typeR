library(PolyPatEx)


### Name: phenotPPE
### Title: Simple paternity exclusion for phenotype allele data
### Aliases: phenotPPE

### ** Examples

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

pPPE <- phenotPPE(pData)

## pPPE is a large (and rather ugly!) data structure - see
## functions potentialFatherCounts() and potentialFatherIDs() for
## more useful output from the gPPE object.



