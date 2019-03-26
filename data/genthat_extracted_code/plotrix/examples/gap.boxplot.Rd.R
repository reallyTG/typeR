library(plotrix)


### Name: gap.boxplot
### Title: Display a boxplot with a gap (missing range)
### Aliases: gap.boxplot
### Keywords: misc

### ** Examples

 twovec<-list(vec1=c(rnorm(30),-6),vec2=c(sample(1:10,40,TRUE),20))
 gap.boxplot(twovec,gap=list(top=c(12,18),bottom=c(-5,-3)),
 main="Show outliers separately")
 if(dev.interactive()) par(ask=TRUE)
 gap.boxplot(twovec,gap=list(top=c(12,18),bottom=c(-5,-3)),range=0,
 main="Include outliers in whiskers")
 par(ask=FALSE)



