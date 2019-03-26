library(OmnibusFisher)


### Name: OmnibusFisher
### Title: A modified Fisher’s method (Omnibus-Fisher) to combine separate
###   p-values of SNPs, RNA expressions and DNA methylations into an
###   overall gene-level p-value
### Aliases: OmnibusFisher

### ** Examples

################
### Examples ###
################
data("example_data")
set.seed(123)
exprs_G = exprs_M = exprs_R = "aff ~ age + sex"
### SNPs (G), DNA methylations (M) and RNA expressions (R) ###
results<-list()
for(i in 1:1){ #change to 1:3 for 3 genes
 results[[i]]<-OmnibusFisher(pheno=pheno, full_id=All_header, G=G[[i]], M=M[[i]],
 R=R[[i]], exprs_G=exprs_G, exprs_M=exprs_M, exprs_R=exprs_R, type="binary")
 # G[[1]] includes SNPs in gene1;
 # M[[1]] includes methylated sites in gene1;
 # R[[1]] includes gene expression probes in gene1 (or single gene1 expression value).
}
### SNPs (G) and DNA methylations (M) ###
results<-list()
for(i in 1:1){
 results[[i]]<-OmnibusFisher(pheno=pheno, full_id=All_header, G=G[[i]], M=M[[i]],
 exprs_G=exprs_G, exprs_M=exprs_M, type="binary")
}
### SNPs (G) and RNA expressions (R) ###
# results[[i]]<-OmnibusFisher(pheno=pheno, full_id=All_header, G=G[[i]], R=R[[i]],
# exprs_G=exprs_G, exprs_R=exprs_R, type="binary")
### DNA methylations (M) and RNA expressions (R) ###
# results[[i]]<-OmnibusFisher(pheno=pheno, full_id=All_header, R=R[[i]], M=M[[i]],
# exprs_R=exprs_R, exprs_M=exprs_M, type="binary")



