library(vcrpart)


### Name: olmm-summary
### Title: Printing and summarizing 'olmm' objects
### Aliases: olmm-summary summary.olmm print.summary.olmm print.olmm
### Keywords: methods

### ** Examples

## ------------------------------------------------------------------- #
## Dummy example:
##
## Printing the summary of a model on artificially generated data.
## ------------------------------------------------------------------- #

data(vcrpart_1)

model <- olmm(y ~ wave + z4:treat + re(1|id), vcrpart_1, subset = 1:60)

print(model, digits = 2)

summary(model, digits = 2)



