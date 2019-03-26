library(AGSDest)


### Name: GSTobj
### Title: Group sequential trial object (GSTobj)
### Aliases: GSTobj plot.GSTobj print.GSTobj print.summary.GSTobj
###   summary.GSTobj
### Keywords: datasets

### ** Examples

GSD=plan.GST(K=4,SF=1,phi=0,alpha=0.025,delta=6,pow=0.8,compute.alab=TRUE,compute.als=TRUE)
GST<-as.GST(GSD=GSD,GSDo=list(T=2, z=3.1))
GST
plot(GST)
GST<-summary(GST)
plot(GST)
##The repeated confidence interval, p-value and maximum likelihood estimate
##at the earlier stage T=1 where the trial stopping rule is not met.
summary(as.GST(GSD,GSDo=list(T=1,z=0.7)),ctype="r",ptype="r",etype="ml")
## Not run: 
##D ##If e.g. the stage-wise adjusted confidence interval is calculated at this stage,
##D ##the function returns an error message
##D summary(as.GST(GSD,GSDo=list(T=1,z=0.7)),ctype="so",etype="mu")
## End(Not run)



