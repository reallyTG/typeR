library(adehabitatHS)


### Name: enfa
### Title: Ecological Niche Factor Analysis
### Aliases: enfa hist.enfa print.enfa
### Keywords: multivariate

### ** Examples


data(lynxjura)

map <- lynxjura$map

## We keep only "wild" indices.
locs <- lynxjura$locs
locs <- locs[slot(locs, "data")[,2]!="D",]

hist(map, type = "l")
## The variable artif is far from symetric

## We perform a square root transformation
## of this variable
## We therefore normalize the variable 'artif'
slot(map,"data")[,4] <- sqrt(slot(map,"data")[,4])
hist(map, type = "l")

## We prepare the data for the ENFA
tab <- slot(map, "data")
pr <- slot(count.points(locs, map), "data")[,1]


## We then perform the PCA before the ENFA
pc <- dudi.pca(tab, scannf = FALSE)

## The object 'pc' contains the transformed table (i.e.
## centered so that all columns have a mean of 0
## and scaled so that all columns have a variance of 1
## 'pc' also contains the weights of the habitat variables,
## and the weights of the pixels in the analysis

(enfa1 <- enfa(pc, pr,
               scannf = FALSE))
hist(enfa1)
hist(enfa1, scores = FALSE, type = "l")


## scatterplot
scatter(enfa1)


## randomization test
## Not run: 
##D (renfa <- randtest(enfa1))
##D plot(renfa)
## End(Not run)




