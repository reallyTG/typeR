library(compareGroups)


### Name: missingTable
### Title: Table of missingness counts by groups.
### Aliases: missingTable
### Keywords: utilities

### ** Examples



require(compareGroups)

# load regicor data
data(regicor)

# table of descriptives by recruitment year
res <- compareGroups(year ~ age + sex + smoker + sbp + histhtn + 
         chol + txchol + bmi + phyact + pcs + death, regicor)
restab <- createTable(res, hide.no = "no")

# missingness table
missingTable(restab,type=1)


## Not run: 
##D 
##D # also create the missing table from a compareGroups object
##D miss <- missingTable(res)
##D miss
##D 
##D # some methods that works for createTable objects also works for objects 
##D #   computed by missTable function.
##D miss[1:4]
##D varinfo(miss)
##D plot(miss)
##D 
##D #... but update methods cannot be applied (this returns an error).
##D update(miss,type=2) 
##D 
## End(Not run)





