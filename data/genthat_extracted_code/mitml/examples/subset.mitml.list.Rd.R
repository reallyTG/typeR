library(mitml)


### Name: subset.mitml.list
### Title: Subset a list of imputed data sets
### Aliases: subset.mitml.list
### Keywords: methods

### ** Examples

data(studentratings)

fml <- ReadDis + SES ~ ReadAchiev + (1|ID)
imp <- panImpute(studentratings, formula=fml, n.burn=1000, n.iter=100, m=5)

implist <- mitmlComplete(imp,"all")

# * Example 1: subset by SES, select variables by name
subset(implist, SES < 25, select = c(ID, FedState, Sex, SES, ReadAchiev, ReadDis))

# * Example 2: subset by FedState, select variables by column number
subset(implist, FedState == "SH", select = -c(6:7,9:10))

## Not run: 
##D # * Example 3: subset by ID and Sex
##D subset(implist, ID ##D 
##D 
##D # * Example 4: select variables by name range
##D subset(implist, select = ID:Sex)
## End(Not run)



