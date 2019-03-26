library(forestHES)


### Name: widetolong
### Title: A R function for converting to wide data to long data
### Aliases: widetolong

### ** Examples

herb.spematrix<-longtowide(longdata=herbdata,left="plot.id",up="spe.id",inner="abundance")
herb.spedata<-widetolong(herb.spematrix,
                              leftlab="plot.id",uplab="spe.id",innerlab="abundance")
herb.spedata
##After removed zero in innerdata
rd0herb.spedata<-herb.spedata[-which(herb.spedata$abundance==0),]
rd0herb.spedata



