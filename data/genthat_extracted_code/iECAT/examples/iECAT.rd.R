library(iECAT)


### Name: iECAT
### Title: Integrating External Controls to Association Tests
### Aliases: iECAT iECAT.SSD.OneSet_SetIndex

### ** Examples

library(SKAT)

data(Example, package="iECAT")
attach(Example)

# iECAT-O
# test the first gene

obj<-SKAT_Null_Model(Y ~ 1, out_type="D")
Z = Z.list[[1]]
tbl.external.all = tbl.external.all.list[[1]]

iECAT(Z, obj, tbl.external.all, method="optimal")


# test for the first 3 genes in the Example dataset
p.value.all<-rep(0,3)
p.value.internal.all<-rep(0,3)
for(i in 1:3){

	re<-iECAT(Z.list[[i]], obj, tbl.external.all.list[[i]], method="optimal")
	p.value.all[i]<-re$p.value
	p.value.internal.all[i]<-re$p.value.internal

}

# iECAT-O p-values
p.value.all

# SKAT-O p-values
p.value.internal.all




