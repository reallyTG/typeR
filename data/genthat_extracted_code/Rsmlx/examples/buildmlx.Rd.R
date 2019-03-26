library(Rsmlx)


### Name: buildmlx
### Title: Automatic model building
### Aliases: buildmlx

### ** Examples

initializeMlxConnectors(software = "monolix")
# RsmlxDemo1.mlxtran is a Monolix project for modelling the pharmacokinetics (PK) of warfarin 
# using a PK model with parameters ka, V, Cl.

# By default, buildmlx will compute the best statistical model in term of BIC, i.e , 
# the best covariate model, the best correlation model for the three random effects and the best 
# residual error model in terms of BIC. 
# In this example, three covariates (wt, age, sex) are available with the data and will be used 
# for building the covariate model for the three PK parameters:
r1 <- buildmlx(project="RsmlxDemo1.mlxtran")
  
# Here, the covariate model will be built for V and Cl only and log-transformation of all 
# continuous covariates will also be considered:
r2 <- buildmlx(project="RsmlxDemo1.mlxtran", paramToUse=c("V", "Cl"), covToTransform="all") 

# Only the covariate model will be  built, using AIC instead of BIC:
r3 <- buildmlx(project="RsmlxDemo1.mlxtran", model="covariate", criterion="AIC") 

# See http://rsmlx.webpopix.org/userguide/buildmlx/ for detailed examples of use of buildmlx
# Download the demo examples here: http://rsmlx.webpopix.org/Rsmlx/Rsmlx10_demos.zip



