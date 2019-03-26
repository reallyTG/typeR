library(partykit)


### Name: partynode
### Title: Inner and Terminal Nodes
### Aliases: partynode kidids_node fitted_node id_node split_node
###   surrogates_node kids_node info_node formatinfo_node
### Keywords: tree

### ** Examples

data("iris", package = "datasets")

## a stump defined by a binary split in Sepal.Length
stump <- partynode(id = 1L, 
    split = partysplit(which(names(iris) == "Sepal.Length"),
	breaks = 5),
    kids = lapply(2:3, partynode))

## textual representation
print(stump, data = iris)  

## list element number and node id of the two terminal nodes
table(kidids_node(stump, iris), 
    fitted_node(stump, data = iris))

## assign terminal nodes with probability 0.5
## to observations with missing `Sepal.Length'
iris_NA <- iris
iris_NA[sample(1:nrow(iris), 50), "Sepal.Length"] <- NA
table(fitted_node(stump, data = iris_NA, 
    obs = !complete.cases(iris_NA)))

## a stump defined by a primary split in `Sepal.Length'
## and a surrogate split in `Sepal.Width' which
## determines terminal nodes for observations with
## missing `Sepal.Length'
stump <- partynode(id = 1L, 
    split = partysplit(which(names(iris) == "Sepal.Length"),
	breaks = 5),
    kids = lapply(2:3, partynode),
    surrogates = list(partysplit(
	which(names(iris) == "Sepal.Width"), breaks = 3)))
f <- fitted_node(stump, data = iris_NA, 
    obs = !complete.cases(iris_NA))
tapply(iris_NA$Sepal.Width[!complete.cases(iris_NA)], f, range)




