library(NetworkRiskMeasures)


### Name: impact_susceptibility
### Title: Impact Susceptibility, Fluidity and Diffusion
### Aliases: impact_susceptibility impact_susceptibility impact_fluidity
###   impact_susceptibility impact_diffusion

### ** Examples

# Creating example data
## Assets Matrix (bilateral exposures)
assets_matrix <- matrix(c(0, 10, 3, 1, 0, 2, 0, 3, 0), ncol = 3)
rownames(assets_matrix) <- colnames(assets_matrix) <- letters[1:3]

## Capital Buffer
buffer <- c(a = 2, b = 5, c = 2)

# Measures
impact_susceptibility(assets_matrix, buffer)
impact_fluidity(assets_matrix, buffer)
impact_diffusion(assets_matrix, buffer)




