library(DescTools)


### Name: ColToGrey
### Title: Convert Colors to Grey/Grayscale
### Aliases: ColToGrey ColToGray
### Keywords: color

### ** Examples

par(mfcol=c(2,2))
tmp <- 1:3
names(tmp) <- c('red','green','blue')

barplot(tmp, col=c('red','green','blue'))
barplot(tmp, col=ColToGrey(c('red','green','blue')))

barplot(tmp, col=c('red','#008100','#3636ff'))
barplot(tmp, col=ColToGrey(c('red','#008100','#3636ff')))



