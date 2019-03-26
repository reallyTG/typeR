library(metaSEM)


### Name: Digman97
### Title: Factor Correlation Matrices of Big Five Model from Digman (1997)
### Aliases: Digman97
### Keywords: datasets

### ** Examples

## Not run: 
##D Digman97
##D 
##D ##### Fixed-effects TSSEM
##D fixed1 <- tssem1(Digman97$data, Digman97$n, method="FEM")
##D summary(fixed1)
##D 
##D ## Factor covariance among latent factors
##D Phi <- matrix(c(1,"0.3*cor","0.3*cor",1), ncol=2, nrow=2)
##D 
##D ## Error covariance matrix
##D Psi <- Diag(c("0.2*e1","0.2*e2","0.2*e3","0.2*e4","0.2*e5"))
##D 
##D ## S matrix
##D S1 <- bdiagMat(list(Psi, Phi))
##D 
##D ## This step is not necessary but it is useful for inspecting the model.
##D dimnames(S1)[[1]] <- dimnames(S1)[[2]] <- c("A","C","ES","E","I","Alpha","Beta")
##D 
##D ## Display S1
##D S1
##D 
##D ## A matrix
##D Lambda <-
##D matrix(c(".3*Alpha_A",".3*Alpha_C",".3*Alpha_ES",rep(0,5),".3*Beta_E",".3*Beta_I"),
##D        ncol=2, nrow=5)
##D A1 <- rbind( cbind(matrix(0,ncol=5,nrow=5), Lambda),
##D              matrix(0, ncol=7, nrow=2) )
##D 
##D ## This step is not necessary but it is useful for inspecting the model.
##D dimnames(A1)[[1]] <- dimnames(A1)[[2]] <- c("A","C","ES","E","I","Alpha","Beta")
##D 
##D ## Display A1
##D A1
##D 
##D ## F matrix to select the observed variables
##D F1 <- create.Fmatrix(c(1,1,1,1,1,0,0), as.mxMatrix=FALSE)
##D 
##D ## Display F1
##D F1
##D 
##D ################################################################################
##D ## Alternative model specification in lavaan model syntax
##D model <- "## Factor loadings
##D           Alpha=~A+C+ES
##D           Beta=~E+I
##D           ## Factor correlation
##D           Alpha~~Beta"
##D 
##D ## Display the model
##D plot(model)
##D 
##D RAM <- lavaan2RAM(model, obs.variables=c("A","C","ES","E","I"),
##D                   A.notation="on", S.notation="with")
##D RAM
##D 
##D A1 <- RAM$A
##D S1 <- RAM$S
##D F1 <- RAM$F
##D 
##D ################################################################################
##D fixed2 <- tssem2(fixed1, Amatrix=A1, Smatrix=S1, Fmatrix=F1,
##D                  model.name="TSSEM2 Digman97")
##D summary(fixed2)
##D 
##D ## Display the model with the parameter estimates
##D plot(fixed2)
##D 
##D #### Fixed-effects TSSEM with several clusters
##D #### Create a variable for different samples
##D #### Younger participants: Children and Adolescents
##D #### Older participants: others
##D cluster <- ifelse(Digman97$cluster %in% c("Children","Adolescents"),
##D                   yes="Younger participants", no="Older participants")
##D 
##D #### Show the cluster
##D cluster
##D 
##D ## Example of Fixed-effects TSSEM with several clusters
##D fixed1.cluster <- tssem1(Digman97$data, Digman97$n, method="FEM",
##D                          cluster=cluster)
##D summary(fixed1.cluster)
##D 
##D fixed2.cluster <- tssem2(fixed1.cluster, Amatrix=A1, Smatrix=S1, Fmatrix=F1)
##D #### Please note that the estimates for the younger participants are problematic.
##D summary(fixed2.cluster)
##D 
##D ## Setup two plots
##D layout(t(1:2))
##D 
##D ## Plot the first group
##D plot(fixed2.cluster[[1]])
##D title("Younger participants")
##D 
##D ## Plot the second group
##D plot(fixed2.cluster[[2]])
##D title("Older participants")
##D 
##D #### Random-effects TSSEM with random effects on the diagonals
##D random1 <- tssem1(Digman97$data, Digman97$n, method="REM",
##D                   RE.type="Diag")
##D summary(random1)
##D 
##D random2 <- tssem2(random1, Amatrix=A1, Smatrix=S1, Fmatrix=F1)
##D summary(random2)
##D 
##D ## Display the model with the parameter estimates
##D plot(random2, color="green")
## End(Not run)



