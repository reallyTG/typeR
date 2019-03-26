library(wtest)


### Name: wtest.snps.meth
### Title: W-test for Gene-methylation Interaction Analysis
### Aliases: wtest.snps.meth

### ** Examples

data(SNP.pos)
data(CpG.pos)
data(genotype)
data(methylation)
data(phenotype2)

w <- 13000

# Recode methylation data
methylation <- methylation.recode(methylation)

## Step 1. HF Calculation.
# Please note that parameter B is recommended to be greater than 400.
hf.pair <- hf.snps.meth(B = 80, geno = genotype, meth = methylation, y = phenotype2,
                        geno.pos = SNP.pos, meth.pos = CpG.pos, window.size = w)

## Step 2. Application
result <- wtest.snps.meth(geno = genotype, meth = methylation, y = phenotype2, geno.pos = SNP.pos,
                          meth.pos = CpG.pos, window.size = w, hf = hf.pair, output.pval = 0.1)




