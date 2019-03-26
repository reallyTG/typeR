## ---- eval=TRUE, message=FALSE, warning=FALSE----------------------------
# Load packages required for this example
library(tigger)
library(dplyr)

## ---- eval=TRUE, warning=FALSE-------------------------------------------
# Detect novel alleles
novel <- findNovelAlleles(SampleDb, GermlineIGHV, nproc=1)

## ---- eval=TRUE, warning=FALSE-------------------------------------------
# Extract and view the rows that contain successful novel allele calls
novel_rows <- selectNovel(novel)
novel_rows[1:3]

## ---- eval=TRUE, warning=FALSE, fig.width=6, fig.height=8----------------
# Plot evidence of the first (and only) novel allele from the example data
plotNovel(SampleDb, novel[1, ])

## ---- eval=TRUE, warning=FALSE, fig.width=4, fig.height=3----------------
# Infer the individual's genotype, using only unmutated sequences and checking
# for the use of the novel alleles inferred in the earlier step.
geno <- inferGenotype(SampleDb, germline_db=GermlineIGHV, novel=novel,
                      find_unmutated=TRUE)
# Save the genotype sequences to a vector
genotype_db <- genotypeFasta(geno, GermlineIGHV, novel)
# Visualize the genotype and sequence counts
print(geno)
# Make a colorful visualization. Bars indicate presence, not proportion.
plotGenotype(geno, text_size = 10)

## ---- eval=TRUE, warning=FALSE, fig.width=4, fig.height=3----------------
# Infer the individual's genotype, using the bayesian method
geno_bayesian <- inferGenotypeBayesian(SampleDb, germline_db=GermlineIGHV, 
                                       novel=novel, find_unmutated=TRUE)
# Visualize the genotype and sequence counts
print(geno_bayesian)
# Make a colorful visualization. Bars indicate presence, not proportion.
plotGenotype(geno_bayesian, text_size=10)

## ---- eval=TRUE, warning=FALSE-------------------------------------------
# Use the personlized genotype to determine corrected allele assignments
# Updated genotype will be placed in the V_CALL_GENOTYPED column
sample_db <- reassignAlleles(SampleDb, genotype_db)

## ---- eval=TRUE, warning=FALSE-------------------------------------------
# Find the set of alleles in the original calls that were not in the genotype
not_in_genotype <- sample_db$V_CALL %>%
    strsplit(",") %>%
    unlist() %>%
    unique() %>%
    setdiff(names(genotype_db))

# Determine the fraction of calls that were ambigious before/after correction
# and the fraction that contained original calls to non-genotype alleles. Note
# that by design, only genotype alleles are allowed in "after" calls.
data.frame(Ambiguous=c(mean(grepl(",", sample_db$V_CALL)),
                       mean(grepl(",", sample_db$V_CALL_GENOTYPED))),
           NotInGenotype=c(mean(sample_db$V_CALL %in% not_in_genotype),
                           mean(sample_db$V_CALL_GENOTYPED %in% not_in_genotype)),
           row.names=c("Before", "After")) %>% 
    t() %>% round(3)

