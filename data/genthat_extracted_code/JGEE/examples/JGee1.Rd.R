library(JGEE)


### Name: JGee1
### Title: Function to fit a joint generalized estimating equation model
###   with shared regression coefficients
### Aliases: JGee1 mycor_jgee1 print.JGee1 print.summary.JGee1 S_H1
###   summary.JGee1
### Keywords: joint modelling marginal models

### ** Examples

## Not run: 
##D data(MSCMsub)
##D mydata=MSCMsub
##D 
##D #MSCM stduy data layout requires some arrangement for model fitting.
##D 
##D N=167
##D nt=4
##D nr=2
##D 
##D yvec=matrix(0,N*nt*nr,1)
##D xmat=matrix(0,N*nt*nr,8)
##D 
##D for(i in 1:N) {
##D for(j in 1:nt){
##D yvec[j+(i-1)*nr*nt]=mydata[j+(i-1)*nt,2]
##D yvec[j+(i-1)*nr*nt+nt]=mydata[j+(i-1)*nt,3]
##D }
##D }
##D 
##D for(i in 1:N) {
##D for(j in 1:nt){
##D for(k in 4:11){
##D xmat[j+(i-1)*nr*nt,(k-3)]=mydata[j+(i-1)*nt,k]
##D xmat[j+(i-1)*nr*nt+nt,(k-3)]=mydata[j+(i-1)*nt,k]
##D }
##D }
##D }
##D 
##D id=rep(1:N, each=(nt*nr))
##D mydatanew=data.frame(id,yvec,xmat)
##D head(mydatanew)
##D colnames(mydatanew)=c("id","resp","chlth","csex","education","employed",
##D "housize","married","mhlth","race")
##D head(mydatanew)
##D 
##D formulaj1=resp~chlth+csex+education+employed+housize+married+
##D mhlth+race
##D 
##D fitjgee1=JGee1(formula=formulaj1,id=mydatanew[,1],data=mydatanew, nr=2, 
##D na.action=NULL, family=binomial(link="logit"), corstr1="exchangeable", 
##D Mv=NULL, corstr2="independence", beta_int=NULL, R1=NULL, R2=NULL, 
##D scale.fix= FALSE, scale.value=1, maxiter=25, tol=10^-3, 
##D silent=FALSE)
##D 
##D summary(fitjgee1)
##D 
##D names(summary(fitjgee1))
##D 
##D summary(fitjgee1)$working.correlation1
## End(Not run)



