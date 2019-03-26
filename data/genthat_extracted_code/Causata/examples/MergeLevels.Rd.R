library(Causata)


### Name: MergeLevels
### Title: Combines least-frequently occurring levels of a factor into an
###   "Other" category.
### Aliases: MergeLevels MergeLevels.factor
### Keywords: factor levels

### ** Examples

library(stringr)
f <- factor(str_split("a a a b b b c c c d e f g h", " ")[[1]])
# d,e,f,g,h are merged into Other
MergeLevels(f, max.levels=4) 



