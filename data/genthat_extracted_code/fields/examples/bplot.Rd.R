library(fields)


### Name: bplot
### Title: boxplot
### Aliases: bplot
### Keywords: hplot

### ** Examples

#
set.seed(123)
temp<- matrix( rnorm(12*8), ncol=12)
pos<- c(1:6,9, 12:16)*100
bplot(temp)
#
par(las=2)
bplot( temp, pos=pos, names=paste( "Data",1:12, sep=""))
# add an axis along top for reference
axis(3)

#
# Xmas boxplots in pleasing red and green 
bplot( temp, pos=pos,  col=c("red4", "green4"))
# add an axis on top
axis( 3)



