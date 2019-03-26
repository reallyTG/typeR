# TODO:   These steps should be carried out before building package
# 
# Author: Miguel Alvarez
################################################################################

library(devtools)
library(rmarkdown)

setwd("M:/WorkspaceR/vegtable")

# 1: Render README
render(input="README.Rmd")

# 2: Building vignettes
## build_vignettes()
unlink("inst/doc")
