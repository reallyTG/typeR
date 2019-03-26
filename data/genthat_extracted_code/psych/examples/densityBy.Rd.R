library(psych)


### Name: densityBy
### Title: Create a 'violin plot' or density plot of the distribution of a
###   set of variables
### Aliases: densityBy violinBy
### Keywords: multivariate hplot

### ** Examples

violinBy(bfi[1:5])
violinBy(bfi,var=1:5,grp ="gender",grp.name=c("M","F"))
densityBy(sat.act,"SATV","gender")
  



