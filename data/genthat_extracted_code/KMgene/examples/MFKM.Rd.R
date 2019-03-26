library(KMgene)


### Name: MFKM
### Title: KM for Quantitative Traits in Multivariate Family GWAS Data
###   (calculate p-value)
### Aliases: MFKM

### ** Examples

########################################################################################
### Examples for Multivariate (two) Continuous Traits in Familial GWAS Data using KM ###
########################################################################################
### Subject IDs are numeric ###
data("MFKM_numID")
#If Ninitial=1, the initial value "cor" is always equal to
#correlation(trait1|covariates, trait2|covariates).
obj1 <- MFKM_Null_Model(phenotype=mfkm_n_y$y, trait=mfkm_n_y$trait, yid=mfkm_n_y$id,
gid=mfkm_n_geneid$gid, fa=mfkm_n_geneid$fa, mo=mfkm_n_geneid$mo, covariates=NULL,
Ninitial=1)
#One should try multiple initial values in order to find max log-likelihood. The default
#is 10 times.
#This could be time consuming, depends on the sample size. The good thing is that null
#model only needs to be fitted once for the whole genome, so it's worth trying many
#initial values. The initial value with max logl can be saved in ./LogLikelihood.txt
#for reuse.
pvalue1 <- MFKM(obj=obj1, genotypes=mfkm_n_gene, weights=NULL)
#If one wants to replicate the results, finds the initial value "cor" with the max
#loglikelihood in ./LogLikelihood.txt that is output by default. The 1st column is
#"cor"; 2nd column is "log-likelihood".
obj1 <- MFKM_Null_Model(phenotype=mfkm_n_y$y, trait=mfkm_n_y$trait, yid=mfkm_n_y$id,
gid=mfkm_n_geneid$gid, fa=mfkm_n_geneid$fa, mo=mfkm_n_geneid$mo, covariates=NULL,
cor=0.687439771651474)
#This "cor" is calcualted based on 3 initial values, "Ninitial=3".
pvalue1 <- MFKM(obj=obj1, genotypes=mfkm_n_gene, weights=NULL)
#Introduce missing into covariates and outcome.
#When samples have missing values in outcome or covariates, those samples are used only for
#kinship calculation.
mfkm_n_covariates[1,] = NA
mfkm_n_y$y[4] = NA
obj1 <- MFKM_Null_Model(phenotype=mfkm_n_y$y, trait=mfkm_n_y$trait, yid=mfkm_n_y$id,
gid=mfkm_n_geneid$gid, fa=mfkm_n_geneid$fa, mo=mfkm_n_geneid$mo, covariates=mfkm_n_covariates,
Ninitial=1)
pvalue1 <- MFKM(obj=obj1, genotypes=mfkm_n_gene, weights=NULL)
#Read in a list of genes files instead of a big file containing all genes
obj <- MFKM_Null_Model(phenotype=mfkm_n_y$y, trait=mfkm_n_y$trait, yid=mfkm_n_y$id,
gid=mfkm_n_geneid$gid, fa=mfkm_n_geneid$fa, mo=mfkm_n_geneid$mo, covariates=NULL,
Ninitial=1)
gene <- split(mfkm_n_gene, mfkm_n_gene[,1])
for (k in 1:2) {
  gene[[k]]$gene <- as.character(gene[[k]]$gene)
  pvalue1 <- MFKM(obj=obj, genotypes=gene[[k]], weights=NULL, append.write=
  "./pvalues.out")
}
### Subject IDs are character ###
data("MFKM_charID")
obj1 <- MFKM_Null_Model(phenotype=mfkm_c_y$y, trait=mfkm_c_y$trait,
yid=as.character(mfkm_c_y$id),
gid=as.character(mfkm_c_geneid$gid), fa=as.character(mfkm_c_geneid$fa),
mo=as.character(mfkm_c_geneid$mo), covariates=NULL, Ninitial=1)
pvalue1 <- MFKM(obj=obj1, genotypes=mfkm_c_gene, weights=NULL)



