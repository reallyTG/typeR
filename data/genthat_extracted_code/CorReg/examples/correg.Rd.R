library(CorReg)


### Name: correg
### Title: Linear regression using CorReg's method, with variable
###   selection.
### Aliases: correg

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
##D    TrueZ=base$Z#True generative structure (binary adjacency matrix)
##D    
##D    #Regression coefficients estimation
##D     select="lar"#variable selection with lasso (using lar algorithm)
##D    resY=correg(X=X_appr,Y=Y_appr,Z=TrueZ,compl=TRUE,expl=TRUE,pred=TRUE,
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
##D    
##D   barplot(as.matrix(MSE),main="MSE on validation dataset", sub=paste("select=",select))
##D   abline(h=MSE_complete,col="red")
##D    
## End(Not run)



