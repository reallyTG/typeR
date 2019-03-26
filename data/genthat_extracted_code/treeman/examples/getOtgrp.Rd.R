library(treeman)


### Name: getOtgrp
### Title: Get outgroup
### Aliases: getOtgrp

### ** Examples

library(treeman)
data(mammals)
# orangutan is an outgroup wrt humans and chimps
getOtgrp(mammals, ids=c('Homo_sapiens', 'Pan_troglodytes', 'Pongo_pygmaeus'))



