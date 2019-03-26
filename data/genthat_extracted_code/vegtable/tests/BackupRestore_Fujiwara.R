# TODO:   Backup and restore of Fujiwara data set
# 
# Author: Miguel Alvarez
################################################################################

library(vegtable2)

# Clone
setwd("M:/WorkspaceEclipse/vegtable/inst/tv_data")
vegtable2::clone("Fujiwara_2014")

# Restore
library(vegdata)

setwd("M:/WorkspaceEclipse/vegtable/inst/tv_data")
unzip(File, exdir=tv.home())
