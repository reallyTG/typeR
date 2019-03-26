library(pls)


### Name: pls.options
### Title: Set or return options for the pls package
### Aliases: pls.options
### Keywords: regression multivariate

### ** Examples

## Return current options:
pls.options()
pls.options("plsralg")
pls.options(c("plsralg", "pcralg"))

## Set options:
pls.options(plsralg = "simpls", mvralg = "simpls")
pls.options(list(plsralg = "simpls", mvralg = "simpls")) # Equivalent
pls.options()

## Restore `factory settings':
rm(.pls.Options)
pls.options()



