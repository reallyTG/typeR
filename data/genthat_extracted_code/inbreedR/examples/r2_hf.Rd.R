library(inbreedR)


### Name: r2_hf
### Title: Expected r2 between standardized multilocus heterozygosity (h)
###   and inbreeding level (f)
### Aliases: r2_hf

### ** Examples

data(mouse_msats)
genotypes <- convert_raw(mouse_msats)
(out <- r2_hf(genotypes, nboot = 100, type = "msats", parallel = FALSE))
plot(out)



