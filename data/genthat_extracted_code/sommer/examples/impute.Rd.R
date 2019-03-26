library(sommer)


### Name: imputev
### Title: Imputing a numeric or character vector
### Aliases: imputev

### ** Examples

####=========================================####
#### generate your mickey mouse -log10(p-values)
####=========================================####
set.seed(1253)
x <- rnorm(100)
x[sample(1:100,10)] <- NA
imputev(x)



