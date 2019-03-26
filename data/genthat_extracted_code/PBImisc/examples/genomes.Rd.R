library(PBImisc)


### Name: genomes
### Title: 724 bacterial genomes data
### Aliases: genomes
### Keywords: genomes

### ** Examples

data(genomes)
library(ggplot2)
# is this relation linear ?
qplot(size,GC, data=genomes) + theme_bw()
# or linear in log scales?
qplot(size,GC, data=genomes, log="xy") + theme_bw()



