library(datadr)


### Name: divide
### Title: Divide a Distributed Data Object
### Aliases: divide

### ** Examples

# divide iris data by Species by passing in a data frame
bySpecies <- divide(iris, by = "Species")
bySpecies

# divide iris data into random partitioning of ~30 rows per subset
irisRR <- divide(iris, by = rrDiv(30))
irisRR

# any ddf can be passed into divide:
irisRR2 <- divide(bySpecies, by = rrDiv(30))
irisRR2
bySpecies2 <- divide(irisRR2, by = "Species")
bySpecies2

# splitting on multiple columns
byEdSex <- divide(adult, by = c("education", "sex"))
byEdSex
byEdSex[[1]]

# splitting on a numeric variable
bySL <- ddf(iris) %>%
  addTransform(function(x) {
    x$slCut <- cut(x$Sepal.Length, 10)
    x
  }) %>%
  divide(by = "slCut")
bySL
bySL[[1]]



