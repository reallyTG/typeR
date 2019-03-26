library(optweight)


### Name: check.tols
### Title: Construct and Check Tolerance Input
### Aliases: check.tols print.optweight.tols

### ** Examples

library("cobalt")
data("lalonde", package = "cobalt")

#Checking if the correct number of entries are included:
check.tols(treat ~ age + educ + married +
                nodegree + re74, data = lalonde,
                tols = c(.01, .02, .03, .04))

#Checking the order of interactions; notice they go
#at the end even if specified at the beginning. The
#.09 values are where the interactions might be expected
#to be, but they are in fact not.
c <- check.tols(treat ~ age:educ + married*race +
                nodegree + re74, data = lalonde,
                tols = c(.09, .01, .01, .09, .01, .01))

print(c, internal = TRUE)




