## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ------------------------------------------------------------------------
require(CorReg)
    #dataset generation
    base=mixture_generator(n=15,p=10,ratio=0.4,tp1=1,tp2=1,tp3=1,positive=0.5,
                           R2Y=0.8,R2=0.9,scale=TRUE,max_compl=3,lambda=1)

    X_appr=base$X_appr #learning sample
    Y_appr=base$Y_appr #response variable for the learning sample
    Y_test=base$Y_test #responsee variable for the validation sample
    X_test=base$X_test #validation sample
    TrueZ=base$Z#True generative structure (binary adjacency matrix)


## ------------------------------------------------------------------------
TrueZ
    #TrueZ[i,j]==1 means that X[,j] linearly depends on X[,i]

## ------------------------------------------------------------------------
    #density estimation for the MCMC (with Gaussian Mixtures)
    density=density_estimation(X=X_appr,nbclustmax=10,detailed=TRUE,package = "Rmixmod")
    Bic_null_vect=density$BIC_vect# vector of the BIC found (1 value per covariate)
    

## ------------------------------------------------------------------------
    
    #MCMC to find the structure
    res=structureFinder(X=X_appr,verbose=0,reject=0,Maxiter=1500,
                nbini=30,candidates=-1,Bic_null_vect=Bic_null_vect,star=TRUE,p1max=15,clean=TRUE)
    hatZ=res$Z_opt #found structure (adjacency matrix)
    hatBic=res$bic_opt #associated BIC
   

## ------------------------------------------------------------------------
    #BIC comparison between true and found structure
    bicopt_vect=BicZ(X=X_appr,Z=hatZ,Bic_null_vect=Bic_null_vect)
    bicopt_True=BicZ(X=X_appr,Z=TrueZ,Bic_null_vect=Bic_null_vect)
    sum(bicopt_vect)
    sum(bicopt_True)


## ------------------------------------------------------------------------
    #Structure comparison
    compZ=compare_struct(trueZ=TrueZ,Zalgo=hatZ)#qualitative comparison
    compZ


## ------------------------------------------------------------------------
    #interpretation of found and true structure ordered by increasing R2
    readZ(Z=hatZ,crit="R2",X=X_appr,output="all",order=1)# <NA>line : name of subregressed covariate
    readZ(Z=TrueZ,crit="R2",X=X_appr,output="all",order=1)# <NA>line : name of subregressed covariate
  

## ------------------------------------------------------------------------
    #Regression coefficients estimation
     select="NULL"#without variable selection (otherwise, choose "lar" for example to use lasso selection)
    resY=correg(X=X_appr,Y=Y_appr,Z=hatZ,compl=TRUE,expl=TRUE,pred=TRUE,
                select=select,K=10)



## ------------------------------------------------------------------------
    #MSE computation
    MSE_complete=MSE_loc(Y=Y_test,X=X_test,A=resY$compl$A)#classical model on X
    MSE_marginal=MSE_loc(Y=Y_test,X=X_test,A=resY$expl$A)#reduced model without correlations
    MSE_plugin=MSE_loc(Y=Y_test,X=X_test,A=resY$pred$A)#plug-in model
    MSE_true=MSE_loc(Y=Y_test,X=X_test,A=base$A)# True model
 

## ------------------------------------------------------------------------
  #MSE comparison
    MSE=data.frame(MSE_complete,MSE_marginal,MSE_plugin,MSE_true)
    MSE#estimated structure
barplot(as.matrix(MSE),main="MSE on validation dataset", sub=paste("select=",select),col="blue")
   abline(h=MSE_complete,col="red")


