library(mitml)


### Name: mids2mitml.list
### Title: Convert objects of class 'mids' to 'mitml.list'
### Aliases: mids2mitml.list

### ** Examples

data(studentratings)

# imputation using mice
require(mice)
imp <- mice(studentratings)

implist <- mids2mitml.list(imp)



