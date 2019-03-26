library(dae)


### Name: fac.recode
### Title: Recodes factor 'levels' using values in a vector. The values in
###   the vector do not have to be unique.
### Aliases: fac.recode
### Keywords: factor manip

### ** Examples

## set up a factor with labels
a <- factor(rep(1:4, 4), labels=c("A","B","C","D"))
 
## recode "A" and "D" to 1 and "B" and "C" to 2
b <- fac.recode(a, c(1,2,2,1), labels = c("a","b"))



