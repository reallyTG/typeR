library(caroline)


### Name: textplot
### Title: A Text-Only Plot
### Aliases: textplot
### Keywords: manip

### ** Examples


layout(rbind(c(1,1,1),c(2,3,4), c(5, 6,7)),
       widths=c(5, 10,10) , heights=c(5, 10,10))
textplot('title', cex=2)
textplot('row 1', srt=90, cex=2)
plot(1,2)
hist(c(1,2,34,4,3,2,2))
textplot('row 2', srt=90, cex=2)
pie(c(1,23,3,1,1,2,3,4,54,5))
plot(c(1,2,4,4,23,2), c(1,2,4,3,2,2))




