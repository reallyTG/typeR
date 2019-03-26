library(KMgene)


### Name: LKM
### Title: KM for Quantitative Traits in Longitudinal GWAS Data (calculate
###   p-value)
### Aliases: LKM

### ** Examples

#########################################################################
### Examples for Longitudinal Continuous Traits in GWAS Data using KM ###
#########################################################################
### Subject IDs are numeric ###
data("LKM_numID")
obj1 <- LKM_Null_Model(phenotype=lkm_n_y$y, time=lkm_n_y$time, yid=lkm_n_y$id,
covariates=NULL)
pvalue1 <- LKM(obj=obj1, genotypes=lkm_n_gene, gid=lkm_n_gid$gid, weights=NULL,
append.write="./pvalues.out")
# Read in a list of genes files instead of a big file containing all genes
obj <- LKM_Null_Model(phenotype=lkm_n_y$y, time=lkm_n_y$time, yid=lkm_n_y$id,
covariates=NULL)
gene <- split(lkm_n_gene, lkm_n_gene[,1])
for (k in 1:2) {
  gene[[k]]$gene <- as.character(gene[[k]]$gene)
  pvalue1 <- LKM(obj=obj, genotypes=gene[[k]], gid=lkm_n_gid$gid, weights=NULL,
  append.write="./pvalues.out")
}
### Subject IDs are character ###
data("LKM_charID")
obj1 <- LKM_Null_Model(phenotype=lkm_c_y$y, time=lkm_c_y$time,
yid=as.character(lkm_c_y$id), covariates=NULL)
pvalue1 <- LKM(obj=obj1, genotypes=lkm_c_gene, gid=as.character(lkm_c_gid$gid),
weights=NULL)



