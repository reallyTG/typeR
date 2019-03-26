library(metaSEM)


### Name: Cooke16
### Title: Correlation Matrices from Cooke et al. (2016)
### Aliases: Cooke16
### Keywords: datasets

### ** Examples

## Not run: 
##D ## Check whether the correlation matrices are valid (positive definite)
##D Cooke16$data[is.pd(Cooke16$data)==FALSE]
##D 
##D ## Since the correlation matrix in Study 3 is not positive definite,
##D ## we exclude it in the following analyses
##D my.data <- Cooke16$data[-3]
##D my.n <- Cooke16$n[-3]
##D 
##D ## Show the no. of studies per correlation
##D pattern.na(my.data, show.na = FALSE)
##D 
##D ## Show the total sample sizes per correlation
##D pattern.n(my.data, my.n)
##D 
##D ## Stage 1 analysis
##D ## Random-effects model
##D random1 <- tssem1(my.data, my.n, method="REM", RE.type="Diag")
##D summary(random1)
##D 
##D A1 <- create.mxMatrix(c(0,0,0,0,0,
##D                         0,0,0,0,0,
##D                         0,0,0,0,0,
##D                         "0.2*SN2BI","0.2*ATT2BI","0.2*PBC2BI",0,0,
##D                         0,0,"0.2*PBC2BEH","0.2*BI2BEH",0),
##D                         type="Full", ncol=5, nrow=5,
##D                         byrow=TRUE, as.mxMatrix=FALSE)
##D 
##D ## This step is not necessary but it is useful for inspecting the model.
##D dimnames(A1)[[1]] <- dimnames(A1)[[2]] <- colnames(Cooke16$data[[1]])
##D 
##D ## Display A1
##D A1
##D 
##D S1 <- create.mxMatrix(c(1,
##D                         "0.1*ATT_SN", 1,
##D                         "0.1*PBC_SN", "0.1*PBC_ATT", 1,
##D                         0, 0, 0, "0.5*VarBI",
##D                         0, 0, 0, 0, "0.5*VarBEH"),
##D                       type = "Symm", ncol=5, nrow=5,
##D                       byrow=TRUE, as.mxMatrix=FALSE)
##D 
##D dimnames(S1)[[1]] <- dimnames(S1)[[2]] <- colnames(Cooke16$data[[1]])
##D S1
##D 
##D ## Stage 2 analysis
##D random2 <- tssem2(random1, Amatrix=A1, Smatrix=S1, diag.constraints=FALSE,
##D                   intervals.type="LB")
##D summary(random2)
##D 
##D ## Display the model
##D plot(random2, what="path")    
##D     
##D ## Display the model with the parameter estimates
##D plot(random2, color="yellow")
## End(Not run)



