library(indicspecies)


### Name: indicators
### Title: Indicator analysis for species combinations
### Aliases: indicators print.indicators summary.indicators plot.indicators

### ** Examples

library(stats)

data(wetland) ## Loads species data

## Creates three clusters using kmeans
wetkm = kmeans(wetland, centers=3) 

## Determine sensitivity of individual species
B=strassoc(wetland, cluster=wetkm$cluster,func="B") 

## Select species with more than 20% of sensitivity for the first group
sel=which(B[,1]>0.2) 

## Run indicator analysis with species combinations for the first group
sc= indicators(X=wetland[,sel], cluster=wetkm$cluster, group=1, verbose=TRUE, 
               At=0.5, Bt=0.2)

#Prints the results
print(sc)

## Plots positive predictive power and sensitivity against the order of 
## combinations
plot(sc, type="A")
plot(sc, type="B")

## Run indicator analysis with species combinations for the first group, 
## but forcing 'Orysp' to be in all combinations
sc2= indicators(X=wetland[,sel], cluster=wetkm$cluster, group=1, verbose=TRUE, 
                At=0.5, Bt=0.2, enableFixed=TRUE)





