library(rio)


### Name: characterize
### Title: Character conversion of labelled data
### Aliases: characterize factorize characterize.default
###   characterize.data.frame factorize.default factorize.data.frame

### ** Examples

# vector method
x <- structure(1:4, labels = c("A" = 1, "B" = 2, "C" = 3))
characterize(x)
factorize(x)

# data frame method
x <- data.frame(v1 = structure(1:4, labels = c("A" = 1, "B" = 2, "C" = 3)),
                v2 = structure(c(1,0,0,1), labels = c("foo" = 0, "bar" = 1)))
str(factorize(x))
str(characterize(x))

# comparison of exported file contents
import(export(x, "example.csv"))
import(export(factorize(x), "example.csv"))

# cleanup
unlink("example.csv")




