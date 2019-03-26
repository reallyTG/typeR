library(httk)


### Name: parameterize_3comp
### Title: Parameterize_3comp
### Aliases: parameterize_3comp
### Keywords: Parameter

### ** Examples

 parameters <- parameterize_3comp(chem.name='Bisphenol-A',species='Rat')
 parameters <- parameterize_3comp(chem.cas='80-05-7',
                                  species='rabbit',default.to.human=TRUE)
 out <- solve_3comp(parameters=parameters,plots=TRUE)



