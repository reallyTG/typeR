library(updog)


### Name: flexdog
### Title: Flexible genotyping for polyploids from next-generation
###   sequencing data.
### Aliases: flexdog

### ** Examples

## No test: 

## An S1 population where the first individual
## is the parent. Fit assuming outliers.
data("snpdat")
ploidy  <- 6
refvec  <- snpdat$counts[snpdat$snp == "SNP3"]
sizevec <- snpdat$size[snpdat$snp == "SNP3"]
fout    <- flexdog(refvec   = refvec[-1],
                   sizevec  = sizevec[-1],
                   ploidy   = ploidy,
                   model    = "s1",
                   p1ref    = refvec[1],
                   p1size   = sizevec[1],
                   outliers = TRUE)
plot(fout)

## End(No test)

## A natural population. We will assume a
## normal prior since there are so few
## individuals.
data("uitdewilligen")
ploidy  <- 4
refvec  <- uitdewilligen$refmat[, 1]
sizevec <- uitdewilligen$sizemat[, 1]
fout    <- flexdog(refvec  = refvec,
                   sizevec = sizevec,
                   ploidy  = ploidy,
                   model   = "norm")
plot(fout)






