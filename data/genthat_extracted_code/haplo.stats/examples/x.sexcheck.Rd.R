library(haplo.stats)


### Name: x.sexcheck
### Title: consistency checks for x.linked locus
### Aliases: x.sexcheck

### ** Examples

c1 <- c(101,10, 112,112,21,112)
c2 <- c(101,101,112,100,21, 10)

gender <- rep(c("M","F"),3)
loc2 <- locus(c1,c2,chrom="X",locus.alias="DXS1234", x.linked=TRUE, sex=gender)

loc2



