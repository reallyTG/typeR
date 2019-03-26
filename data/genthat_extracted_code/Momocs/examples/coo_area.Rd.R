library(Momocs)


### Name: coo_area
### Title: Calculates the area of a shape
### Aliases: coo_area

### ** Examples

coo_area(bot[1])
# for the distribution of the area of the bottles dataset
hist(sapply(bot$coo, coo_area), breaks=10)



