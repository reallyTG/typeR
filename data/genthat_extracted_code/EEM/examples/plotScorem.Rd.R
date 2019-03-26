library(EEM)


### Name: plotScorem
### Title: Plot score matrix for prcomp result based on group
### Aliases: plotScorem

### ** Examples

data(applejuice)
# country of apple production
country <- sapply(strsplit(names(applejuice), split = "-"), "[", 1)

applejuice_uf <- unfold(applejuice) # unfold list into matrix
result <- prcomp(applejuice_uf) 
# plot PC1 vs PC3 score based on country of production
plotScorem(result, ncomp = 4, group = country) 

# specify colours
plotScorem(result, ncomp = 4, group = country, col = c("black", "grey"))




