library(pKSEA)


### Name: batchrun
### Title: Running pKSEA::compare() on multiple files
### Aliases: batchrun

### ** Examples

#point to data directory that contains summary .csv files
datapath <- system.file("extdata", package = "pKSEA")

#run batchrun function to analyze all files in that folder, with options
batchrun(datapath, predictionDB=NetworKINPred_db, kseadb = KSEAdb, n_permutations = 5)



