library(abd)


### Name: Selection
### Title: Data for Meta-analysis
### Aliases: Selection
### Keywords: datasets

### ** Examples

histogram(~ strength.of.selection, Selection,n=40)
table(Selection$species) -> s
table(s)
s[s>10] # most common species
table(Selection$traitname) -> t
table(t)
t[t>10] # most common traits



