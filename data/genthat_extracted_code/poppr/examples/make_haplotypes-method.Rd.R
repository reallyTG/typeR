library(poppr)


### Name: make_haplotypes
### Title: Split samples from a genind object into pseudo-haplotypes
### Aliases: make_haplotypes make_haplotypes,genclone-method
###   make_haplotypes,snpclone-method make_haplotypes,genind-method
###   make_haplotypes,genlight-method make_haplotypes,ANY-method

### ** Examples

# Diploid data is doubled -------------------------------------------------

data(nancycats)
nan9 <- nancycats[pop = 9]
nan9hap <- make_haplotypes(nan9) 
nan9              # 9 individuals from population 9
nan9hap           # 18 haplotypes
strata(nan9hap)   # strata gains a new column: Individual
indNames(nan9hap) # individuals are renamed sequentially


# Mix ploidy data can be split, but should be treated with caution --------
# 
# For example, the Pinf data set contains 86 tetraploid individuals, 
# but there appear to only be diploids and triploid genotypes. When 
# we convert to haplotypes, those with all missing data are dropped.
data(Pinf)
Pinf
pmiss <- info_table(Pinf, type = "ploidy", plot = TRUE)

# No samples appear to be triploid across all loci. This will cause
# several haplotypes to have a lot of missing data.
p_haps <- make_haplotypes(Pinf)
p_haps
head(genind2df(p_haps), n = 20)



