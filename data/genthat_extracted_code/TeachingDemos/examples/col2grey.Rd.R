library(TeachingDemos)


### Name: col2grey
### Title: Convert colors to grey/grayscale
### Aliases: col2grey col2gray
### Keywords: dplot color

### ** Examples

par(mfcol=c(2,2))
tmp <- 1:3
names(tmp) <- c('red','green','blue')

barplot( tmp, col=c('red','green','blue') )
barplot( tmp, col=col2gray( c('red','green','blue') ) )

barplot( tmp, col=c('red','#008100','#3636ff') )
barplot( tmp, col=col2grey( c('red','#008100','#3636ff') ) )



