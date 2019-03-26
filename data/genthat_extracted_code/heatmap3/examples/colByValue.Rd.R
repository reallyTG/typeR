library(heatmap3)


### Name: colByValue
### Title: colByValue
### Aliases: colByValue

### ** Examples

temp<-rnorm(1000)
col<-colByValue(temp,col=colorRampPalette(c('chartreuse4','white','firebrick'))(1024),range=c(-2,2))
col<-colByValue(temp,col=colorRampPalette(c('chartreuse4',
'white','firebrick'))(5),breaks=c(-5,-1,-0.1,0.1,1,5),cex.axis=0.8)



