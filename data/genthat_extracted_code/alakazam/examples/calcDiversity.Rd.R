library(alakazam)


### Name: calcDiversity
### Title: Calculate the diversity index
### Aliases: calcDiversity

### ** Examples

# May define p as clonal member counts
p <- c(1, 1, 3, 10)
q <- c(0, 1, 2)
calcDiversity(p, q)

# Or proportional abundance
p <- c(1/15, 1/15, 1/5, 2/3)
calcDiversity(p, q)




