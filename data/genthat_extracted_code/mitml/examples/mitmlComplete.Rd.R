library(mitml)


### Name: mitmlComplete
### Title: Extract imputed data sets
### Aliases: mitmlComplete

### ** Examples

data(studentratings)

fml <- ReadDis + SES ~ ReadAchiev + (1|ID)
imp <- panImpute(studentratings, formula=fml, n.burn=1000, n.iter=100, m=5)

# extract original (incomplete) data set
mitmlComplete(imp, print=0)

# extract first imputed data set (returned as mitml.list)
mitmlComplete(imp, print=1, force.list=TRUE)

# extract all imputed data sets at once
implist <- mitmlComplete(imp, print="all")

## Not run: 
##D # ... alternatives with same results
##D implist <- mitmlComplete(imp, print=1:5)
##D implist <- mitmlComplete(imp, print="list")
## End(Not run)



