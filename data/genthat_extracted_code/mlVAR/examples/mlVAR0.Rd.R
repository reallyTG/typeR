library(mlVAR)


### Name: mlVAR0
### Title: Multilevel VAR Estimation for Multiple Time Series
### Aliases: mlVAR0

### ** Examples

## Not run: 
##D ### Small network ###
##D nVar <- 3
##D nPerson <- 25
##D nTime <- 25
##D 
##D # Simulate model and data:
##D Model <- mlVARsim0(nPerson,nVar,nTime,sparsity = 0.5)
##D 
##D # Run mlVAR0:
##D Res <- mlVAR0(Model)
##D 
##D # Compare true fixed model with significant edges of estimated fixed model:
##D layout(t(1:2))
##D plot(Model,"fixed", title = "True model",layout="circle", edge.labels = TRUE)
##D plot(Res,"fixed", title = "Estimated model", layout = "circle", onlySig = TRUE, 
##D         alpha = 0.05, edge.labels = TRUE)
##D 
##D # Compare true and estimated individual differences in parameters:
##D layout(t(1:2))
##D plot(Model,"fixed", title = "True model",layout="circle", edge.color = "blue", 
##D         edge.labels = TRUE)
##D plot(Res,"fixed", title = "Estimated model", layout = "circle", edge.color = "blue", 
##D         edge.labels = TRUE)
##D 
##D # Compare networks of subject 1:
##D layout(t(1:2))
##D plot(Model,"subject",subject = 1, title = "True model",layout="circle", 
##D         edge.labels = TRUE)
##D plot(Res,"subject",subject = 1,title = "Estimated model", layout = "circle", 
##D         edge.labels = TRUE)
##D 
##D 
##D 
##D ### Large network ###
##D nVar <- 10
##D nPerson <- 50
##D nTime <- 50
##D 
##D # Simulate model and data:
##D Model <- mlVARsim0(nPerson,nVar,nTime, sparsity = 0.5)
##D 
##D # Run orthogonal mlVAR:
##D Res <- mlVAR0(Model, orthogonal = TRUE)
##D 
##D # Compare true fixed model with significant edges of estimated fixed model:
##D layout(t(1:2))
##D plot(Model,"fixed", title = "True model",layout="circle")
##D plot(Res,"fixed", title = "Estimated model", layout = "circle", onlySig = TRUE, 
##D         alpha = 0.05)
##D 
##D # Compare true and estimated individual differences in parameters:
##D layout(t(1:2))
##D plot(Model,"fixed", title = "True model",layout="circle", edge.color = "blue")
##D plot(Res,"fixed", title = "Estimated model", layout = "circle", edge.color = "blue")
##D 
##D # Compare networks of subject 1:
##D layout(t(1:2))
##D plot(Model,"subject",subject = 1, title = "True model",layout="circle")
##D plot(Res,"subject",subject = 1,title = "Estimated model", layout = "circle")
## End(Not run)



