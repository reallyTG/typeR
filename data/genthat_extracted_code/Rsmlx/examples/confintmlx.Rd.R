library(Rsmlx)


### Name: confintmlx
### Title: Confidence intervals for population parameters
### Aliases: confintmlx

### ** Examples

initializeMlxConnectors(software = "monolix")

# RsmlxDemo2.mlxtran is a Monolix project for modelling the PK of warfarin using a PK model 
# with parameters ka, V, Cl.

# confintmlx will compute a 90% confidence interval for all the population parameters 
# using the population estimates obtained by Monolix and the Fisher Information Matrix 
# estimated by linearization
r1 <- confintmlx(project="RsmlxDemo2.mlxtran") 

# 95% confidence intervals are now computed, using the FIM estimated by Monolix using a 
# stochastic approximation algorithm:
r2 <- confintmlx(project="RsmlxDemo2.mlxtran", linearization=FALSE, level=0.95) 

# Confidence intervals are computed for ka_pop and omega_ka only, 
# using the profile likelihood method:
r <- confintmlx(project    = "RsmlxDemo2.mlxtran", 
                method     = "proflike", 
                parameters = c("ka_pop","omega_ka")) 

# Confidence intervals are computed using 200 bootstrap samples:
r3 <- confintmlx(project="RsmlxDemo2.mlxtran", method="bootstrap", nboot=200)

# See http://rsmlx.webpopix.org/userguide/confintmlx/ for detailed examples of use of confintmlx
# Download the demo examples here: http://rsmlx.webpopix.org/Rsmlx/Rsmlx10_demos.zip



