library(haplo.stats)


### Name: locus
### Title: Creates an object of class "locus"
### Aliases: locus
### Keywords: classes

### ** Examples

b1 <- c("A","A","B","C","E","D")
b2 <- c("A","A","C","E","F","G")
loc1 <- locus(b1,b2,chrom=4,locus.alias="D4S1111")

loc1

# a second example which uses more parameters, some may not be supported.
c1 <- c(101,10, 112,112,21,112)
c2 <- c(101,101,112,  100,21, 10)

gender <- rep(c("M","F"),3)
loc2 <- locus(c1,c2,chrom="X",locus.alias="DXS1234", x.linked=TRUE, sex=gender)

loc2



