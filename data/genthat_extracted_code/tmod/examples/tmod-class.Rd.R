library(tmod)


### Name: makeTmod
### Title: S4 class for tmod
### Aliases: makeTmod tmod-class

### ** Examples

# A minimal example
m <- data.frame(ID=letters[1:3], Title=LETTERS[1:3])
m2g <- list(a=c("g1", "g2"), b=c("g3", "g4"), c=c("g1", "g2", "g4"))
mymset <- makeTmod(modules=m, modules2genes=m2g)



