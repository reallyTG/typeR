library(metaSEM)


### Name: Becker09
### Title: Ten Studies of Correlation Matrices used by Becker (2009)
### Aliases: Becker09
### Keywords: datasets

### ** Examples

## Not run: 
##D data(Becker09)
##D 
##D #### Fixed-effects model
##D ## First stage analysis
##D fixed1 <- tssem1(Becker09$data, Becker09$n, method="FEM")
##D summary(fixed1)
##D 
##D ## Prepare a regression model using create.mxMatrix()
##D A1 <- create.mxMatrix(c(0, "0.1*Cog2Per", "0.1*SO2Per", "0.1*SC2Per",
##D                         0, 0, 0, 0,
##D                         0, 0, 0, 0,
##D                         0, "0.1*Cog2SC", "0.1*SO2SC",0),
##D                       type="Full", byrow=TRUE, ncol=4, nrow=4,
##D                       as.mxMatrix=FALSE)
##D 
##D ## This step is not necessary but it is useful for inspecting the model.
##D dimnames(A1)[[1]] <- dimnames(A1)[[2]] <- c("Performance", "Cognitive",
##D                                             "Somatic", "Self_confidence")
##D 
##D ## Display A1
##D A1
##D 
##D S1 <- create.mxMatrix(c("0.1*var_Per",
##D                         0, 1,
##D                         0, "0.1*cor", 1,
##D                         0, 0, 0, "0.1*var_SC"), byrow=TRUE, type="Symm",
##D                       as.mxMatrix=FALSE)
##D 
##D ## This step is not necessary but it is useful for inspecting the model.
##D dimnames(S1)[[1]] <- dimnames(S1)[[2]] <- c("Performance", "Cognitive",
##D                                             "Somatic", "Self_confidence")
##D 
##D ## Display S1
##D S1
##D 
##D ################################################################################
##D ## Alternative model specification in lavaan model syntax
##D model <- "## Regression paths
##D           Performance ~ Cog2Per*Cognitive + SO2Per*Somatic + SC2Per*Self_confidence
##D           Self_confidence ~ Cog2SC*Cognitive + SO2SC*Somatic
##D           ## Fix the variances of Cog and SO at 1
##D           Cognitive ~~ 1*Cognitive
##D           Somatic ~~ 1*Somatic
##D           ## Label the correlation between Cog and SO
##D           Cognitive ~~ cor*Somatic
##D           ## Label the error variances of Per and SC
##D           Performance ~~ var_Per*Performance
##D           Self_confidence ~~ var_SC*Self_confidence"
##D 
##D ## Display the model
##D plot(model, layout="spring")
##D 
##D RAM <- lavaan2RAM(model, obs.variables=c("Performance", "Cognitive",
##D                                          "Somatic", "Self_confidence"))
##D RAM
##D 
##D A1 <- RAM$A
##D S1 <- RAM$S
##D ################################################################################
##D 
##D ## Second stage analysis
##D fixed2 <- tssem2(fixed1, Amatrix=A1, Smatrix=S1, diag.constraints=TRUE,
##D                  intervals.type="LB", model.name="TSSEM2 Becker09",
##D                  mx.algebras=list( Cog=mxAlgebra(Cog2SC*SC2Per, name="Cog"),
##D                                    SO=mxAlgebra(SO2SC*SC2Per, name="SO"),
##D                                    Cog_SO=mxAlgebra(Cog2SC*SC2Per+SO2SC*SC2Per,
##D                                    name="Cog_SO")) )
##D summary(fixed2)
##D 
##D ## Display the model with the parameter estimates
##D plot(fixed2, layout="spring")
##D 
##D #### Fixed-effects model: with type of sport as cluster
##D ## First stage analysis
##D cluster1 <- tssem1(Becker09$data, Becker09$n, method="FEM",
##D                    cluster=Becker09$Type_of_sport)
##D summary(cluster1)
##D 
##D ## Second stage analysis
##D cluster2 <- tssem2(cluster1, Amatrix=A1, Smatrix=S1, diag.constraints=TRUE,
##D                  intervals.type="LB", model.name="TSSEM2 Becker09",
##D                  mx.algebras=list( Cog=mxAlgebra(Cog2SC*SC2Per, name="Cog"),
##D                                    SO=mxAlgebra(SO2SC*SC2Per, name="SO"),
##D                                    Cog_SO=mxAlgebra(Cog2SC*SC2Per+SO2SC*SC2Per,
##D                                    name="Cog_SO")) )
##D summary(cluster2)
##D 
##D ## Convert the model to semPlotModel object with 2 plots
##D ## Use the short forms of the variable names
##D my.plots <- lapply(X=cluster2, FUN=meta2semPlot, manNames=c("Per","Cog","SO","SC") )
##D 
##D ## Load the library
##D library("semPlot")
##D 
##D ## Setup two plots
##D layout(t(1:2))
##D ## The labels are overlapped. We may modify it by using layout="spring"
##D semPaths(my.plots[[1]], whatLabels="est", nCharNodes=10, color="orange",
##D          layout="spring", edge.label.cex=0.8)
##D title("Individual sport")
##D semPaths(my.plots[[2]], whatLabels="est", nCharNodes=10, color="skyblue",
##D          layout="spring", edge.label.cex=0.8)
##D title("Team sport")
##D 
##D 
##D #### Random-effects model
##D ## First stage analysis
##D random1 <- tssem1(Becker09$data, Becker09$n, method="REM", RE.type="Diag")
##D summary(random1)
##D 
##D ## Second stage analysis
##D random2 <- tssem2(random1, Amatrix=A1, Smatrix=S1, diag.constraints=TRUE,
##D                   intervals.type="LB", model.name="TSSEM2 Becker09",
##D                   mx.algebras=list( Cog=mxAlgebra(Cog2SC*SC2Per, name="Cog"),
##D                                     SO=mxAlgebra(SO2SC*SC2Per, name="SO"),
##D                                     Cog_SO=mxAlgebra(Cog2SC*SC2Per+SO2SC*SC2Per,
##D                                     name="Cog_SO")) )
##D summary(random2)
##D 
##D ## Display the model
##D plot(random2, what="path", layout="spring")
##D 
##D ## Display the model with the parameter estimates
##D plot(random2, layout="spring", color="yellow")
##D 
##D #### Univariate r approach
##D #### First stage of the analysis
##D uni1 <- uniR1(Becker09$data, Becker09$n)
##D uni1
##D 
##D #### Second stage of analysis using OpenMx
##D model2 <- "## Regression paths
##D            Performance ~ Cog2Per*Cognitive + SO2Per*Somatic + SC2Per*Self_confidence
##D            Self_confidence ~ Cog2SC*Cognitive + SO2SC*Somatic
##D            ## Provide starting values for Cog and SO
##D            Cognitive ~~ start(1)*Cognitive
##D            Somatic ~~ start(1)*Somatic
##D            ## Label the correlation between Cog and SO
##D            Cognitive ~~ cor*Somatic
##D            ## Label the error variances of Per and SC
##D            Performance ~~ var_Per*Performance
##D            Self_confidence ~~ var_SC*Self_confidence"
##D 
##D RAM2 <- lavaan2RAM(model2, obs.variables=c("Performance", "Cognitive",
##D                                            "Somatic", "Self_confidence"))
##D RAM2
##D 
##D uni2mx <- uniR2mx(uni1, Amatrix=RAM2$A, Smatrix=RAM2$S)
##D summary(uni2mx)
##D 
##D #### Second stage of analysis Using lavaan
##D model3 <- "## Regression paths
##D            Performance ~ Cognitive + Somatic + Self_confidence
##D            Self_confidence ~ Cognitive + Somatic"
##D 
##D uni2lavaan <- uniR2lavaan(uni1, model3)
##D lavaan::summary(uni2lavaan)
## End(Not run)



