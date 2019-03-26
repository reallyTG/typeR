library(ProfessR)


### Name: fix.names
### Title: Fix Down Loaded Names
### Aliases: fix.names
### Keywords: misc

### ** Examples


####  examples with embedded quotes are not available
####    because they interfere with R documentation

LAM = "SILENCED LAMB"
fix.names(LAM, lower=TRUE)

LAM = "Silence my Lamb"
fix.names(LAM, upper=TRUE)

LAM = "SILeNCED LAMB"
fix.names(LAM)

###   try with single quote
LAM = "O'brian LAMB"
fix.names(LAM)





