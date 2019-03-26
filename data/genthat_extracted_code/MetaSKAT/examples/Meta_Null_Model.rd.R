library(MetaSKAT)


### Name: Meta_Null_Model
### Title: Get parameters and residuals from H0
### Aliases: Meta_Null_Model Meta_Null_Model_EmmaX

### ** Examples



data(Example)
attach(Example)

#############################################################
#	Compute a p-value of the first gene

obj<-Meta_Null_Model(y.list, x.list, n.cohort=3, out_type="D")
MetaSKAT_wZ(Z.list[[1]], obj)$p.value

#############################################################
#	If you want to use the intercept-only model for the 2nd cohort

x.list[[2]]<-"intercept"
obj<-Meta_Null_Model(y.list, x.list, n.cohort=3, out_type="D")
MetaSKAT_wZ(Z.list[[1]], obj)$p.value





