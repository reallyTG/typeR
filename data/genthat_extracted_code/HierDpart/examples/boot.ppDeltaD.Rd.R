library(HierDpart)


### Name: boot.ppDeltaD
### Title: Bootstrapping test of pairwise allelic differentiation (Delta D)
###   between populations
### Aliases: boot.ppDeltaD

### ** Examples

f <- system.file('extdata',package='HierDpart')
infile <- file.path(f, "Island.gen")
boot.ppDeltaD(infile, ncode=3, nboot=999, quant = c(0.025, 0.975), diploid = TRUE)



