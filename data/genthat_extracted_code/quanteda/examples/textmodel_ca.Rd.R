library(quanteda)


### Name: textmodel_ca
### Title: Correspondence analysis of a document-feature matrix
### Aliases: textmodel_ca

### ** Examples

ieDfm <- dfm(data_corpus_irishbudget2010)
wca <- textmodel_ca(ieDfm)
summary(wca)



