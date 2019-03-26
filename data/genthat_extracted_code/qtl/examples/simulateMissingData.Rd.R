library(qtl)


### Name: simulatemissingdata
### Title: Simulates missing genotype data
### Aliases: simulatemissingdata
### Keywords: utilities

### ** Examples

data(multitrait)
multitrait <- fill.geno(multitrait)
multimissing5 <- simulatemissingdata(multitrait,perc=5)
perc <- (sum(nmissing(multimissing5))/sum(ntyped(multimissing5)))



