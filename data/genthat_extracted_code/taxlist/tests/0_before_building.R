# TODO:   These steps should be carried out before building package
# 
# Author: Miguel Alvarez
################################################################################

library(devtools)
library(rmarkdown)

setwd("M:/WorkspaceR/taxlist")

# 1: Render README
render(input="README.Rmd")

# 2: Building vignettes (only for display)
## build_vignettes()
unlink("inst/doc")
