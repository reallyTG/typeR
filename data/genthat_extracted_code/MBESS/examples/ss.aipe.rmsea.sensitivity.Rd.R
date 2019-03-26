library(MBESS)


### Name: ss.aipe.rmsea.sensitivity
### Title: a priori Monte Carlo simulation for sample size planning for
###   RMSEA in SEM
### Aliases: ss.aipe.rmsea.sensitivity
### Keywords: design multivariate

### ** Examples

## Not run: 
##D #########################
##D EXAMPLE 1 
##D ######################### 
##D # To replicate the simulation in the first panel, second column of 
##D # Table 2 (i.e., population RMSEA=0.0268, df=23, desired width=0.02) 
##D # in Lai and Kelley (2010), the following steps can be used.
##D 
##D ## STEP 1: Obtain the (correct) population covariance matrix implied by Model 2
##D # This requires the model and its population model parameter values.
##D library(MASS)
##D library(sem)
##D 
##D # Specify Model 2 in the RAM notation
##D model.2<-specifyModel()
##D xi1 -> y1, lambda1, 1
##D xi1 -> y2, NA, 1
##D xi1 -> y3, lambda2, 1
##D xi1 -> y4, lambda3, 0.3
##D eta1 -> y4, lambda4, 1
##D eta1 -> y5, NA, 1
##D eta1 -> y6, lambda5, 1
##D eta1 -> y7, lambda6, 0.3
##D eta2 -> y6, lambda7, 0.3
##D eta2 -> y7, lambda8, 1
##D eta2 -> y8, NA, 1
##D eta2 -> y9, lambda9, 1
##D xi1 -> eta1, gamma11, 0.6
##D eta1 -> eta2, beta21, 0.6 
##D xi1 <-> xi1, phi11, 0.49
##D eta1 <-> eta1, psi11, 0.3136
##D eta2 <-> eta2, psi22, 0.3136
##D y1 <-> y1, delta1, 0.51
##D y2 <-> y2, delta2, 0.51
##D y3 <-> y3, delta3, 0.51
##D y4 <-> y4, delta4, 0.2895
##D y5 <-> y5, delta5, 0.51
##D y6 <-> y6, delta6, 0.2895
##D y7 <-> y7, delta7, 0.2895
##D y8 <-> y8, delta8, 0.51
##D y9 <-> y9, delta9, 0.51
##D 
##D 
##D # To inspect the specified model
##D model.2
##D 
##D # Specify model parameter values
##D theta <- c(1, 1, 0.3, 1,1, 0.3, 0.3, 1, 1, 0.6, 0.6,
##D 0.49, 0.3136, 0.3136, 0.51, 0.51, 0.51, 0.2895, 0.51, 0.2895, 0.2895, 0.51, 0.51)
##D 
##D names(theta) <- c("lambda1","lambda2","lambda3",
##D "lambda4","lambda5","lambda6","lambda7","lambda8","lambda9",
##D "gamma11", "beta21",
##D "phi11", "psi11", "psi22", 
##D "delta1","delta2","delta3","delta4","delta5","delta6","delta7",
##D "delta8","delta9")
##D 
##D res<-theta.2.Sigma.theta(model=model.2, theta=theta, 
##D latent.vars=c("xi1", "eta1","eta2"))
##D 
##D Sigma.theta <- res$Sigma.theta
##D # Then 'Sigma.theta' is the (true) population covariance matrix
##D 
##D ## STEP 2: Create a misspecified model
##D # The following model is misspecified in the same way as did Lai and Kelley (2010)
##D # with the goal to obtain a relatively small population RMSEA
##D 
##D model.2.mis<-specifyModel()
##D xi1 -> y1, lambda1, 1
##D xi1 -> y2, NA, 1
##D xi1 -> y3, lambda2, 1
##D xi1 -> y4, lambda3, 0.3
##D eta1 -> y4, lambda4, 1
##D eta1 -> y5, NA, 1
##D eta1 -> y6, lambda5, 0.96
##D eta2 -> y6, lambda7, 0.33
##D eta2 -> y7, lambda8, 1.33
##D eta2 -> y8, NA, 1
##D eta2 -> y9, lambda9, 1
##D xi1 -> eta1, gamma11, 0.6
##D eta1 -> eta2, beta21, 0.65 
##D xi1 <-> xi1, phi11, 0.49
##D eta1 <-> eta1, psi11, 0.3136
##D eta2 <-> eta2, psi22, 0.23
##D y1 <-> y1, delta1, 0.51
##D y2 <-> y2, delta2, 0.51
##D y3 <-> y3, delta3, 0.51
##D y4 <-> y4, delta4, 0.2895
##D y5 <-> y5, delta5, 0.51
##D y6 <-> y6, delta6, 0.29
##D y7 <-> y7, delta7, 0.22
##D y8 <-> y8, delta8, 0.56
##D y9 <-> y9, delta9, 0.56
##D 
##D 
##D # To verify the population RMSEA of this misspecified model
##D fit<-sem(ram=model.2.mis, S=Sigma.theta, N=1000000)
##D summary(fit)$RMSEA
##D 
##D ## STEP 3: Conduct the simulation
##D # The number of replications is set to a very small value just to demonstrate
##D # and save time. Real simulation studies require a larger number (e.g., 500, 1,000)
##D 
##D ss.aipe.rmsea.sensitivity(width=0.02, model=model.2.mis, Sigma=Sigma.theta, G=10)
##D 
##D ## STEP 3+: In cases where this function stops before it finishes the simulation
##D # Suppose it stops at the 7th replication. The text 
##D # file "results_ss.aipe.rmsea.sensitivity.txt" saves the results in all 
##D # previous replications; in this case it contains 6 replications since
##D # the simulation stopped at the 7th. The user can start this function again and specify
##D # 'G' to 4 (i.e., 10-6). New results will be appended to previous ones in the same file.
##D 
##D ss.aipe.rmsea.sensitivity(width=0.02, model=model.2.mis, Sigma=Sigma.theta, G=4)
##D 
##D ########################################
##D EXAMPLE 2
##D ########################################
##D # In addition to create a misspecified model by changing the model
##D # parameters in the true model as does Example 1, a misspecified
##D # model can also be created with the Cudeck-Browne (1992) procedure. 
##D # This procedure is implemented in the 'Sigma.2.SigmaStar( )' function in
##D # the MBESS package. Please refer to the help file of 'Sigma.2.SigmaStar( )'
##D # for detailed documentation.
##D 
##D ## STEP 1: Specify the model
##D # This model is the same as the model in the first step of Example 1, but the
##D # model-implied population covariance matrix is no longer the true population 
##D # covariance matrix. The true population covariance matrix will be generated
##D # in Step 2 with the Cudeck-Browne procedure.
##D library(MASS)
##D library(sem)
##D 
##D model.2<-specifyModel()
##D xi1 -> y1, lambda1, 1
##D xi1 -> y2, NA, 1
##D xi1 -> y3, lambda2, 1
##D xi1 -> y4, lambda3, 0.3
##D eta1 -> y4, lambda4, 1
##D eta1 -> y5, NA, 1
##D eta1 -> y6, lambda5, 1
##D eta1 -> y7, lambda6, 0.3
##D eta2 -> y6, lambda7, 0.3
##D eta2 -> y7, lambda8, 1
##D eta2 -> y8, NA, 1
##D eta2 -> y9, lambda9, 1
##D xi1 -> eta1, gamma11, 0.6
##D eta1 -> eta2, beta21, 0.6 
##D xi1 <-> xi1, phi11, 0.49
##D eta1 <-> eta1, psi11, 0.3136
##D eta2 <-> eta2, psi22, 0.3136
##D y1 <-> y1, delta1, 0.51
##D y2 <-> y2, delta2, 0.51
##D y3 <-> y3, delta3, 0.51
##D y4 <-> y4, delta4, 0.2895
##D y5 <-> y5, delta5, 0.51
##D y6 <-> y6, delta6, 0.2895
##D y7 <-> y7, delta7, 0.2895
##D y8 <-> y8, delta8, 0.51
##D y9 <-> y9, delta9, 0.51
##D 
##D 
##D 
##D theta <- c(1, 1, 0.3, 1,1, 0.3, 0.3, 1, 1, 0.6, 0.6,
##D 0.49, 0.3136, 0.3136, 0.51, 0.51, 0.51, 0.2895, 0.51, 0.2895, 0.2895, 0.51, 0.51)
##D 
##D names(theta) <- c("lambda1","lambda2","lambda3",
##D "lambda4","lambda5","lambda6","lambda7","lambda8","lambda9",
##D "gamma11", "beta21",
##D "phi11", "psi11", "psi22", 
##D "delta1","delta2","delta3","delta4","delta5","delta6","delta7",
##D "delta8","delta9")
##D 
##D ## STEP 2: Create the true population covariance matrix, so that (a) the model fits
##D # to this covariance matrix with specified discrepancy; (b) the population model
##D # parameters (the object 'theta') is the minimizer in fitting the model to the true 
##D # population covariance matrix.
##D 
##D # Since the desired RMSEA is 0.0268 and the df is 22, the MLE discrepancy value
##D # is specified to be 22*0.0268*0.0268, given the definition of RMSEA.
##D 
##D res <- Sigma.2.SigmaStar(model=model.2, model.par=theta, 
##D latent.var=c("xi1", "eta1", "eta2"), discrep=22*0.0268*0.0268)
##D 
##D Sigma.theta.star <- res$Sigma.star
##D 
##D # To verify that the population RMSEA is 0.0268
##D res2 <- sem(ram=model.2, S=Sigma.theta.star, N=1000000)
##D summary(res2)$RMSEA
##D 
##D ## STEP 3: Conduct the simulation
##D # Note although Examples 1 and 2 have the same population RMSEA, the
##D # model df and true population covariance matrix are different. Example 1
##D # uses 'model.2.mis' and 'Sigma.theta', whereas Example 2 uses 'model.2'
##D # and 'Sigma.theta.star'. Since the df is different, it requires a different sample
##D # size to achieve the same desired confidence interval width. 
##D ss.aipe.rmsea.sensitivity(width=0.02, model=model.2, Sigma=Sigma.theta.star, G=10)
## End(Not run)



