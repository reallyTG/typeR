library(RmixmodCombi)


### Name: MixmodCombi-class
### Title: ['MixmodCombi'] class
### Aliases: MixmodCombi-class

### ** Examples

set.seed(1)

data(Baudry_etal_2010_JCGS_examples)

res <- mixmodCombi(ex4.1, nbCluster = 1:8)

res # is of class MixmodCombi

getSlots("MixmodCombi")



