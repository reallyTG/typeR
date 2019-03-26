library(gap)


### Name: comp.score
### Title: score statistics for testing genetic linkage of quantitative
###   trait
### Aliases: comp.score
### Keywords: htest

### ** Examples

## Not run: 
##D # An example based on GENEHUNTER version 2.1, with quantitative trait data in file
##D # "pheno.dat" generated from the  standard normal distribution. The following
##D # exmaple shows that it is possible to automatically call GENEHUNTER using R
##D # function "system".
##D 
##D cwd <- getwd()
##D cs.dir <- file.path(path.package("gap"),"tests/comp.score")
##D setwd(cs.dir)
##D dir()
##D # system("gh < gh.inp")
##D cs.default <- comp.score()
##D setwd(cwd)
## End(Not run)



