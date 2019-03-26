library(hydrostats)


### Name: high.spell.lengths
### Title: Calculate the length of all high flow spells
### Aliases: high.spell.lengths

### ** Examples

data(Cooper)
Cooper<-ts.format(Cooper)

high.spell.lengths(Cooper, threshold=50000)




