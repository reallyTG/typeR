library(Ac3net)


### Name: Ac3net.cutoff
### Title: Calculates a quick cutoff value from an adjacency matrix
### Aliases: Ac3net.cutoff
### Keywords: misc

### ** Examples

 data(expdata)
 mim <- cor(t(expdata), method = 'pearson')
 cutoff <- Ac3net.cutoff(mim=mim, ratio_ = 0.002,
              PCmincutoff=0.6, PCmaxcutoff=0.96)



