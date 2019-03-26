library(ALSM)


### Name: BestSub
### Title: Automatic Search Procedures for Model Selection; Best Subsets
###   Algorithms
### Aliases: BestSub

### ** Examples

## page 363
library("leaps")
BestSub(SurgicalUnit[,1:8],SurgicalUnit[,10],method='r2',num=2)




