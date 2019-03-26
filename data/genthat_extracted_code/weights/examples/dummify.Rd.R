library(weights)


### Name: dummify
### Title: Separate a factor into separate dummy variables for each level.
### Aliases: dummify
### Keywords: ~dummy ~split

### ** Examples

data("anes04")

anes04$agecats <- cut(anes04$age, c(17, 25,35,45,55,65, 99))
levels(anes04$agecats) <- c("age1824", "age2534", "age3544",
          "age4554", "age5564", "age6599")

agedums <- dummify(anes04$agecats)
table(anes04$agecats)
summary(agedums)



