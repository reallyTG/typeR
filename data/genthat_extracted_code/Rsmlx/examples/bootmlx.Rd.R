library(Rsmlx)


### Name: bootmlx
### Title: Bootstrapping - case resampling
### Aliases: bootmlx

### ** Examples

initializeMlxConnectors(software = "monolix")

# RsmlxDemo1.mlxtran is a Monolix project for modelling the PK of warfarin using a PK model 
# with parameters ka, V, Cl.

# In this example, bootmlx will generate 100 random replicates of the original data and will
# use Monolix to estimate the population parameters from each of these 100 replicates:
r1 <- bootmlx(project="RsmlxDemo1.mlxtran")
  
# 5 replicates will now be generated, with 50 individuals in each replicate:
r2 <- bootmlx(project="RsmlxDemo1.mlxtran",  nboot = 5, settings = list(N = 50))

# Proportions of males and females in the original dataset will be preserved   
# in each replicate:
r3 <- bootmlx(project="RsmlxDemo1.mlxtran",  settings = list(covStrat = "sex"))

# See http://rsmlx.webpopix.org/userguide/bootmlx/ for detailed examples of use of bootmlx
# Download the demo examples here: http://rsmlx.webpopix.org/Rsmlx/Rsmlx10_demos.zip



