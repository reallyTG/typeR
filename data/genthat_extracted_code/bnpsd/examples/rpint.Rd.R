library(bnpsd)


### Name: rpint
### Title: Draw intermediate subpopulation allele frequencies
### Aliases: rpint

### ** Examples

m <- 10 # number of loci
pAnc <- rpanc(m) # random vector of ancestral allele frequencies
F <- c(0.1, 0.3) # FST values for two subpops
B <- rpint(pAnc, F) # matrix of intermediate subpop allele freqs




