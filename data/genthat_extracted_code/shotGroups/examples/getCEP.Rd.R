library(shotGroups)


### Name: getCEP
### Title: Circular Error Probable (CEP) and Spherical Error Probable (SEP)
### Aliases: getCEP getCEP.data.frame getCEP.default

### ** Examples

# coordinates given by a suitable data frame
(cep <- getCEP(DFtalon, CEPlevel=0.5, accuracy=FALSE,
               dstTarget=10, conversion='m2mm',
               type=c('CorrNormal', 'GrubbsPatnaik', 'Rayleigh')))

# plot points, centers, and circles indicating 50%-CEP estimates
plot(point.y ~ point.x, data=DFtalon, asp=1, pch=16)
drawCircle(cep$ctr, cep$CEP$CEP0.5['unit', 'CorrNormal'],    fg='red')
drawCircle(cep$ctr, cep$CEP$CEP0.5['unit', 'GrubbsPatnaik'], fg='green3')
drawCircle(cep$ctr, cep$CEP$CEP0.5['unit', 'Rayleigh'],      fg='blue')
points(cep$ctr[1], cep$ctr[2], pch=4, col='gray50', cex=2, lwd=2)
legend(x='bottomleft',
       legend=c('Grubbs 50', 'Corr Normal 50', 'Rayleigh 50', 'center'),
       col=c('red', 'green3', 'blue', 'gray50'), lwd=2,
       lty=c(1, 1, 1, NA), pch=c(NA, NA, NA, 4), bg='white')

# calculate actual coverage percentage of 50% CEP estimates
dists <- getDistToCtr(DFtalon)           # distances to center

# extract CEP radius for all estimates
CEPr <- cep$CEP$CEP0.5['unit', ]

# percentage of points in circle with radius = CEP
100 * sapply(CEPr, function(x) sum(dists <= x)) / length(dists)

# coordinates given by a matrix
## Not run: 
##D xy <- matrix(round(rnorm(100, 0, 5), 2), ncol=2)
##D getCEP(xy, accuracy=FALSE, dstTarget=25, conversion='m2cm',
##D        type=c('Grubbs', 'CorrNormal', 'Rayleigh'))
## End(Not run)



