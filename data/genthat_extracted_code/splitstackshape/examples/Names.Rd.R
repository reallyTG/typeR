library(splitstackshape)


### Name: Names
### Title: Dataset Names as a Character Vector, Always
### Aliases: Names

### ** Examples


mydf <- data.frame(a = 1:2, b = 3:4, c = 5:6)
splitstackshape:::Names(mydf, c("a", "c"))
splitstackshape:::Names(mydf, c(1, 3))




