library(ompr.roi)


### Name: with_ROI
### Title: Configures a solver based on 'ROI'
### Aliases: with_ROI

### ** Examples

library(magrittr)
library(ompr)
library(ROI)
library(ROI.plugin.glpk)
add_variable(MIPModel(), x, type = "continuous") %>%
 set_objective(x, sense = "max") %>%
 add_constraint(x <= 5) %>%
 solve_model(with_ROI(solver = "glpk", verbose = TRUE))




