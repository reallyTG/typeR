library(PQLseq)


### Name: ExampleBSseq
### Title: BSseq example dataset
### Aliases: ExampleBSseq
### Keywords: datasets

### ** Examples

data(ExampleBSseq)
attach(ExampleBSseq)
model_DNA=pqlseq(RawCountDataSet=mcount, Phenotypes=predictor, 
  RelatednessMatrix=relatednessmatrix, LibSize=totalcount,
  fit.model="BMM",numCore=1)
head(model_DNA)
detach(ExampleBSseq)



