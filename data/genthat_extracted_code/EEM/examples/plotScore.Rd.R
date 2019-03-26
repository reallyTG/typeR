library(EEM)


### Name: plotScore
### Title: Plot score for prcomp result
### Aliases: plotScore

### ** Examples

data(applejuice)
applejuice_uf <- unfold(applejuice) # unfold list into matrix
result <- prcomp(applejuice_uf) 
plotScore(result) # plot PC1 vs PC2 score
plotScore(result, pch = 3, col = "blue") # change shape and color

# get country of apple production
country <- sapply(strsplit(names(applejuice), split = "-"), "[", 1) 
plotScore(result, label = country) # add label

# or plot by group
plotScore(result, xPC = 1, yPC = 3, group = country) 

# custom point types and color
plotScore(result, xPC = 1, yPC = 3, group = country, pch = c(1,2), col = c("green", "black"))

# move legend outside
plotScore(result, xPC = 1, yPC = 3, group = country, legendoutside = TRUE)

# two groups
cultivar <- sapply(strsplit(names(applejuice), split = "-"), "[", 2) 
plotScore(result, group = country, group2 = cultivar)

# make the points more transparent
## Not run: 
##D require(scales)
##D plotScore(result, group = country, group2 = country, col = alpha(generateColor(2), 0.7))
## End(Not run)




