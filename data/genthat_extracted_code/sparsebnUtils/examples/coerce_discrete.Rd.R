library(sparsebnUtils)


### Name: coerce_discrete
### Title: Recode discrete data
### Aliases: coerce_discrete coerce_discrete.factor coerce_discrete.numeric
###   coerce_discrete.integer coerce_discrete.character
###   coerce_discrete.data.frame coerce_discrete.sparsebnData

### ** Examples

x <- 1:5
coerce_discrete(x) # output: 0 1 2 3 4

x <- c("high", "normal", "high", "low")
coerce_discrete(x) # output: 0 2 0 1




