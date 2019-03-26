library(hydrostats)


### Name: low.spell.lengths
### Title: Calculate the length of all low flow spells
### Aliases: low.spell.lengths

### ** Examples

data(Cooper)
Cooper<-ts.format(Cooper)

low.spell.lengths(Cooper, threshold=50000)




