library(pnmtrem)


### Name: pnmtrem1
### Title: Function to fit first-order Probit-Normal Marginalized
###   Transition Random Effects Models, PNMTREM(1)
### Aliases: pnmtrem1
### Keywords: multivariate longitudinal binary data marginalized models

### ** Examples

## Not run: 
##D ## loading a simulated bivariate longitudinal binary data with 500 subjects
##D ## and 4 time points
##D data(pnmtrem1.sim.data1)
##D data(pnmtrem1.sim.data2)
##D 
##D ## number of subjects, multiple responses and time points
##D nsubj<-500
##D nresp<-2
##D ntime<-4
##D 
##D ## sepearating the portion of data which pnmtrem1 function will use
##D covmat1<-as.matrix(pnmtrem1.sim.data1[,5:6])
##D covmat<-as.matrix(pnmtrem1.sim.data2[,5:7])
##D mresp1<-as.matrix(pnmtrem1.sim.data1[,4])
##D mresp<-as.matrix(c(pnmtrem1.sim.data1[,4],pnmtrem1.sim.data2[,4]))
##D 
##D ## obtaining initials for \beta^*
##D glm1<-glm(mresp1~-1+covmat1,family=binomial(link=probit))
##D bsinit<-glm1$coef;names(bsinit)<-NULL
##D 
##D ## initials for parameters in the baseline model, i.e. \beta^*, \lambda^*, c_1
##D param01<-c(bsinit,1,log(0.5))
##D 
##D ## obtaining initials of \beta
##D # preparing data to be analyzed by mmm2
##D mresp.mmm<-as.matrix(pnmtrem1.sim.data2[,4])
##D id<-as.matrix(rep(seq(1:nsubj),((ntime-1)*nresp)))
##D time<-as.matrix(c(rep(2,nsubj*nresp),rep(3,nsubj*nresp),rep(4,nsubj*nresp)))
##D data<-cbind(id,time,mresp.mmm,covmat)
##D 
##D # ordering data by subject ID
##D data2<-NULL
##D for (i in 1:nsubj){
##D data.id<-data[data[,1]==i,]
##D data2<-rbind(data2,data.id)
##D }
##D # subsetting data by response type (6th column of data2)
##D data.resp1<-data2[data2[,6]==1,]
##D data.resp2<-data2[data2[,6]==0,]
##D data.mmm<-cbind(data.resp1[,1],data.resp1[,3],data.resp2[,3],data.resp1[,5])
##D library(mmm2)
##D mmm2.fit<-mmm2(data=data.mmm,nresp=2,family=binomial(link=probit),
##D corstr = "exchangeable")
##D binit<-coef(mmm2.fit)
##D 
##D ## obtaining initials of \alpha
##D glm3<-glm(mresp[(nsubj*nresp+1):(2*nsubj*nresp),]~-1+mresp1,family=binomial(link=probit))
##D glm4<-glm(mresp[(2*nsubj*nresp+1):(3*nsubj*nresp),]~-1+
##D mresp[(nsubj*nresp+1):(2*nsubj*nresp),],family=binomial(link=probit))
##D glm5<-glm(mresp[(3*nsubj*nresp+1):(4*nsubj*nresp),]~-1+
##D mresp[(2*nsubj*nresp+1):(3*nsubj*nresp),],family=binomial(link=probit))
##D alpinit<-c(glm3$coef[1],glm4$coef[1],glm5$coef[1]);names(alpinit)<-NULL
##D 
##D ## initials for parameters in the t \geq 2 model, i.e. \beta, \alpha, \lambda, c_2, c_3, c_4
##D param02<-c(binit,alpinit,1,log(0.5),log(0.5),log(0.5))
##D 
##D ## implicit function initials, \beta_0 and \alpha_0
##D beta0<-matrix(c(0,0,0),ncol=1)
##D alpha0<-matrix(c(0,0,0),ncol=1)
##D 
##D ## covariate set to be interacted with the response history
##D z<-matrix(rep(1,3*nsubj*nresp),ncol=1)
##D 
##D fit<-pnmtrem1(covmat1=covmat1,covmat2=covmat,respmat1=mresp1,respmat2=mresp,z=z,
##D nsubj=500,nresp=2,param01=param01,param02=param02,beta0=beta0,alpha0=alpha0,
##D tol1=0.0001,tol2=0.0001,maxiter1=50,maxiter2=50,tun1=1,tun2=1,x01=0,eps1=10^-10,
##D x02=0,eps2=10^-10,silent=FALSE,delta.print=TRUE,deltastar.print=TRUE)
##D 
##D ## manipulation of the output
##D fit
##D fit$output1
##D fit$maxloglik1
##D fit$output2
##D fit$maxloglik2
##D fit$delta
##D fit$delstar
##D fit$empbayes
## End(Not run)



