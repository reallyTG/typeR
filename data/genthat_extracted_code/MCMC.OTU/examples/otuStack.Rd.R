library(MCMC.OTU)


### Name: otuStack
### Title: Prepares OTU counts data for MCMC model fitting using
###   mcmc.otu().
### Aliases: otuStack

### ** Examples


# Symbiodinium sp diversity in two coral species at two reefs (banks)
data(green.data)
green.data

# stacking the data table
gs=otuStack(green.data,count.columns=c(4:8),condition.columns=c(1:3))
head(gs,30)




