library(paramlink)


### Name: linkres
### Title: S3 methods for class 'linkres'.
### Aliases: linkres print.linkres summary.linkres as.data.frame.linkres
###   peakSummary plot.linkres

### ** Examples


x = linkdat(toyped, model=1)
lods = lod(x, theta='max')
summary(lods)
as.data.frame(lods)




