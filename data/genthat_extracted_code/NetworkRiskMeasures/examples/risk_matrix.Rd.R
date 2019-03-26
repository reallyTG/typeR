library(NetworkRiskMeasures)


### Name: risk_matrix
### Title: Computes the (binary) impact or vulnerability matrices
### Aliases: risk_matrix risk_matrix vulnerability_matrix risk_matrix
###   impact_matrix

### ** Examples

# Creating example data
## Assets Matrix (bilateral exposures)
assets_matrix <- matrix(c(0, 10, 3, 1, 0, 2, 0, 3, 0), ncol = 3)
rownames(assets_matrix) <- colnames(assets_matrix) <- letters[1:3]

## Capital Buffer
buffer <- c(a = 2, b = 5, c = 2)

# Vulnerability matrices
vulnerability_matrix(assets_matrix, buffer, binary = FALSE)
vulnerability_matrix(assets_matrix, buffer, binary = TRUE)



