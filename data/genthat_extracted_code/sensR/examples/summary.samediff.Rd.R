library(sensR)


### Name: summary.samediff
### Title: Summary method for samediff objects.
### Aliases: summary.samediff
### Keywords: models

### ** Examples

# data: 8 of the same samples were judged to be same
#       5 of the same samples were judged to be different
#       4 of the different samples were judged to be same
#       9 of the different samples were judged to be different

sadi <- samediff(8, 5, 4, 9)
summary(sadi)
summary(sadi, FALSE)




