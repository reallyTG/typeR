library(jmv)


### Name: descriptives
### Title: Descriptives
### Aliases: descriptives

### ** Examples

## Not run: 
##D data('mtcars')
##D dat <- mtcars
##D 
##D # frequency tables can be provided for factors
##D dat$gear <- as.factor(dat$gear)
##D 
##D descriptives(dat, vars = vars(mpg, cyl, disp, gear), freq = TRUE)
##D 
##D #
##D #  DESCRIPTIVES
##D #
##D #  Descriptives
##D #  -------------------------------------------
##D #               mpg     cyl     disp    gear
##D #  -------------------------------------------
##D #    N            32      32      32      32
##D #    Missing       0       0       0       0
##D #    Mean       20.1    6.19     231    3.69
##D #    Median     19.2    6.00     196    4.00
##D #    Minimum    10.4    4.00    71.1       3
##D #    Maximum    33.9    8.00     472       5
##D #  -------------------------------------------
##D #
##D #
##D #  FREQUENCIES
##D #
##D #  Frequencies of gear
##D #  --------------------
##D #    Levels    Counts
##D #  --------------------
##D #    3             15
##D #    4             12
##D #    5              5
##D #  --------------------
##D #
##D 
##D # spliting by a variable
##D descriptives(formula = disp + mpg ~ cyl, dat,
##D     median=F, min=F, max=F, n=F, missing=F)
##D 
##D # providing histograms
##D descriptives(formula = mpg ~ cyl, dat, hist=T,
##D     median=F, min=F, max=F, n=F, missing=F)
##D 
##D # splitting by multiple variables
##D descriptives(formula = mpg ~ cyl:gear, dat,
##D     median=F, min=F, max=F, missing=F)
## End(Not run)



