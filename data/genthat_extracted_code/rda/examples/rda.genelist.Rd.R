library(rda)


### Name: genelist.rda
### Title: RDA Shrunken Gene List Function
### Aliases: genelist.rda

### ** Examples

data(colon)
colon.x <- t(colon.x)
genenames <- genelist.rda(colon.x, colon.y, alpha=0.1, delta=0.3)



