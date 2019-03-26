library(mice)


### Name: ibind
### Title: Enlarge number of imputations by combining 'mids' objects
### Aliases: ibind
### Keywords: manip

### ** Examples

data(nhanes)
imp1 <- mice(nhanes, m = 1, maxit = 2, print = FALSE)
imp1$m

imp2 <- mice(nhanes, m = 3, maxit = 3, print = FALSE)
imp2$m

imp12 <- ibind(imp1, imp2)
imp12$m
plot(imp12)



