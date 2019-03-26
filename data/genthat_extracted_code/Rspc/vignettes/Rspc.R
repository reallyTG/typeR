## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----instalation, eval=FALSE---------------------------------------------
#  path = "path_to_the_archive/Rspc_x.x.x.tar.gz" # set the path to the archive
#  install.packages(path, repos = NULL, type="source") # install package

## ------------------------------------------------------------------------
#load the package
library(Rspc)
# generate some data
data <- rnorm(10) 
# evaluate all the Nelson rules, 
# calculate control limits from data (lcl, cl, ucl are not provided) using formulas for i-chart, 
# don't modify any rule parameters (parRules = NULL)
EvaluateRules(x = data, type = 'i', whichRules = 1:8, lcl = NA, cl = NA, ucl = NA)

## ------------------------------------------------------------------------
pars = SetParameters()
print(pars)

## ------------------------------------------------------------------------
pars$Rule3$nPoints = 5

## ------------------------------------------------------------------------
CalculateLimits(x = rnorm(10), lcl = NA, cl = 100, ucl = NA, type = 'i')

## ------------------------------------------------------------------------
limits = CalculateLimits(x = rnorm(10), lcl = NA, cl = NA, ucl = NA, type = 'i')
CalculateZoneBorders(limits, controlLimitDistance = 3)

