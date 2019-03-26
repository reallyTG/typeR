library(plotrix)


### Name: gap.barplot
### Title: Display a barplot with a gap (missing range) on one axis
### Aliases: gap.barplot
### Keywords: misc

### ** Examples

 twogrp<-c(rnorm(10)+4,rnorm(10)+20)
 gap.barplot(twogrp,gap=c(8,16),xlab="Index",ytics=c(3,6,17,20),
  ylab="Group values",main="Barplot with gap")
 gap.barplot(twogrp,gap=c(8,16),xlab="Index",ytics=c(3,6,17,20),
  ylab="Group values",horiz=TRUE,main="Horizontal barplot with gap")



