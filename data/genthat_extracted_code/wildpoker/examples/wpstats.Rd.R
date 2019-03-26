library(wildpoker)


### Name: wpstats
### Title: Deal Many Hands of a Wild Poker Variant Game
### Aliases: wpstats

### ** Examples

# example of the wpstats run to generate raw statistics
rawstat <- wpstats("Iron Cross Last Wild", 6, "Deuces", numdeal = 10, raw = TRUE)
head(rawstat)

# example of wpstats run to generate a gstat object, used by wpgraphs
wpstats("Seven Stud Hi-Lo", 4, numdeal = 10, seed = 100)





