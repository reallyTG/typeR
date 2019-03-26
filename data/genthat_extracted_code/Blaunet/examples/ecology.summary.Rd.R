library(Blaunet)


### Name: ecology.summary
### Title: Summarizes the distribution of individuals across niches.
### Aliases: ecology.summary

### ** Examples

data(TwoCities)
b <- blau(TwoCities, node.ids = 'respID', ecology.ids = 'samp')
b <- niches(b, dev.range = rep(1.5, 10)) # 10 is the number of dimensions
ecology.summary <- ecology.summary(b)




