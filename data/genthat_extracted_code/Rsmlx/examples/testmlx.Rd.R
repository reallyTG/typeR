library(Rsmlx)


### Name: testmlx
### Title: Statistical tests for model assessment
### Aliases: testmlx

### ** Examples

initializeMlxConnectors(software = "monolix")

# RsmlxDemo2.mlxtran is a Monolix project for modelling the PK of warfarin using a PK model 
# with parameters ka, V, Cl.

#testmlx will perform statistical tests for the different component of the statistical model:
r1 <- testmlx(project="RsmlxDemo2.mlxtran")

#testmlx will perform statistical tests for the covariate model and the correlation model only.
r2 <- testmlx(project="RsmlxDemo2.mlxtran", tests=c("covariate","correlation"))

# See http://rsmlx.webpopix.org/userguide/testmlx/ for detailed examples of use of testmlx
# Download the demo examples here: http://rsmlx.webpopix.org/Rsmlx/Rsmlx10_demos.zip



