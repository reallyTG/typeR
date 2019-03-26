library(RDFTensor)


### Name: rescal
### Title: RESCAL: Tensor Factorization.
### Aliases: rescal
### Keywords: RESCAL

### ** Examples

    X1=matrix(c(1,0,0,0,0, 0,1,0,0,0, 0,0,1,1,0, 0,0,0,0,1, 1,0,0,0,0),byrow=TRUE,nrow=5,ncol=5)
    X2=matrix(c(0,1,0,1,1, 1,0,0,1,0, 0,1,0,1,1, 0,0,0,0,1, 0,0,1,0,0),byrow=TRUE,nrow=5,ncol=5)
    X2_=matrix(c(0,1,0,1,1, 1,0,0,1,0, 0,0,0,0,0, 0,0,0,0,1, 0,0,1,0,0),byrow=TRUE,nrow=5,ncol=5)
    X=list(t(X1),t(X2),t(X2_))

    N=nrow(X1)
    Xs=list()
    for(s in 1:length(X)){
      aa=which(X[[s]]==1,arr.ind=TRUE)
      Xs[[s]]=Matrix::sparseMatrix(x=rep(1,nrow(aa)),i=aa[,1],j=aa[,2],dims=c(N,N))
    }

    print(Xs)

    rf=rescal(Xs,2)
    A=rf$A
    R=rf$R
    Tensor_error(Xs,A,R)
    tmp=rescal_01(Xs,A,R,scale_fact=1.5)#generate 1.5*original number of triples
    print(sprintf('Precision:%.4f, Recall:%.4f',tmp$tp/(tmp$tp+tmp$fp),tmp$tp/(tmp$tp+tmp$fn)))

#using RESCAL for prediction missing relations.

aa=read.table(file = paste0(path.package("RDFTensor"), '/toy_vicePresident.nt'),
                                sep=' ',header=FALSE,stringsAsFactors=FALSE)
trp=aa[,1:3]

tnsr=getTensor(trp)
    r=4
    
    sr=NULL
    t0=proc.time()
    X_=list()
    library(Matrix)
    tt=rescal(tnsr$X,rnk=r,ainit='nvecs',verbose=1,lambdaA=0,epsilon=1e-4,lambdaR=0)
    R=tt$R
    A=tt$A
s1=A%*%R[[1]]%*%Matrix::t(A)
s2=A%*%R[[1]]%*%Matrix::t(A)
#predict the party of AlGore (no explicit info is given in the nt file)
print(s1[tnsr$SO=='<http://example.com/AlGore>',tnsr$SO=='<http://example.com/RepublicanParty>'])
print(s1[tnsr$SO=='<http://example.com/AlGore>',tnsr$SO=='<http://example.com/DemocraticParty>'])
partyOf=data.frame(tnsr$SO,Repub=s1[,tnsr$SO=='<http://example.com/RepublicanParty>'],
           Democ=s1[,tnsr$SO=='<http://example.com/DemocraticParty>'],
    GivenRepub=tnsr$X[[1]][,tnsr$SO=='<http://example.com/RepublicanParty>'],
          GivenDemoc=tnsr$X[[1]][,tnsr$SO=='<http://example.com/DemocraticParty>'],
    stringsAsFactors=FALSE)  
    
 print(partyOf)




