library(JBTools)


### Name: userCoords
### Title: Transfer relative to actual plot coordinate values
### Aliases: userCoords

### ** Examples

plot(1:10)
text.coords <- userCoords(x=c(0.1,0.5),y=c(0.9,0.5))
text(text.coords,labels=c('1st Text','2nd Text'))



