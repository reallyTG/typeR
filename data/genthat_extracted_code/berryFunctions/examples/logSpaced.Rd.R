library(berryFunctions)


### Name: logSpaced
### Title: Logarithmically spaced points
### Aliases: logSpaced
### Keywords: arith

### ** Examples


logSpaced()
logSpaced(base=c(1.1, 1.5, 2), n=6, min=5, max=10)
d <- logSpaced(seq(0.8, 1.2, 0.025), main="logarithmically spaced points")

# the default base for the default n (20) will give an approximately equal
# bin width across the range on a logarithmic scale:
d <- logSpaced()
plot(d, rep(1,20), log="x")

# For exactly spacing logarithmically, use
plot(10^seq(from=log10(1), to=log10(100), len=100), log="y")
browseURL("https://stackoverflow.com/a/29963530")




