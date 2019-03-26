library(Blaunet)


### Name: active
### Title: Quick summary of blau object.
### Aliases: active

### ** Examples

data(TwoCities)
b <- blau(TwoCities, node.ids = 'respID', ecology.ids = 'samp')
b <- niches(b, dev.range = rep(1.5, 10)) # 10 is the number of dimensions
active(b) #will produce command line output




