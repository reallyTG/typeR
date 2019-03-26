library(DesignLibrary)


### Name: mediation_analysis_designer
### Title: Create a design for mediation analysis
### Aliases: mediation_analysis_designer

### ** Examples

# Generate a mediation analysis design using default arguments:
mediation_1 <- mediation_analysis_designer()
draw_estimands(mediation_1)
## Not run: 
##D diagnose_design(mediation_1, sims = 1000)
## End(Not run)

# A design with a violation of sequential ignorability and heterogeneous effects:
mediation_2 <- mediation_analysis_designer(a = 1, rho = .5, c = 1, d = .75)
draw_estimands(mediation_2)
## Not run: 
##D diagnose_design(mediation_2, sims = 1000)
## End(Not run)




