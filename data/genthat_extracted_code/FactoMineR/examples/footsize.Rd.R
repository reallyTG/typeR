library(FactoMineR)


### Name: footsize
### Title: footsize
### Aliases: footsize
### Keywords: datasets

### ** Examples


data(footsize)
res3 <- AovSum (footsize ~ size + sex + size :sex, data=footsize)
res3



