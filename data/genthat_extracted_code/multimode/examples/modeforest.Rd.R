library(multimode)


### Name: modeforest
### Title: Mode forest
### Aliases: modeforest
### Keywords: graphical tools

### ** Examples

#Mode forest using a grid of bandwidths between 0.2 and 0.5 and 29 bootstrap replicas
set.seed(2016)
data=rnorm(50)
modeforest(data,bws=c(0.2,0.5),B=29)
#Original mode tree for this sample
modetree(data,bws=c(0.2,0.5),addplot=TRUE,col.lines="red")



