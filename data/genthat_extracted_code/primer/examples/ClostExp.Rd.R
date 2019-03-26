library(primer)


### Name: ClostExp
### Title: Closterium Population Data
### Aliases: ClostExp
### Keywords: datasets

### ** Examples

data(ClostExp)
library(lattice)
xyplot(log10(No.per.ml) ~ Day|Nutrients, data=ClostExp, groups=rep, type='l')



