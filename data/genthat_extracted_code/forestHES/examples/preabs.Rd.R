library(forestHES)


### Name: preabs
### Title: A R function for converting species matrix (wide data) to
###   present-absent matrix
### Aliases: preabs

### ** Examples

herb.spematrix<-longtowide(longdata=herbdata,left="plot.id",up="spe.id",
inner="abundance")
herb.preabs<-preabs(herb.spematrix)
herb.preabs



