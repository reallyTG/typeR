library(StratigrapheR)


### Name: as.lim
### Title: Creates / Checks / Manipulates lim objects
### Aliases: as.lim is.lim are.lim.nonunique are.lim.nonadjacent
###   are.lim.distinct are.lim.ordered order.lim

### ** Examples

example <- as.lim(l = c(0,1,2), r = c(0.5,2.1,2.5), id = "I")

is.lim(lim = example)

are.lim.nonunique(l = c(0,1,2),r = c(0.5,1.5,2.5))

are.lim.nonunique(l = c(0,1,2),r = c(0.5,1.5,2))

are.lim.nonadjacent(l = c(0,1,2),r = c(0.5,1.5,2.5))

are.lim.nonadjacent(l = c(0,1,1.5),r = c(0.5,1.5,2))

are.lim.ordered(l = c(0,1,2),r = c(0.5,1.5,2.5))

are.lim.ordered(l = c(0,1,2.5),r = c(0.5,1.5,2))

are.lim.ordered(l = c(0,1,2),r = c(0.5,1.5,2.5),dependently = TRUE)

are.lim.ordered(l = c(0,2,1),r = c(0.5,2.5,1.5),dependently = TRUE)

are.lim.distinct(l = c(0,1,2),r = c(0.5,1.5,2.5))

are.lim.distinct(l = c(0,1,2),r = c(0.5,3.5,2.5))

order.lim(l = c(0,6,4,6,50), r = c(1,5,6,9,8),
          b = c("[[", "]]", "[[", "]]", "[["))




