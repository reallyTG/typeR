library(inbreedR)


### Name: HHC
### Title: Calculates heterzygosity-heterozygosity correlations with
###   standardized multilocus heterozygosities (sMLH)
### Aliases: HHC

### ** Examples

data(mouse_msats)
genotypes <- convert_raw(mouse_msats)
(out <- HHC(genotypes, reps = 100, CI = 0.95))




