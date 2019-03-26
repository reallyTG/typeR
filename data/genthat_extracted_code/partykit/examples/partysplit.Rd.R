library(partykit)


### Name: partysplit
### Title: Binary and Multiway Splits
### Aliases: partysplit kidids_split character_split varid_split
###   breaks_split index_split right_split prob_split info_split
### Keywords: tree

### ** Examples

data("iris", package = "datasets")

## binary split in numeric variable `Sepal.Length'
sl5 <- partysplit(which(names(iris) == "Sepal.Length"),
    breaks = 5)
character_split(sl5, data = iris)
table(kidids_split(sl5, data = iris), iris$Sepal.Length <= 5)

## multiway split in numeric variable `Sepal.Width', 
## higher values go to the first kid, smallest values 
## to the last kid
sw23 <- partysplit(which(names(iris) == "Sepal.Width"),    
    breaks = c(3, 3.5), index = 3:1)	
character_split(sw23, data = iris)    
table(kidids_split(sw23, data = iris), 
    cut(iris$Sepal.Width, breaks = c(-Inf, 2, 3, Inf)))   

## binary split in factor `Species'
sp <- partysplit(which(names(iris) == "Species"),
    index = c(1L, 1L, 2L))
character_split(sp, data = iris)
table(kidids_split(sp, data = iris), iris$Species)

## multiway split in factor `Species'
sp <- partysplit(which(names(iris) == "Species"), index = 1:3)
character_split(sp, data = iris)
table(kidids_split(sp, data = iris), iris$Species)

## multiway split in numeric variable `Sepal.Width'
sp <- partysplit(which(names(iris) == "Sepal.Width"), 
    breaks = quantile(iris$Sepal.Width))
character_split(sp, data = iris)




