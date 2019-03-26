library(plmm)


### Name: select.h0
### Title: Bandwidths Selection for Model Reduction
### Aliases: select.h0

### ** Examples

data(plmm.data)
select.h0(y0~x1+x2+x3|t1, data=plmm.data)

# nonparametric component of two covariates, t1 and t2
## Not run: 
##D select.h0(y2~x1+x2+x3|t1+t2, data=plmm.data) 
## End(Not run)



