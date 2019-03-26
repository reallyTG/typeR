library(relations)


### Name: Cetacea
### Title: Cetacea Data
### Aliases: Cetacea
### Keywords: datasets

### ** Examples

data("Cetacea")
summary(Cetacea)
## Show the cetacea types grouped by class.
split(rownames(Cetacea), Cetacea$CLASS)



