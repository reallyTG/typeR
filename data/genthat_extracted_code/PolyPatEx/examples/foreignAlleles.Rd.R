library(PolyPatEx)


### Name: foreignAlleles
### Title: Identify foreign alleles
### Aliases: foreignAlleles

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

fAlleles <- foreignAlleles(gData)

## View foreign alleles detected at each locus:
fAlleles$byLocus

## View foreign alleles detected in each progeny, at each locus:
fAlleles$byProgenyLocus

## Both of these objects are data frames, hence can be written to file
## via, e.g., write.csv().



