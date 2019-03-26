library(Rsmlx)


### Name: covariateSearch
### Title: Covariate model building
### Aliases: covariateSearch

### ** Examples

initializeMlxConnectors(software = "monolix")

# RsmlxDemo1.mlxtran is a Monolix project for modelling the pharmacokinetics (PK) of warfarin 
# using a PK model with parameters ka, V, Cl.

# In this example, three covariates (wt, age, sex) are available with the data
# covariatesearch will compute the best covariate model, in term of BIC, 
# for the three PK parameters using the three covariates. 
r1 <- covariateSearch(project="RsmlxDemo1.mlxtran")
  
# Instead of using the COSSAC method, we can use the SCM method:
r2 <- covariateSearch(project="RsmlxDemo1.mlxtran", method = 'SCM')

# Here, the covariate model is built using age and wt only, for V and Cl only:
r3 <- covariateSearch(project    = "RsmlxDemo1.mlxtran", 
                      paramToUse = c("V","Cl"), 
                      covToTest  = c("age","wt"))

# See http://rsmlx.webpopix.org/userguide/covariatesearch/ for detailed examples of covariatesearch
# Download the demo examples here: http://rsmlx.webpopix.org/Rsmlx/Rsmlx10_demos.zip



