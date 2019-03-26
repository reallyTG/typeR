library(CorReg)


### Name: structureFinder
### Title: MCMC algorithm to find a structure between the covariates
### Aliases: structureFinder

### ** Examples

## Not run: 
##D   rm(list=ls())#clean the workspace
##D   
##D require(CorReg)
##D    #dataset generation
##D    base=mixture_generator(n=15,p=10,ratio=0.4,tp1=1,tp2=1,tp3=1,positive=0.5,
##D                           R2Y=0.8,R2=0.9,scale=TRUE,max_compl=3,lambda=1)
##D    X_appr=base$X_appr #learning sample
##D    Y_appr=base$Y_appr #response variable for the learning sample
##D    Y_test=base$Y_test #responsee variable for the validation sample
##D    X_test=base$X_test #validation sample
##D    
##D    TrueZ=base$Z#True generative structure (binary adjacency matrix)
##D    
##D    #density estimation for the MCMC (with Gaussian Mixtures)
##D    density=density_estimation(X=X_appr,nbclustmax=10,detailed=TRUE)
##D    Bic_null_vect=density$BIC_vect# vector of the BIC found (1 value per covariate)
##D    
##D    #MCMC to find the structure
##D    res=structureFinder(X=X_appr,verbose=0,reject=0,Maxiter=900,plot=TRUE,
##D                nbini=20,candidates=-1,Bic_null_vect=Bic_null_vect,star=TRUE,p1max=15,clean=TRUE)
##D    hatZ=res$Z_opt #found structure (adjacency matrix)
##D    hatBic=res$bic_opt #associated BIC
##D    
##D    #looking inside the walk
##D   
##D par(mar=c(5,4,4,5)+.1)
##D plot(res$bic_step,type="l",col="red",ylab="BIC",
##D     sub="blue: complexity, red: BIC", main="Evolution of BIC and complexity during the walk")
##D par(new=TRUE)
##D plot(res$complexity_step,type="l",col="blue",xaxt="n",yaxt="n",xlab="",ylab="")
##D axis(4)
##D mtext("Complexity",side=4,line=3)
##D #legend("topleft",col=c("red","blue"),lty=1,legend=c("BIC","Complexity"))
##D    
##D    #BIC comparison between true and found structure
##D    bicopt_vect=BicZ(X=X_appr,Z=hatZ,Bic_null_vect=Bic_null_vect)
##D    bicopt_vrai=BicZ(X=X_appr,Z=TrueZ,Bic_null_vect=Bic_null_vect)
##D    sum(bicopt_vect);sum(bicopt_vrai)
##D    
##D    #Structure comparison
##D    compZ=compare_struct(trueZ=TrueZ,Zalgo=hatZ)#qualitative comparison
##D    
##D    #interpretation of found and true structure ordered by increasing R2
##D    readZ(Z=hatZ,crit="R2",X=X_appr,output="all",order=1)# <NA>line : name of subregressed covariate
##D    readZ(Z=TrueZ,crit="R2",X=X_appr,output="all",order=1)# <NA>line : name of subregressed covariate
##D   
## End(Not run) 





