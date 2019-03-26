library(mitml)


### Name: sort.mitml.list
### Title: Sort a list of imputed data sets
### Aliases: sort.mitml.list
### Keywords: methods

### ** Examples

data(studentratings)

fml <- ReadDis + SES ~ ReadAchiev + (1|ID)
imp <- panImpute(studentratings, formula=fml, n.burn=1000, n.iter=100, m=5)

implist <- mitmlComplete(imp,"all")

# * Example 1: sort by ID
sort(implist, by=ID)

# * Example 2: sort by combination of variables
sort(implist, by=list(FedState,ID,-SES))



