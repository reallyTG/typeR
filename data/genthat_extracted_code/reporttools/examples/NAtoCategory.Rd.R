library(reporttools)


### Name: NAtoCategory
### Title: Change NAs in a factor into a category
### Aliases: NAtoCategory
### Keywords: manip character

### ** Examples

set.seed(1977)
fact <- factor(sample(c(round(runif(10, 1, 3)), rep(NA, 10))), levels = 1:3, 
    labels = c("no", "maybe", "yes"))
NAtoCategory(fact)



