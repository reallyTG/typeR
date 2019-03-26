library(metaSEM)


### Name: Nohe15
### Title: Correlation Matrices from Nohe et al. (2015)
### Aliases: Nohe15A1 Nohe15A2
### Keywords: datasets

### ** Examples

## Not run: 
##D #### TSSEM
##D     
##D ## Set seed for replicability    
##D set.seed(23891)
##D     
##D ## Table A1
##D randA1a <- tssem1(Nohe15A1$data, Nohe15A1$n, method="REM", RE.type="Diag")
##D summary(randA1a)
##D 
##D model1 <- 'W2 ~ w2w*W1 + s2w*S1
##D            S2 ~ w2s*W1 + s2s*S1
##D            W1 ~~ w1WITHs1*S1
##D            W2 ~~ w2WITHs2*S2
##D            W1 ~~ 1*W1
##D            S1 ~~ 1*S1
##D            W2 ~~ Errw2*W2
##D            S2 ~~ Errs2*S2'
##D 
##D ## Display the model
##D plot(model1, layout="spring")    
##D     
##D RAM1 <- lavaan2RAM(model1, obs.variables=c("W1", "S1", "W2", "S2"))
##D RAM1
##D 
##D randA1b <- tssem2(randA1a, Amatrix=RAM1$A, Smatrix=RAM1$S)
##D summary(randA1b)
##D 
##D ## Display the model with the parameter estimates
##D plot(randA1b, layout="spring")    
##D 
##D ## Table A2
##D randA2a <- tssem1(Nohe15A2$data, Nohe15A2$n, method="REM", RE.type="Diag")
##D ## Rerun to remove error code
##D randA2a <- rerun(randA2a)
##D summary(randA2a)
##D 
##D model2 <- 'F2 ~ f2f*F1 + s2F*S1
##D            S2 ~ f2s*F1 + s2s*S1
##D            F1 ~~ f1WITHs1*S1
##D            F2 ~~ f2WITHs2*S2
##D            F1 ~~ 1*F1
##D            S1 ~~ 1*S1
##D            F2 ~~ Errf2*F2
##D            S2 ~~ Errs2*S2'
##D 
##D ## Display the model
##D plot(model2, layout="spring")
##D     
##D RAM2 <- lavaan2RAM(model2, obs.variables=c("F1", "S1", "F2", "S2"))
##D RAM2
##D 
##D randA2b <- tssem2(randA2a, Amatrix=RAM2$A, Smatrix=RAM2$S)
##D summary(randA2b)
##D 
##D ## Display the model with the parameter estimates
##D plot(randA2b, layout="spring")  
##D     
##D ## Estimate the heterogeneity of the parameter estimates
##D tssemParaVar(randA1a, randA2b)    
##D 
##D ## Parametric bootstrap based on Yu et al. (2016)
##D ## I assume that you know what you are doing!
##D 
##D ## Set seed for reproducibility
##D set.seed(39128482)
##D 
##D ## Average the correlation coefficients with the univariate-r approach
##D uni1 <- uniR1(Nohe15A1$data, Nohe15A1$n)
##D uni1
##D 
##D ## Generate random correlation matrices
##D boot.cor <- bootuniR1(uni1, Rep=50)
##D 
##D ## Display the quality of the generated correlation matrices
##D summary(boot.cor)
##D 
##D ## Proposed saturated model
##D model1 <- 'W2 + S2 ~ W1 + S1'
##D 
##D ## Use the harmonic mean of the sample sizes as n in SEM
##D n <- uni1$n.harmonic    
##D     
##D boot.fit1 <- bootuniR2(model=model1, data=boot.cor, n=n)
##D summary(boot.fit1)
##D 
##D ## Proposed model with equal regression coefficients
##D model2 <- 'W2 ~ Same*W1 + Cross*S1
##D            S2 ~ Cross*W1 + Same*S1'
##D 
##D boot.fit2 <- bootuniR2(model=model2, data=boot.cor, n=n)
##D summary(boot.fit2)
##D 
##D #### OSMASEM    
##D 
##D ## Calculate the sampling variance-covariance matrix of the correlation matrices.    
##D my.df <- Cor2DataFrame(Nohe15A1$data, Nohe15A1$n)
##D 
##D ## Add the centered Lag as a moderator
##D my.df$data <- data.frame(my.df$data, Lag=scale(Nohe15A1$Lag, scale=FALSE),
##D                          check.names=FALSE)
##D head(my.df$data)
##D 
##D ## Proposed model
##D model1 <- 'W2 ~ w2w*W1 + s2w*S1
##D            S2 ~ w2s*W1 + s2s*S1
##D            W1 ~~ w1WITHs1*S1
##D            W2 ~~ w2WITHs2*S2
##D            W1 ~~ 1*W1
##D            S1 ~~ 1*S1
##D            W2 ~~ Errw2*W2
##D            S2 ~~ Errs2*S2'
##D plot(model1)     
##D 
##D ## Convert it into RAM specification    
##D RAM1 <- lavaan2RAM(model1, obs.variables=c("W1", "S1", "W2", "S2"))
##D RAM1
##D 
##D ## Create vechs of the model implied correlation matrix
##D ## with implicit diagonal constraints
##D M0 <- create.vechsR(A0=RAM1$A, S0=RAM1$S)
##D 
##D ## Create heterogeneity variances
##D ## RE.type= either "Diag" or "Symm"
##D ## Transform= either "expLog" or "sqSD" for better estimation on variances
##D T0 <- create.Tau2(RAM=RAM1, RE.type="Diag")
##D 
##D ## Fit the model
##D fit0 <- osmasem(model.name="No moderator", Mmatrix=M0, Tmatrix=T0, data=my.df)
##D summary(fit0)
##D 
##D ## Get the SRMR
##D osmasemSRMR(fit0)
##D 
##D ## Get the transformed variance component of the random effects    
##D VarCorr(fit0)
##D     
##D ## "lag" as a moderator on A matrix
##D A1 <- matrix(c(0,0,0,0,
##D                0,0,0,0,
##D                "0*data.Lag","0*data.Lag",0,0,
##D                "0*data.Lag","0*data.Lag",0,0),
##D              nrow=4, ncol=4, byrow=TRUE)
##D               
##D M1 <- create.vechsR(A0=RAM1$A, S0=RAM1$S, Ax=A1)
##D 
##D fit1 <- osmasem(model.name="Lag as a moderator for Amatrix", Mmatrix=M1,
##D                 Tmatrix=T0, data= my.df)
##D summary(fit1)
##D VarCorr(fit1)
##D 
##D ## Compare the models with and without the moderator "lag"
##D anova(fit1, fit0)
##D 
##D ## Calculate the R2    
##D osmasemR2(fit0, fit1)
## End(Not run)



