library(vortexR)


### Name: SSMD_matrix
### Title: Generate a SSMD matrix with all possible pairwise comparisons
### Aliases: SSMD_matrix

### ** Examples

# Using Campbell et al. and Pacioni et al. example data.
# See ?pacioni and ?campbell for more details on example data.
require(vortexRdata)

data("pac.clas")

SSMD_matrix(data=pac.clas, project="Pacioni_et_al",
scenario="ST_Classic",
params = c("PExtinct", "Nextant", "Het", "Nalleles"),
yrs = c(60, 120), ST = FALSE, save2disk = FALSE)

data(sta.main)
ssmd_mat <- SSMD_matrix(data=sta.main, project="test",
                       scenario="test",
                       params = c("PExtant", "Nextant"),
                       yrs = c(25, 50), ST = FALSE, save2disk = FALSE)



