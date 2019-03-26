library(qdapTools)


### Name: mtabulate
### Title: Tabulate Frequency Counts for Multiple Vectors
### Aliases: mtabulate
### Keywords: frequency tabulate

### ** Examples

mtabulate(list(w=letters[1:10], x=letters[1:5], z=letters))
mtabulate(list(mtcars$cyl[1:10]))

## Dummy coding
mtabulate(mtcars$cyl[1:10])
mtabulate(CO2[, "Plant"])

dat <- data.frame(matrix(sample(c("A", "B"), 30, TRUE), ncol=3))
mtabulate(dat)
t(mtabulate(dat))
counts2list(mtabulate(dat))



