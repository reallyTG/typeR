library(KMgene)


### Name: MKM
### Title: KM for Quantitative Traits in Multivariate GWAS Data (calculate
###   p-value)
### Aliases: MKM

### ** Examples

###############################################################################
### Examples for Multivariate (two) Continuous Traits in GWAS Data using KM ###
###############################################################################
### Subject IDs are numeric ###
data("MKM_numID")
obj1 <- MKM_Null_Model(phenotype=mkm_n_ph$y, trait=mkm_n_ph$trait, yid=mkm_n_ph$id,
covariates=NULL)
pvalue1 <- MKM(obj=obj1, genotypes=mkm_n_gene, gid=mkm_n_geneid$gid, weights=NULL,
append.write="./pvalues.out")
# Read in a list of genes files instead of a big file containing all genes
obj <- MKM_Null_Model(phenotype=mkm_n_ph$y, trait=mkm_n_ph$trait, yid=mkm_n_ph$id,
covariates=NULL)
gene <- split(mkm_n_gene, mkm_n_gene[,1])
for (k in 1:2) {
  gene[[k]]$gene <- as.character(gene[[k]]$gene)
  pvalue1 <- MKM(obj=obj, genotypes=gene[[k]], gid=mkm_n_geneid$gid, weights=NULL,
  append.write="./pvalues.out")
}
### Subject IDs are character ###
data("MKM_charID")
obj1 <- MKM_Null_Model(phenotype=mkm_c_ph$y, trait=mkm_c_ph$trait,
yid=as.character(mkm_c_ph$id), covariates=NULL)
pvalue1 <- MKM(obj=obj1, genotypes=mkm_c_gene, gid=as.character(mkm_c_geneid$gid),
weights=NULL)



