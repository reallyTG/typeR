library(networkDynamic)


### Name: spells.overlap
### Title: Functions to compare and search spell intervals
### Aliases: spells.overlap spells.hit search.spell

### ** Examples

a <- c(1,3)
b <- c(2,5.5)
c <- c(-1,10)
d <- c(4,4)
spells.overlap(a,b)
spells.overlap(b,c)
spells.overlap(a,d)

spellmat <- rbind(c(0,1), c(1,2), c(2,3))
spells.hit(c(1,2),spellmat)




