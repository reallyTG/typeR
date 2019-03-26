library(Sleuth2)


### Name: case1701
### Title: Magnetic Force on Printer Rods
### Aliases: case1701
### Keywords: datasets

### ** Examples

str(case1701)

pca <- princomp(case1701[,1:11])
summary(pca)
# The first 3 principal components account for 99.7% of the variation
screeplot(pca)
# The loadings suggest the following meaningful summaries...
loadings(pca)

overallaverage <- with(case1701, (L1 + L2 + L3 + L4 + L5 + L6 + L7 + L8 + L9 + L10 + L11)/11)
rightleftdiff <- with(case1701, (L9 + L10 + L11)/3 - (L1 + L2 + L3)/3)
middleleftdiff <- with(case1701, L6 - (L1 + L2)/2)

# Note 4 clusters and 1 outlier
pairs(cbind(overallaverage, rightleftdiff, middleleftdiff)) 

fit1 <- lm(overallaverage ~ Current*Configur*Material, case1701)
anova(fit1)



