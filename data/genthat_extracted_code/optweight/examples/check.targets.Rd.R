library(optweight)


### Name: check.targets
### Title: Construct and Check Targets Input
### Aliases: check.targets print.optweight.targets

### ** Examples

library("cobalt")
data("lalonde", package = "cobalt")

#Checking if the correct number of entries are included:
check.targets(treat ~ age + race + married +
                nodegree + re74,
                data = lalonde,
                targets = c(25, .4, .1, .5, .3,
                            .5, 4000))
#Notice race is split into three values (.4, .1, and .5)




