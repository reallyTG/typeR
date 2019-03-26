library(KMgene)


### Name: MFKMO
### Title: Optimal KM for Quantitative Traits in Multivariate Family GWAS
###   Data (calculate p-value)
### Aliases: MFKMO

### ** Examples

############################################################################
### Examples for Multivariate (two) Continuous Traits in Familial GWAS Data
############################################################################
######################
# using optimal KM ###
######################
### Subject IDs are numeric ###
data("MFKM_numID")
# Read in a list of genes files instead of a big file containing all genes
obj <- MFKMO_Null_Model(phenotype=mfkm_n_y$y, trait=mfkm_n_y$trait, yid=mfkm_n_y$id,
gid=mfkm_n_geneid$gid, fa=mfkm_n_geneid$fa, mo=mfkm_n_geneid$mo, covariates=NULL,
Ninitial=1)
gene <- split(mfkm_n_gene, mfkm_n_gene[,1])
for (k in 1:2) {
  gene[[k]]$gene <- as.character(gene[[k]]$gene)
  pvalue1 <- MFKMO(obj=obj, genotypes=gene[[k]], weights=NULL, append.write=
  "./pvalues.out")
}
### Subject IDs are character ###
data("MFKM_charID")
obj1 <- MFKMO_Null_Model(phenotype=mfkm_c_y$y, trait=mfkm_c_y$trait,
yid=as.character(mfkm_c_y$id),
gid=as.character(mfkm_c_geneid$gid), fa=as.character(mfkm_c_geneid$fa),
mo=as.character(mfkm_c_geneid$mo), covariates=NULL, Ninitial=1)
pvalue1 <- MFKMO(obj=obj1, genotypes=mfkm_c_gene, weights=NULL)



