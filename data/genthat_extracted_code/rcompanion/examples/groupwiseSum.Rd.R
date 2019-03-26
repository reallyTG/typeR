library(rcompanion)


### Name: groupwiseSum
### Title: Groupwise sums
### Aliases: groupwiseSum

### ** Examples

### Example with formula notation
data(AndersonBias)
groupwiseSum(Count ~ Result + Sex,
             data        = AndersonBias)
                
### Example with variable notation
data(AndersonBias)
groupwiseSum(data        = AndersonBias,
             var         = "Count",
             group       = c("Result", "Sex"))
                      



