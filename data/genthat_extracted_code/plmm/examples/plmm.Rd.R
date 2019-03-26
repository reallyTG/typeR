library(plmm)


### Name: plmm
### Title: Partially Linear Mixed Effects Model
### Aliases: plmm
### Keywords: regression nonparametric

### ** Examples

data(plmm.data)
plmm(y0~x1+x2+x3|t1, random=cluster, data=plmm.data)

# heteroskedasticity proportionality x3
plmm(y1~x1+x2+x3|t1, random=cluster, data=plmm.data, vc.method="FChetero", hetero.prop=x3)

# nonparametric component of two covariates, t1 and t2
## Not run: 
##D plmm(y2~x1+x2+x3|t1+t2, random=cluster, data=plmm.data) 
## End(Not run)



