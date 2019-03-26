library(pixiedust)


### Name: sprinkle_colnames
### Title: Column Names for 'dust' Tables
### Aliases: sprinkle_colnames sprinkle_colnames.default
###   sprinkle_colnames.dust_list

### ** Examples

x <- dust(lm(mpg ~ qsec + factor(am), data = mtcars)) 
x
x %>% sprinkle_colnames(term = "Term", statistic = "T")
x %>% sprinkle_colnames("Term", "Estimate", "SE", "T-statistic", "p-value")
## Not run: 
##D # Causes an error due to too few unnamed arguments
##D x %>% sprinkle_colnames("Term", "Estimate")
## End(Not run)



