library(Blaunet)


### Name: niches
### Title: Locate individuals in organizational niches in Blau space
### Aliases: niches

### ** Examples

data(TwoCities)
b <- blau(TwoCities, node.ids = 'respID', ecology.ids = 'samp')
#compute niches
b0 <- niches(b, dev.range = rep(1.5, 10)) # 10 is the number of dimensions
#change std. dev used for calculating niches
b1 <- niches(b, dev.range = rep(1.0, 10)) # 10 is the number of dimensions
#treat everyone as members of one ecology
b2 <- niches(b, dev.range = rep(1.0, 10), ecologies.off = TRUE) # 10 is the number of dimensions




