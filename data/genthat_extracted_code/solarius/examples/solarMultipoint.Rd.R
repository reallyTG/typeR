library(solarius)


### Name: solarMultipoint
### Title: Run multipoint linkage analysis.
### Aliases: solarMultipoint

### ** Examples

### load phenotype data
data(dat30)

### load marker data
mibddir <- system.file('extdata', 'solarOutput',
  'solarMibdsCsv', package = 'solarius')
list.files(mibddir)

## Not run: 
##D ### basic (univariate) linkage model
##D mod <- solarMultipoint(trait1 ~ 1, dat30,
##D   mibddir = mibddir, chr = 5)
##D mod$lodf # table of results (LOD scores) (the highest 3.56)
##D 
##D ### basic (bivariate) linkage model
##D mod <- solarMultipoint(trait1 + trait2 ~ 1, dat30,
##D   mibddir = mibddir, chr = 5)
##D mod$lodf # table of results (LOD scores) (the highest 2.74)
##D 
##D ### two-pass linkage model
##D mod <- solarMultipoint(trait1 ~ 1, dat30,
##D   mibddir = mibddir, chr = 5,
##D   multipoint.options = "3")
##D mod$lodf # table of results (LOD scores, 1 pass) (the highest 2.74)
##D mod$lodf2 # table of results (LOD scores, 2 pass) (all nearly zero LOD scores)
##D 
## End(Not run)



