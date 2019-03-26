library(BIOdry)


### Name: cClass
### Title: Column-class extraction.
### Aliases: cClass

### ** Examples

##Multilevel data frame of tree-ring widths:
data(Prings05,envir = environment())
## Names of variables in Prings05 data containing numeric classes:
cClass(Prings05, 'numeric') # 'x'
## Names of variables containing time units: 
cClass(Prings05, 'integer') # 'year'
## Names of variables containing factors: 
cClass(Prings05, 'factor') # 'sample', 'tree', 'plot'




