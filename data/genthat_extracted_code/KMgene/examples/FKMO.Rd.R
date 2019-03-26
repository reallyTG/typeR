library(KMgene)


### Name: FKMO
### Title: Optimal KM for continuous Traits in Familial GWAS Data
###   (calculate p-value)
### Aliases: FKMO

### ** Examples

#############################################################################
### Examples for Continuous Traits in Familial GWAS Data using optimal KM ###
#############################################################################
### Subject IDs are numeric ###
data("FKM_numID")
obj1 <- FKMO_Null_Model(phenotype=fkm_n_y$y, id=fkm_n_y$id, fa=fkm_n_y$fa,
mo=fkm_n_y$mo, covariates=NULL)
pvalue1 <- FKMO(obj=obj1, genotypes=fkm_n_gene, gid=fkm_n_geneid$gid, weights=NULL,
append.write="./pvalues.out")
# Read in a list of genes files instead of a big file containing all genes
obj <- FKMO_Null_Model(phenotype=fkm_n_y$y, id=fkm_n_y$id, fa=fkm_n_y$fa,
mo=fkm_n_y$mo, covariates=NULL)
gene <- split(fkm_n_gene, fkm_n_gene[,1])
for (k in 1:2) {
  gene[[k]]$gene <- as.character(gene[[k]]$gene)
  pvalue1 <- FKMO(obj=obj, genotypes=gene[[k]], gid=fkm_n_geneid$gid, weights=NULL,
  append.write="./pvalues.out")
}
### Subject IDs are character ###
data("FKM_charID")
obj1 <- FKMO_Null_Model(phenotype=fkm_c_y$y, id=as.character(fkm_c_y$id),
fa=as.character(fkm_c_y$fa), mo=as.character(fkm_c_y$mo),  covariates=NULL)
pvalue1 <- FKMO(obj=obj1, genotypes=fkm_c_gene, gid=as.character(fkm_c_geneid$gid),
weights=NULL)



