library(Momocs)


### Name: col_transp
### Title: Transparency helpers and palettes
### Aliases: col_transp col_alpha

### ** Examples

x <- col_transp(10, col='#000000')
x
barplot(1:10, col=x, main='a transparent black is grey')

summer10 <- col_summer(10)
summer10
summer10.transp8 <- col_alpha(summer10, 0.8)
summer10.transp8
summer10.transp2 <- col_alpha(summer10, 0.8)
summer10.transp2
x <- 1:10
barplot(x, col=summer10.transp8)
barplot(x/2, col=summer10.transp2, add=TRUE)



