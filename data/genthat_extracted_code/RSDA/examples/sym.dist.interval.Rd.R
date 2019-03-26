library(RSDA)


### Name: sym.dist.interval
### Title: Distance for Symbolic Interval Variables.
### Aliases: sym.dist.interval

### ** Examples


data('table7')
ex3 <- classic.to.sym(table7, concept=c('Animal'),variables = c(Height, Weight)
,variables.types=c(Height = type.interval(), Weight = type.interval()))
sym.dist.interval(ex3,method='Gowda.Diday',normalize=FALSE)
sym.dist.interval(ex3,gamma=0.5,method='Ichino',normalize=FALSE)
sym.dist.interval(ex3,gamma=0.5,method='Minkowski',normalize=FALSE,q=1)
sym.dist.interval(ex3,gamma=0.5,method='Minkowski',normalize=FALSE,q=2)
sym.dist.interval(ex3,gamma=0.5,method='Hausdorff',normalize=FALSE,
SpanNormalize=FALSE,euclidea=TRUE)
sym.dist.interval(ex3,gamma=0.5,method='Hausdorff',normalize=FALSE,
SpanNormalize=TRUE,euclidea=TRUE)



