library(httk)


### Name: parameterize_1comp
### Title: Parameterize_1comp
### Aliases: parameterize_1comp
### Keywords: Parameter

### ** Examples

 parameters <- parameterize_1comp(chem.name='Bisphenol-A',species='Rat')
 parameters <- parameterize_1comp(chem.cas='80-05-7',restrictive.clearance=FALSE,
                                  species='rabbit',default.to.human=TRUE)
 out <- solve_1comp(parameters=parameters)



