library(mokken)


### Name: aisp
### Title: Automated Item Selection Procedure (AISP) for Mokken Scale
###   Analysis
### Aliases: aisp search.normal search.extended search.ga search
### Keywords: aisp scalability coefficients

### ** Examples

data(acl)

# Select the scale Communality consisting of 10 items.
Communality <- acl[,1:10]

# Partition these 10 items into mokken scales using Mokken's automated item selection procedure.
scale <- aisp(Communality)
coefH(Communality[,scale==1])

# Same but using items 1 and 2 in the startset.
scale <- aisp(Communality, StartSet = c(1, 2), verbose = TRUE)
coefH(Communality[,scale==1])

# Partition these 10 items into mokken scales using a genetic algorithm.
scale <- aisp(Communality,"ga",maxgens=1000)
coefH(Communality[,scale==1])




