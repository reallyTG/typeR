library(robCompositions)


### Name: pcaCoDa
### Title: Robust principal component analysis for compositional data
### Aliases: pcaCoDa print.pcaCoDa print.pcaCoDa summary.pcaCoDa
### Keywords: multivariate

### ** Examples


data(arcticLake)

## robust estimation (default):
res.rob <- pcaCoDa(arcticLake)
res.rob
summary(res.rob)
plot(res.rob)

## classical estimation:
res.cla <- pcaCoDa(arcticLake, method="classical")
biplot(res.cla)

## just for illustration how to set the mult_comp argument:
data(expenditures)
p1 <- pcaCoDa(expenditures, mult_comp=list(c(1,2,3),c(4,5)))
p1

## example with external variables:
data(election)
# transform external variables
election$unemployment <- log((election$unemployment/100)/(1-election$unemployment/100))
election$income <- scale(election$income)

res <- pcaCoDa(election[,1:6], method="classical", external=election[,7:8])
res
biplot(res, scale=0)



