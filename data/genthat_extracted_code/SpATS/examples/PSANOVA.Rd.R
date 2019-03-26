library(SpATS)


### Name: PSANOVA
### Title: Define a two-dimensional penalised tensor-product of marginal
###   B-Spline basis functions based on the P-spline ANOVA (PSANOVA)
###   approach.
### Aliases: PSANOVA

### ** Examples

library(SpATS)
data(wheatdata)
wheatdata$R <- as.factor(wheatdata$row)
wheatdata$C <- as.factor(wheatdata$col)

# Without nested basis
m0 <- SpATS(response = "yield", spatial = ~ PSANOVA(col, row, nseg = c(10,20)), 
 genotype = "geno", fixed = ~ colcode + rowcode, random = ~ R + C, data = wheatdata, 
 control =  list(tolerance = 1e-03))

summary(m0)

# With nested basis
m1 <- SpATS(response = "yield", spatial = ~ PSANOVA(col, row, nseg = c(10,20), nest.div = 2), 
genotype = "geno", fixed = ~ colcode + rowcode, random = ~ R + C, data = wheatdata, 
control =  list(tolerance = 1e-03))

summary(m1)



