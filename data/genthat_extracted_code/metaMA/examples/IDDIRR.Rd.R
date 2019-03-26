library(metaMA)


### Name: IDDIRR
### Title: Integration-driven Discovery and Integration-driven Revision
###   Rates
### Aliases: IDDIRR
### Keywords: methods models

### ** Examples

data(Singhdata)
out=EScombination(esets=Singhdata$esets,classes=Singhdata$classes)
IDDIRR(out$Meta,out$AllIndStudies)

## The function is currently defined as
#function(finalde,deindst)
#{
#DE=length(finalde)
#gains=finalde[which(!(finalde %in% deindst))]
#IDD=length(gains)
#IDR=IDD/DE*100
#perte=which(!(deindst %in% finalde))
#Loss=length(perte)
#IRR=Loss/length(deindst)*100
#res=c(DE,IDD,Loss,IDR,IRR)
#names(res)=c("DE","IDD","Loss","IDR","IRR")
#res
#}



