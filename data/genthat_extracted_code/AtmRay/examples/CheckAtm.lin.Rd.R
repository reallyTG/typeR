library(AtmRay)


### Name: CheckAtm.lin
### Title: Check Linear Atmosphere
### Aliases: CheckAtm.lin
### Keywords: misc

### ** Examples

# quickly make a new default atmosphere
ATM = CheckAtm.lin()

# fill in missing values for an existing atmosphere
ATM = list(c0 = 343, gc = -0.006)
ATM = CheckAtm.lin(ATM)




