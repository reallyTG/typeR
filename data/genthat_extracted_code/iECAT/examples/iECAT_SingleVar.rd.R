library(iECAT)


### Name: iECAT_SingleVar
### Title: Integrating External Controls to Association Tests
### Aliases: iECAT_SingleVar iECAT_SingleVar_Tbl

### ** Examples

library(SKAT)

data(Example, package="iECAT")
attach(Example)

# iECAT-O
# test the second SNP in the first gene
idx.snp<-2

obj<-SKAT_Null_Model(Y ~ 1, out_type="D")
Z = Z.list[[1]][,idx.snp]
tbl.external= tbl.external.all.list[[1]][idx.snp,]


iECAT_SingleVar(Z, obj, tbl.external)






