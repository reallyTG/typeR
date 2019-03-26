library(PCovR)


### Name: pcovr
### Title: Full Principal covariates regression analysis of a specific data
###   set
### Aliases: pcovr.default pcovr plot.pcovr print.pcovr summary.pcovr
### Keywords: regression

### ** Examples

data(alexithymia)
results <- pcovr(alexithymia$X, alexithymia$Y)
summary(results)
plot(results)



