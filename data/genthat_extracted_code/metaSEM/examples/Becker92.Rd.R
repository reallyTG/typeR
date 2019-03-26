library(metaSEM)


### Name: Becker92
### Title: Six Studies of Correlation Matrices reported by Becker (1992;
###   1995)
### Aliases: Becker92
### Keywords: datasets

### ** Examples

## Not run: 
##D data(Becker92)
##D 
##D #### Fixed-effects model
##D ## First stage analysis
##D ## Replicate Becker's (1992) analysis using 4 studies only
##D fixed1 <- tssem1(Becker92$data[1:4], Becker92$n[1:4], method="FEM")
##D summary(fixed1)
##D 
##D ## Prepare a regression model using create.mxMatrix()
##D A1 <- create.mxMatrix(c(0,0,0,"0.2*Spatial2Math",
##D                         0,0,"0.2*Verbal2Math",0,0), type="Full",
##D                         ncol=3, nrow=3, as.mxMatrix=FALSE)
##D 
##D ## This step is not necessary but it is useful for inspecting the model.
##D dimnames(A1)[[1]] <- dimnames(A1)[[2]] <- c("Math","Spatial","Verbal") 
##D 
##D ## Display A1
##D A1
##D 
##D S1 <- create.mxMatrix(c("0.2*ErrorVarMath",0,0,1,"0.2*CorSpatialVerbal",1),
##D                         type="Symm", as.mxMatrix=FALSE)
##D 
##D ## This step is not necessary but it is useful for inspecting the model.
##D dimnames(S1)[[1]] <- dimnames(S1)[[2]] <- c("Math","Spatial","Verbal") 
##D 
##D ## Display S1
##D S1
##D 
##D ################################################################################
##D ## Alternative model specification in lavaan model syntax
##D model <- "## Regression paths
##D           Math~Spatial2Math*Spatial
##D           Math~Verbal2Math*Verbal
##D           Spatial~~CorSpatialVerbal*Verbal
##D           ## Fix the variances of Spatial and Verbal at 1
##D           Spatial~~1*Spatial
##D           Verbal~~1*Verbal
##D           ## Label the error variance of Math
##D           Math~~ErrorVarMath*Math+start(0.2)*Math"
##D 
##D ## Display the model
##D plot(model)
##D 
##D RAM <- lavaan2RAM(model, obs.variables=c("Math","Spatial","Verbal"))
##D RAM
##D 
##D A1 <- RAM$A
##D S1 <- RAM$S
##D ################################################################################
##D 
##D ## Fixed-effects model: Second stage analysis
##D ## Two equivalent versions to calculate the R2 and its 95% LBCI
##D fixed2 <- tssem2(fixed1, Amatrix=A1, Smatrix=S1, intervals.type="LB",
##D        mx.algebras=list(R1=mxAlgebra(Spatial2Math^2+Verbal2Math^2
##D                         +2*CorSpatialVerbal*Spatial2Math*Verbal2Math, name="R1"),
##D                         R2=mxAlgebra(One-Smatrix[1,1], name="R2"),
##D                         One=mxMatrix("Iden", ncol=1, nrow=1, name="One")))
##D summary(fixed2)
##D 
##D ## Display the model with the parameter estimates
##D plot(fixed2)
##D 
##D #### Random-effects model
##D ## First stage analysis
##D ## No random effects for off-diagonal elements
##D random1 <- tssem1(Becker92$data, Becker92$n, method="REM", RE.type="Diag")
##D summary(random1)
##D 
##D ## Random-effects model: Second stage analysis
##D random2 <- tssem2(random1, Amatrix=A1, Smatrix=S1, intervals.type="z")
##D summary(random2)
##D 
##D ## Display the model with the parameter estimates
##D plot(random2, color="yellow")
##D 
##D #### Conventional fixed-effects GLS approach
##D ## First stage analysis
##D ## No random effects
##D ## Replicate Becker's (1992) analysis using 4 studies only
##D gls1 <- tssem1(Becker92$data[1:4], Becker92$n[1:4], method="REM", RE.type="Zero",
##D                model.name="Fixed effects GLS Stage 1")
##D summary(gls1)
##D 
##D ## Fixed-effects GLS model: Second stage analysis
##D gls2 <- tssem2(gls1, Amatrix=A1, Smatrix=S1, intervals.type="z",
##D                model.name="Fixed effects GLS Stage 2")
##D summary(gls2)
## End(Not run)



