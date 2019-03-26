library(polmineR)


### Name: pmi
### Title: Calculate Pointwise Mutual Information (PMI).
### Aliases: pmi pmi,context-method

### ** Examples

y <- cooccurrences("REUTERS", query = "oil", method = "pmi")
N <- size(y)[["partition"]]
I <- log2((y[["count_coi"]]/N) / ((count(y) / N) * (y[["count_partition"]] / N)))



