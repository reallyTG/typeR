library(HierDpart)


### Name: print_boot_ppDeltaD
### Title: Print the bootstrapping result for pairwise allelic
###   differentiation (Delta D)
### Aliases: print_boot_ppDeltaD

### ** Examples

f <- system.file('extdata',package='HierDpart')
infile <- file.path(f, "Island.gen")
boottest=boot.ppDeltaD(infile, ncode=3, nboot=999, quant = c(0.025, 0.975), diploid = TRUE)
print_boot_ppDeltaD(boottest)



