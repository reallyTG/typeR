library(dplyr)


### Name: location
### Title: Print the location in memory of a data frame
### Aliases: location changes
### Keywords: internal

### ** Examples

location(mtcars)

mtcars2 <- mutate(mtcars, cyl2 = cyl * 2)
location(mtcars2)

changes(mtcars, mtcars)
changes(mtcars, mtcars2)



