library(CorReg)


### Name: CorReg-package
### Title: Quick tutorial for CorReg package
### Aliases: CorReg-package
### Keywords: package

### ** Examples

   ## Not run: 
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
##D    #Z_i,j=1 means that Xj linearly depends on Xi
##D    
##D    #density estimation for the MCMC (with Gaussian Mixtures)
##D    density=density_estimation(X=X_appr,nbclustmax=10,detailed=TRUE)
##D    Bic_null_vect=density$BIC_vect# vector of the BIC found (1 value per covariate)
##D    
##D    #MCMC to find the structure
##D    res=structureFinder(X=X_appr,verbose=0,reject=0,Maxiter=900,
##D                nbini=20,candidates=-1,Bic_null_vect=Bic_null_vect,star=TRUE,p1max=15,clean=TRUE)
##D    hatZ=res$Z_opt #found structure (adjacency matrix)
##D    hatBic=res$bic_opt #associated BIC
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
##D    #Regression coefficients estimation
##D     select="NULL"#without variable selection (otherwise, choose "lar" for example)
##D    resY=correg(X=X_appr,Y=Y_appr,Z=hatZ,compl=TRUE,expl=TRUE,pred=TRUE,
##D                select=select,K=10)
##D    
##D    #MSE computation
##D    MSE_complete=MSE_loc(Y=Y_test,X=X_test,A=resY$compl$A)#classical model on X
##D    MSE_marginal=MSE_loc(Y=Y_test,X=X_test,A=resY$expl$A)#reduced model without correlations
##D    MSE_plugin=MSE_loc(Y=Y_test,X=X_test,A=resY$pred$A)#plug-in model
##D    MSE_true=MSE_loc(Y=Y_test,X=X_test,A=base$A)# True model
##D    
##D    
##D    #MSE comparison
##D    MSE=data.frame(MSE_complete,MSE_marginal,MSE_plugin,MSE_true)
##D    MSE#estimated structure
##D    compZ$true_left;compZ$false_left
##D   barplot(as.matrix(MSE),main="MSE on validation dataset", sub=paste("select=",select))
##D   abline(h=MSE_complete,col="red")
##D    
## End(Not run)



