library(PQLseq)


### Name: pqlseq
### Title: Fit Generalized Linear Mixed Model with Known Kinship Matrices
###   Through Penalized-quasi Likelihood
### Aliases: pqlseq
### Keywords: function GLMMs, pqlseq

### ** Examples

data(ExampleRNAseq)
attach(ExampleRNAseq)
model_RNA=pqlseq(RawCountDataSet=count, Phenotypes=predictor, 
  RelatednessMatrix=relatednessmatrix, LibSize=totalcount,
  fit.model="PMM",numCore=1)
head(model_RNA)
detach(ExampleRNAseq)



