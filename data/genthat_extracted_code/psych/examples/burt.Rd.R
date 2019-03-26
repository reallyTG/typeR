library(psych)


### Name: burt
### Title: 11 emotional variables from Burt (1915)
### Aliases: burt
### Keywords: datasets

### ** Examples

data(burt)
eigen(burt)$values  #one is negative!
burt.new <- burt
burt.new[2,3] <- burt.new[3,2] <- .81
eigen(burt.new)$values  #all are positive
bs <- cor.smooth(burt)
round(burt.new - bs,3)




