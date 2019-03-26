library(metaSEM)


### Name: Hunter83
### Title: Fourteen Studies of Correlation Matrices reported by Hunter
###   (1983)
### Aliases: Hunter83
### Keywords: datasets

### ** Examples

## Not run: 
##D data(Hunter83)
##D 
##D #### Fixed-effects model
##D ## First stage analysis
##D fixed1 <- tssem1(Hunter83$data, Hunter83$n, method="FEM",
##D                  model.name="TSSEM1 fixed effects model")
##D summary(fixed1)
##D 
##D #### Second stage analysis
##D ## Model without direct effect from Ability to Supervisor
##D A1 <- create.mxMatrix(c(0,"0.1*A2J","0.1*A2W",0,0,0,"0.1*J2W","0.1*J2S",
##D                         0,0,0,"0.1*W2S",0,0,0,0),
##D                         type="Full", ncol=4, nrow=4, as.mxMatrix=FALSE)
##D 
##D ## This step is not necessary but it is useful for inspecting the model.
##D dimnames(A1)[[1]] <- dimnames(A1)[[2]] <- c("Ability","Job","Work","Supervisor") 
##D A1
##D 
##D S1 <- create.mxMatrix(c(1,"0.1*Var_e_J", "0.1*Var_e_W", "0.1*Var_e_S"),
##D                       type="Diag", as.mxMatrix=FALSE)
##D dimnames(S1)[[1]] <- dimnames(S1)[[2]] <- c("Ability","Job","Work","Supervisor") 
##D S1
##D 
##D ################################################################################
##D ## Alternative model specification in lavaan model syntax
##D model <- "## Regression paths
##D           Job_knowledge ~ A2J*Ability
##D           Work_sample ~ A2W*Ability + J2W*Job_knowledge
##D           Supervisor ~ J2S*Job_knowledge + W2S*Work_sample
##D 
##D           ## Fix the variance of Ability at 1
##D           Ability ~~ 1*Ability
##D 
##D           ## Label the error variances of the dependent variables
##D           Job_knowledge ~~ VarE_J*Job_knowledge
##D           Work_sample ~~ VarE_W*Work_sample
##D           Supervisor ~~ VarE_S*Supervisor"
##D 
##D ## Display the model
##D plot(model, layout="spring", sizeMan=10)
##D 
##D RAM <- lavaan2RAM(model, obs.variables=c("Ability","Job_knowledge",
##D                   "Work_sample","Supervisor"))
##D RAM
##D 
##D A1 <- RAM$A
##D S1 <- RAM$S
##D 
##D ################################################################################
##D fixed2 <- tssem2(fixed1, Amatrix=A1, Smatrix=S1, intervals.type="LB",
##D                  diag.constraints=FALSE,
##D                  model.name="TSSEM2 fixed effects model")
##D summary(fixed2)
##D 
##D ## Display the model with the parameter estimates
##D plot(fixed2, layout="spring")
##D 
##D ## Coefficients
##D coef(fixed2)
##D 
##D ## VCOV based on parametric bootstrap
##D vcov(fixed2)
##D 
##D #### Random-effects model with diagonal elements only
##D ## First stage analysis
##D random1 <- tssem1(Hunter83$data, Hunter83$n, method="REM", RE.type="Diag", 
##D                   acov="individual", model.name="TSSEM1 random effects model")
##D summary(random1)
##D 
##D ## Second stage analysis
##D ## Model without direct effect from Ability to Supervisor
##D 
##D random2 <- tssem2(random1, Amatrix=A1, Smatrix=S1, intervals.type="LB",
##D                   diag.constraints=FALSE,
##D                   mx.algebras=
##D                   list( ind=mxAlgebra(A2J*J2S+A2J*J2W*W2S+A2W*W2S, name="ind") ),
##D                   model.name="TSSEM2 random effects model")
##D summary(random2)
##D 
##D ## Display the model with the parameter estimates
##D plot(random2, layout="spring")
##D 
##D ## Load the library
##D library("semPlot")
## End(Not run)



