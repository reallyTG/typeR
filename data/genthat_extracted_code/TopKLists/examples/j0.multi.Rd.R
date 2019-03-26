library(TopKLists)


### Name: j0.multi
### Title: Function returning an overall point j0 of degeneration into
###   noise for multiple ranked lists
### Aliases: j0.multi

### ** Examples

set.seed(4657)

lists <- data.frame(L1=c("A","B","C","D","E","F","G","H","J","I","K","L","M","N"))
lists$L2 <- c("B","C","A","E","G","F","G","J","K","L","M","N","I","H")
lists$L3 <- sample(LETTERS[1:14])
res.j0.temp = j0.multi(lists, d=5, v=3)





