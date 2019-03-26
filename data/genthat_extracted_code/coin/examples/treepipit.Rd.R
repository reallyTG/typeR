library(coin)


### Name: treepipit
### Title: Tree Pipits in Franconian Oak Forests
### Aliases: treepipit
### Keywords: datasets

### ** Examples

## Asymptotic maximally selected statistics
maxstat_test(counts ~ age + coverstorey + coverregen + meanregen +
                      coniferous + deadtree + cbpiles + ivytree,
             data = treepipit)



