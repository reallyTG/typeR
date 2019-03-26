library(ARpLMEC)


### Name: ARpLMEC.est
### Title: Autoregressive Censored Linear Mixed Effects Models
### Aliases: ARpLMEC.est

### ** Examples


## Not run: 
##D p.cens   = 0.1
##D m           = 10
##D D = matrix(c(0.049,0.001,0.001,0.002),2,2)
##D sigma2 = 0.30
##D phi    = c(0.48,-0.2)
##D beta   = c(1,2,1)
##D nj=c(6,5,6,8,5,7,8,6,5,4) 
##D x<-matrix(runif(sum(nj)*length(beta),-1,1),sum(nj),length(beta))
##D z<-matrix(runif(sum(nj)*dim(D)[1],-1,1),sum(nj),dim(D)[1])
##D data=ARpLMEC.sim(m,x,z,nj,beta,sigma2,D,phi,p.cens)
##D attach(data)
##D Arp    = 2
##D  ##Estimacao sem Previcao
##D teste1=ARpLMEC.est(y_cc,x,z,cc,nj,Arp,MaxIter = 10)
##D 
##D ##Estimacao com Previcao
##D xx=matrix(runif(6*length(beta),-1,1),6,length(beta))
##D zz=matrix(runif(6*dim(D)[1],-1,1),6,dim(D)[1])
##D isubj=c(1,4,5)
##D teste2=ARpLMEC.est(y_cc,x,z,cc,nj,Arp,MaxIter=10,Prev=TRUE,step=2,isubj=isubj,xpre=xx,zpre=zz)
##D teste2$Prev
## End(Not run)





