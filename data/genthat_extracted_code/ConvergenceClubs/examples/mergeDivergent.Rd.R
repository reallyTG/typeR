library(ConvergenceClubs)


### Name: mergeDivergent
### Title: Merge divergent units
### Aliases: mergeDivergent

### ** Examples

data("filteredGDP")

#Cluster Countries using GDP from year 1970 to year 2003
clubs <- findClubs(filteredGDP, dataCols=2:35, unit_names = 1, refCol=35,
                   time_trim = 1/3, cstar = 0, HACmethod = "FQSB")
summary(clubs)

# Merge clusters and divergent units
mclubs <- mergeClubs(clubs, mergeDivergent=TRUE)
summary(mclubs)




