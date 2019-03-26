library(RDFTensor)


### Name: RDFTensor-package
### Title: Different Tensor Factorization (Decomposition) Techniques for
###   RDF Tensors (Three-Mode-Tensors)
### Aliases: RDFTensor-package RDFTensor
### Keywords: Tensor Factorization Tensor Decomposition RDF Tensor

### ** Examples

## Not run: 
##D  data(umls_tnsr)
##D  ntnsr=umls_tnsr
##D     r=10
##D     
##D     sr=NULL
##D     t0=proc.time()
##D     X_=list()
##D     library(Matrix)
##D     tt=rescal(umls_tnsr$X,rnk=10,ainit='nvecs',verbose=1,lambdaA=0,epsilon=1e-2,lambdaR=0)
##D     R=tt$R
##D     A=tt$A
##D      for(s in 1:length(R)){
##D       print(sprintf('-------------=======s=%d==========---------',s))
##D       t1=proc.time()
##D       t1n=A%*%R[[s]]%*%Matrix::t(A)
##D       mx=max(t1n@x)
##D       Xb=Matrix::spMatrix(i=ntnsr$X[[s]]@i+1,j=ntnsr$X[[s]]@j+1,x=ntnsr$X[[s]]@x==1,
##D       nrow=nrow(ntnsr$X[[s]]),ncol=ncol(ntnsr$X[[s]]))
##D       
##D       all_scale_fact=c(0.7,0.8,0.9,0.95,1,1.05,1.1,1.2,1.3,1.4,1.5,1.8)
##D       for(scale_fact in all_scale_fact){
##D           qntl=scale_fact*sum(Xb)/(nrow(ntnsr$X[[s]])*ncol(ntnsr$X[[s]]))
##D             thr=quantile(t1n@x,1-qntl)
##D             print(sprintf('-------------%f---------',thr))
##D                  aa=which(t1n>thr,arr.ind=TRUE)
##D                  if(length(aa)>0){
##D                     X_[[s]]=Matrix::spMatrix(i=aa[,1],j=aa[,2],x=rep(1,nrow(aa)),
##D                     nrow=nrow(A),ncol=nrow(A))#tt > threshold[i],'sparseMatrix')
##D                 }else{
##D                    X_[[s]]=Matrix::spMatrix(i=1,j=1,x=0,nrow=nrow(A),ncol=nrow(A))
##D                 }
##D         #---
##D             li=Xb@i[Xb@x]+1
##D             lj=Xb@j[Xb@x]+1
##D             tp=sum(X_[[s]][cbind(li,lj)])
##D             fn=sum(Xb@x)-tp#sum(!X_[cbind(li,lj)])
##D             # incase of scale_fact=1 fp=fn as number of 1's in X_ and X is the same
##D             fp=sum(X_[[s]]@x)-tp
##D             sr=rbind(sr,cbind(s=s,r=r,scale_fact=scale_fact,mx=mx,thr=thr,nnz=sum(Xb),
##D             tp=tp,fn=fn,fp=fp,R=tp/(tp+fn),P=tp/(tp+fp)))
##D         #    if(tp==0) break;
##D         }
##D         t2=proc.time()
##D         print(t2-t1)  
##D     }
##D  tf=proc.time()
##D  print(tf-t0)
##D 
##D  Res=NULL
##D     for(sf in all_scale_fact){
##D         sr.sf=sr[sr[,'scale_fact']==sf ,]
##D          R=sum(sr.sf[,'tp'])/(sum(sr.sf[,'tp'])+sum(sr.sf[,'fn']))
##D          P=sum(sr.sf[,'tp'])/(sum(sr.sf[,'tp'])+sum(sr.sf[,'fp']))
##D         cnt=nrow(sr.sf)
##D         Res=rbind(Res,cbind(sf=sf,P,R,cnt))
##D     }
##D    print(Res)
##D 
##D    stats=Res
##D 
##D      plot(stats[,'sf'],stats[,'R']*100,type='b',col='red',lwd=2,
##D     main=sprintf('RESCAL, choosing scale factor (sf):(ntrp*sf), dataset: %s, 
##D         #Slices:%d\n #Known facts:%d','UMLS',length(ntnsr$X),
##D         sum(sr.sf[,'tp']+sr.sf[,'fn'])),ylab="",xlab='Scale Factor',
##D     xlim=c(0,max(sf)),ylim=c(0,100))
##D     HM=apply(stats,1,function(x){2/(1/x['P']+1/x['R'])})
##D     points(stats[,'sf'],stats[,'P']*100,col='blue',lwd=2,type='b')
##D     points(stats[,'sf'],100*HM,col='green',lwd=2,type='b')
##D     grid(nx=10, lty = "dotted", lwd = 2)
##D     legend(legend=c('Recall','Precision','Harmonic mean'),col=c('red','blue','green'),
##D     x=0.6,y=20,pch=1,cex=0.75,lwd=2)
##D 
##D     max(HM)
##D 
##D 
##D     hist(sr[sr[,'scale_fact']==1,'thr'],col='grey',
##D     main='UMLS Reconstring the same number of triples, Actual threshold',
##D     xlab='threshold',cex.main=0.75)
## End(Not run)


trp=rbind(
    cbind('Alex',  'loves', 'Don'),
    cbind('Alex',  'loves', 'Elly'),
    cbind('Alex',  'hates', 'Bob'),
    cbind('Don',   'loves', 'Alex'),
    cbind('Don',   'hates', 'Chris'),
    cbind('Chris', 'hates', 'Bob'),
    cbind('Bob',   'hates', 'Chris'),
    cbind('Elly',  'hates', 'Chris'),
    cbind('Elly',  'hates', 'Bob'),
    cbind('Elly',  'loves', 'Alex')
    )
######
# form tensor as a set of frontal slices (Predicate mode)
    tnsr=getTensor(trp)
    subs=getTnsrijk(tnsr$X)
    X=list(subs=subs,vals=rep(1,nrow(subs)),size=c(5,2,5))
    normX=sqrt(sum(X$vals))
    set.seed(123)
    # NMU decomposition with rank 2
    P1=cp_nmu(X,2)
   
    ###
    # find best CP boolean Factorization based on NMU
    res=CP_01(X,P1[[1]])
    Fac=res$sol$u # The factorization
    # TP,FP,FN
    print(sprintf("TP=%d, FP=%d, FN=%d, Threshold=%f",res$sol$TP,res$sol$FP,res$sol$FN,res$sol$thr))

    #################   CP_APR   ###################
    res=cp_apr(X,R=2,opts=list(alg='pdnr',printinneritn=1))

    set.seed(12345)
    res1=CP_01(X,res[[1]])
    res2=CP_R01(X,res[[1]])
    #res3=CP_01ext(X,res[[1]])
    ###################   RESCAL  #############################

    tt=rescal(tnsr$X,2,ainit='random',verbose=3)
    R=tt[['R']]
    A=tt[['A']]

    Tensor_error(tnsr$X,A,R)
    t1n= A
    t2n= A



