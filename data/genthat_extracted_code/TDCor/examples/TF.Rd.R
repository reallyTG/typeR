library(TDCor)


### Name: TF
### Title: Table of 1834 Arabidopsis Transcription factors
### Aliases: TF
### Keywords: datasets

### ** Examples

# Load the database
data(TF)

# Obtain the transcription factors for which data is available in the LR dataset
# i.e. present on ATH1 chip and differentially expressed.
data(LR_dataset)
clean.at(LR_dataset,TF[,1])



