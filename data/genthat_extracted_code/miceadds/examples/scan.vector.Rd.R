library(miceadds)


### Name: scan.vec
### Title: R Utilities: Scan a Character Vector
### Aliases: scan.vec scan.vector scan0
### Keywords: R utilities

### ** Examples

#############################################################################
# EXAMPLE 1: Example scan.vec | reading a string
#############################################################################


vars <- miceadds::scan.vector( "female urbgrad \n  groesse  \t  Nausg    grpgroesse   privat  ")
vars
  ## [1] "female"     "urbgrad"    "groesse"    "Nausg"      "grpgroesse"
  ## [6] "privat"

## the next lines are only commented out to fulfill CRAN checks
## vars2 <- miceadds::scan0()
##     female urbgrad  groesse  Nausg    grpgroesse   privat



