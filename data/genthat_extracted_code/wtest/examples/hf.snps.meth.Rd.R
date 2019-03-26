library(wtest)


### Name: hf.snps.meth
### Title: Parameter Estimation for W-test Probability Distribution in
###   Gene-methylation Data
### Aliases: hf.snps.meth

### ** Examples

data(SNP.pos)
data(CpG.pos)
data(genotype)
data(methylation)
data(phenotype2)

# Please note that parameter B is recommended to be greater than 400.
hf.pair <- hf.snps.meth(B = 80, geno = genotype, meth = methylation, y = phenotype2,
                        geno.pos = SNP.pos, meth.pos = CpG.pos, window.size = 1000)




