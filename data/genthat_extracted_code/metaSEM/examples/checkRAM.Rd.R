library(metaSEM)


### Name: checkRAM
### Title: Check the correctness of the RAM formulation
### Aliases: checkRAM
### Keywords: utilities

### ** Examples

## Not run: 
##D  
##D ## Digman97 example
##D model1 <- "## Factor loadings
##D            Alpha=~A+C+ES
##D            Beta=~E+I
##D            ## Factor correlation
##D            Alpha~~Beta"
##D 
##D RAM1 <- lavaan2RAM(model1, obs.variables=c("A","C","ES","E","I"),
##D                    A.notation="on", S.notation="with")
##D RAM1
##D 
##D ## The model is okay.    
##D checkRAM(Amatrix=RAM1$A, Smatrix=RAM1$S)
##D 
##D ## Hunter83 example    
##D model2 <- "## Regression paths
##D            Job_knowledge ~ A2J*Ability
##D            Work_sample ~ A2W*Ability + J2W*Job_knowledge
##D            Supervisor ~ J2S*Job_knowledge + W2S*Work_sample
##D 
##D            ## Fix the variance of Ability at 1
##D            Ability ~~ 1*Ability
##D 
##D            ## Label the error variances of the dependent variables
##D            Job_knowledge ~~ VarE_J*Job_knowledge
##D            Work_sample ~~ VarE_W*Work_sample
##D            Supervisor ~~ VarE_S*Supervisor"
##D 
##D RAM2 <- lavaan2RAM(model2, obs.variables=c("Ability","Job_knowledge",
##D                    "Work_sample","Supervisor"))
##D 
##D ## The model is okay.     
##D checkRAM(Amatrix=RAM2$A, Smatrix=RAM2$S)   
## End(Not run)



