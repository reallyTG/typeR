library(Causata)


### Name: MergeLevels.CausataData
### Title: Combines least-frequently occurring levels of a factor into an
###   "Other" category.
### Aliases: MergeLevels.CausataData
### Keywords: factor levels

### ** Examples

library(stringr)
df <- data.frame(
  f1__AP=factor(str_split("a a a b b b c c c d e f g h", " ")[[1]]), 
  f2__AP=factor(c(rep("x",7),rep("y",7))))
causataData <- CausataData(df, rep(0,nrow(df)))
# For the factor f1__AP, the levels d,e,f,g are merged into Other.
# f2__AP is not altered since it has only two levels.
causataData <- MergeLevels(causataData, max.levels=4) 



