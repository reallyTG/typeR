library(Blaunet)


### Name: niche.summary
### Title: Summarizes information on each membership organization
### Aliases: niche.summary

### ** Examples

data(TwoCities)
b <- blau(TwoCities, node.ids = 'respID', ecology.ids = 'samp')
b <- niches(b, dev.range = rep(1.5, 10)) # 10 is the number of dimensions
niche.summary <- niche.summary(b)




