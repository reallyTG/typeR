library(KMgene)


### Name: FbKMO
### Title: Optimal KM for Non-continuous Traits in Familial GWAS Data
###   (calculate p-value)
### Aliases: FbKMO

### ** Examples

#########################################################################
### Examples for Binary Traits in Familial GWAS Data using optimal KM ###
#########################################################################
### Subject IDs are numeric ###
data("FbKM_numID")
obj1 <- FbKMO_Null_Model(phenotype=fbkm_n_y$y, id=fbkm_n_y$id, fa=fbkm_n_y$fa,
mo=fbkm_n_y$mo, family="binomial", covariates=NULL)
pvalue1 <- FbKMO(obj=obj1, genotypes=fbkm_n_gene, gid=fbkm_n_geneid$gid, weights=NULL,
append.write="./pvalues.out")
# Read in a list of genes files instead of a big file containing all genes
obj <- FbKMO_Null_Model(phenotype=fbkm_n_y$y, id=fbkm_n_y$id, fa=fbkm_n_y$fa,
mo=fbkm_n_y$mo, family="binomial", covariates=NULL)
gene <- split(fbkm_n_gene, fbkm_n_gene[,1])
for (k in 1:2) {
  gene[[k]]$gene <- as.character(gene[[k]]$gene)
  pvalue1 <- FbKMO(obj=obj, genotypes=gene[[k]], gid=fbkm_n_geneid$gid, weights=NULL,
  append.write="./pvalues.out")
}
### Subject IDs are character ###
data("FbKM_charID")
obj1 <- FbKMO_Null_Model(phenotype=fbkm_c_y$y, id=as.character(fbkm_c_y$id),
fa=as.character(fbkm_c_y$fa), mo=as.character(fbkm_c_y$mo), family="binomial",
covariates=NULL)
pvalue1 <- FbKMO(obj=obj1, genotypes=fbkm_c_gene, gid=as.character(fbkm_c_geneid$gid),
weights=NULL)



