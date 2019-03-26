library(KMgene)


### Name: FbKM
### Title: KM for Binary Traits in Familial GWAS Data (calculate p-value)
### Aliases: FbKM

### ** Examples

#################################################################
### Examples for Binary Traits in Familial GWAS Data using KM ###
#################################################################
### Subject IDs are numeric ###
data("FbKM_numID")
obj1 <- FbKM_Null_Model(phenotype=fbkm_n_y$y, id=fbkm_n_y$id, fa=fbkm_n_y$fa,
mo=fbkm_n_y$mo, family="binomial", covariates=NULL)
pvalue1 <- FbKM(obj=obj1, genotypes=fbkm_n_gene, gid=fbkm_n_geneid$gid, weights=NULL,
append.write="./pvalues.out")
pvalue1 <- FbKM(obj=obj1, genotypes=fbkm_n_gene, gid=fbkm_n_geneid$gid, weights=NULL,
append.write=NULL)
obj2 <- FbKM_Null_Model(phenotype=fbkm_n_y$y, id=fbkm_n_y$id, fa=fbkm_n_y$fa,
mo=fbkm_n_y$mo, family="binomial", covariates=NULL)
pvalue2 <- FbKM(obj=obj2, genotypes=fbkm_n_gene, gid=fbkm_n_geneid$gid, weights=
fbkm_n_weights, append.write=NULL)
obj3 <- FbKM_Null_Model(phenotype=fbkm_n_y$y, id=fbkm_n_y$id, fa=fbkm_n_y$fa,
mo=fbkm_n_y$mo, family="binomial", covariates=fbkm_n_covariates)
pvalue3 <- FbKM(obj=obj3, genotypes=fbkm_n_gene, gid=fbkm_n_geneid$gid, weights=
fbkm_n_weights, append.write=NULL)
# Read in a list of genes files instead of a big file containing all genes
obj4 <- FbKM_Null_Model(phenotype=fbkm_n_y$y, id=fbkm_n_y$id, fa=fbkm_n_y$fa,
mo=fbkm_n_y$mo, family="binomial", covariates=NULL)
gene <- split(fbkm_n_gene, fbkm_n_gene[,1])
for (k in 1:2) {
  gene[[k]]$gene <- as.character(gene[[k]]$gene)
  pvalue1 <- FbKM(obj=obj4, genotypes=gene[[k]], gid=fbkm_n_geneid$gid, weights=NULL,
  append.write="./pvalues.out")
  }
### Subject IDs are character ###
data("FbKM_charID")
obj1 <- FbKM_Null_Model(phenotype=fbkm_c_y$y, id=as.character(fbkm_c_y$id),
fa=as.character(fbkm_c_y$fa), mo=as.character(fbkm_c_y$mo), family="binomial",
covariates=NULL)
pvalue1 <- FbKM(obj=obj1, genotypes=fbkm_c_gene, gid=as.character(fbkm_c_geneid$gid),
weights=NULL)
ys <- fbkm_c_y[order(fbkm_c_y$id),] #Sorted character IDs
obj1 <- FbKM_Null_Model(phenotype=ys$y, id=as.character(ys$id), fa=as.character(ys$fa),
mo=as.character(ys$mo),  covariates=NULL)
pvalue1 <- FbKM(obj=obj1, genotypes=fbkm_c_gene, gid=as.character(fbkm_c_geneid$gid),
weights=NULL)



