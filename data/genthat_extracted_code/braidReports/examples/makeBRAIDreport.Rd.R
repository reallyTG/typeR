library(braidReports)


### Name: makeBRAIDreport
### Title: Make a BRAID Report Page
### Aliases: makeBRAIDreport
### Keywords: hplot

### ** Examples

data(es8analysis)
pcont<-list(xtrans=function(x) x*10^6,ytrans=function(y) y*10^6,ztrans=function(z) 10^z,
			xunit=expression(mu*M),yunit=expression(mu*M),zlog=TRUE,abbs=c("Ola","TMZ"),
			levtext=c("90","99"),palette="revgjet",plot=FALSE,return=TRUE)
brep <- makeBRAIDreport(es8analysis,c("Olaparib","Temozolomide"),
			c(-1,-2),c(10^-6,5*10^-5),pcont)
brep[[1]]
brep[[10]]



