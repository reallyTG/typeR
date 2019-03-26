library(LSD)


### Name: LSD.pie
### Title: Custom-built piechart version
### Aliases: LSD.pie
### Keywords: pie

### ** Examples

emptyplot(xlim=c(1,9),ylim=c(1,9))
mtext(paste("LSD.pie: piecharts"),3,2,cex=1.25)
polygon(c(4,2,4,7,8),c(4,8,4,2,8))
LSD.pie(sample(1:50,5),4,4,add=TRUE,radius=2,colpal="prgn",alpha=75)
LSD.pie(sample(1:50,5),2,8,add=TRUE,colpal="prgn",alpha=75)
LSD.pie(sample(1:50,5),8,8,add=TRUE,colpal="prgn",alpha=75)
LSD.pie(sample(1:50,5),7,2,add=TRUE,colpal="prgn",alpha=75)



