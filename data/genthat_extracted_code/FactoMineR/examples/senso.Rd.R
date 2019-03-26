library(FactoMineR)


### Name: senso
### Title: senso
### Aliases: senso
### Keywords: datasets

### ** Examples

## Example of 2-way analysis of variance
data(senso)
res <- AovSum (Score~ Product + Day, data=senso)
res

## Example of 2-way analysis of variance with interaction
data(senso)
res2 <- AovSum (Score~ Product + Day + Product : Day, data=senso)
res2




