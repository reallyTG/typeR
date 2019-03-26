library(metaSEM)


### Name: Becker94
### Title: Five Studies of Ten Correlation Matrices reported by Becker and
###   Schram (1994)
### Aliases: Becker94
### Keywords: datasets

### ** Examples

## Not run: 
##D data(Becker94)
##D 
##D #### Fixed-effects model
##D ## First stage analysis
##D fixed1 <- tssem1(Becker94$data, Becker94$n, method="FEM")
##D summary(fixed1)
##D 
##D ## Prepare a regression model using create.mxMatrix()
##D A1 <- create.mxMatrix(c(0,0,0,"0.2*Spatial2Math",
##D                         0,0,"0.2*Verbal2Math",0,0), type="Full",
##D                       ncol=3, nrow=3, name="A1")
##D S1 <- create.mxMatrix(c("0.2*ErrorVarMath",0,0,1,
##D                         "0.2*CorBetweenSpatialVerbal",1),
##D                       type="Symm", name="S1")
##D 
##D ## An alternative method to create a regression model with the lavaan syntax
##D model <- "## Regression model
##D           SAT_Math ~ Spatial2Math*Spatial + Verbal2Math*SAT_Verbal
##D           ## Error variance of SAT_Math
##D           SAT_Math ~~ ErrorVarMath*SAT_Math
##D           ## Variances of Spatial and SAT_Verbal fixed at 1.0
##D           Spatial ~~ 1*Spatial
##D           SAT_Verbal ~~ 1*SAT_Verbal
##D           ## Correlation between Spatial and SAT_Verbal
##D           Spatial ~~ CorBetweenSpatialVerbal*SAT_Verbal"
##D 
##D ## Display the model
##D plot(model)
##D 
##D RAM <- lavaan2RAM(model,
##D                   obs.variables=c("SAT_Math", "Spatial", "SAT_Verbal"))
##D RAM
##D 
##D A1 <- RAM$A
##D S1 <- RAM$S
##D 
##D ## Second stage analysis
##D fixed2 <- tssem2(fixed1, Amatrix=A1, Smatrix=S1, intervals.type="LB")
##D summary(fixed2)
##D 
##D ## Display the model with the parameter estimates
##D plot(fixed2)
##D     
##D #### Fixed-effects model: with gender as cluster
##D ## First stage analysis
##D cluster1 <- tssem1(Becker94$data, Becker94$n, method="FEM", cluster=Becker94$gender)
##D summary(cluster1)
##D 
##D ## Second stage analysis  
##D cluster2 <- tssem2(cluster1, Amatrix=A1, Smatrix=S1, intervals.type="LB")
##D summary(cluster2)
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
##D gls2 <- tssem2(gls1, Amatrix=A1, Smatrix=S1, intervals.type="LB",
##D                model.name="Fixed effects GLS Stage 2")
##D summary(gls2)
## End(Not run)



