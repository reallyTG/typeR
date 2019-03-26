library(seriation)


### Name: Townships
### Title: Bertin's Characteristics of Townships
### Aliases: Townships
### Keywords: datasets

### ** Examples

data("Townships")

## original data
pimage(Townships)
criterion(Townships)


## seriated data
order <- seriate(Townships, method = "BEA", control = list(rep = 5))
pimage(Townships, order)
criterion(Townships, order)




