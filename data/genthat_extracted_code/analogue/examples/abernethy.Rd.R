library(analogue)


### Name: abernethy
### Title: Abernethy Forest Pollen Sequence
### Aliases: abernethy
### Keywords: datasets

### ** Examples

data(abernethy)
head(abernethy)

(plt <- Stratiplot(Age ~ . - Depth,
                   data = chooseTaxa(abernethy, n.occ = 5, max.abun = 10),
                   type = "poly"))



