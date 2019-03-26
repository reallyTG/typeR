library(fda.usc)


### Name: summary.fregre.gkam
### Title: Summarizes information from fregre.gkam objects.
### Aliases: summary.fregre.gkam print.fregre.gkam
### Keywords: print

### ** Examples

## Time consuming
# data(tecator)
# ind<-1:129
# ab=tecator$absorp.fdata[ind]
# ab2=fdata.deriv(ab,2)
# yfat=as.integer(cut(tecator$y[ind,"Fat"],c(0,15,100)))-1
# xlist=list("df"=data.frame(yfat),"ab2"=ab2,"ab"=ab)
# f<-yfat~ab+ab2
# res=fregre.gkam(f,data=xlist,family=binomial("logit"),control=list(maxit=2))
# summary(res)
# res





