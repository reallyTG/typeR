library(Rlab)


### Name: bplot
### Title: boxplot
### Aliases: bplot
### Keywords: hplot

### ** Examples

#
set.seed(123)
temp<- matrix( rnorm(12*8), ncol=12)
pos<- c(1:6,9:14)
bplot(temp)
#
bplot( temp, pos=pos, labels=paste( "D",1:12), horizontal=TRUE)
#
bplot( temp, pos=pos, label.cex=0, horizontal=TRUE)
# add an axis
axis( 2)



