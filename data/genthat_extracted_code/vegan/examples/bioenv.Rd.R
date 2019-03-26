library(vegan)


### Name: bioenv
### Title: Best Subset of Environmental Variables with Maximum (Rank)
###   Correlation with Community Dissimilarities
### Aliases: bioenv bioenv.default bioenv.formula summary.bioenv bioenvdist
### Keywords: multivariate

### ** Examples

# The method is very slow for large number of possible subsets.
# Therefore only 6 variables in this example.
data(varespec)
data(varechem)
sol <- bioenv(wisconsin(varespec) ~ log(N) + P + K + Ca + pH + Al, varechem)
sol
summary(sol)



