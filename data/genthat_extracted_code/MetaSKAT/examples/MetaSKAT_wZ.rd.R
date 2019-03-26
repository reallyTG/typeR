library(MetaSKAT)


### Name: MetaSKAT_wZ
### Title: Meta analysis SKAT with individual level genotype data
### Aliases: MetaSKAT_wZ

### ** Examples



data(Example)
attach(Example)

#############################################################
#	Compute a p-value of the first gene

obj<-Meta_Null_Model(y.list, x.list, n.cohort=3, out_type="D")

# rho=0
MetaSKAT_wZ(Z.list[[1]], obj)$p.value

# rho=1 (burden test)
MetaSKAT_wZ(Z.list[[1]], obj, r.corr=1)$p.value


# optimal test
MetaSKAT_wZ(Z.list[[1]], obj, method="optimal")$p.value

# cohort specific weights
MetaSKAT_wZ(Z.list[[1]], obj, combined.weight=FALSE)$p.value


# Seperate = TRUE
# Assume heterogeneous genetic effect 
MetaSKAT_wZ(Z.list[[1]], obj, combined.weight=FALSE, is.separate = TRUE)$p.value


# Group

# the first two cohorts are in the same group.
Group_Idx=c(1,1,2)
MetaSKAT_wZ(Z.list[[1]], obj, combined.weight=FALSE, is.separate = TRUE,Group_Idx=Group_Idx)$p.value

# all three cohorts are in different group.
Group_Idx=c(1,2,3)
MetaSKAT_wZ(Z.list[[1]], obj, combined.weight=FALSE, is.separate = TRUE,Group_Idx=Group_Idx)$p.value






