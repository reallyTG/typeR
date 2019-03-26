library(anim.plots)


### Name: anim.barplot
### Title: Create an animated barplot.
### Aliases: anim.barplot anim.barplot.default

### ** Examples

anim.barplot(1:100, times=rep(1:10, each=10), ylim=c(0,100))
## barplot with a matrix
ChickWeight$wq <- cut(ChickWeight$weight, 5)
tbl <- as.array(xtabs(~ wq + Diet + Time, data=ChickWeight))
ptbl <- prop.table(tbl, 2:3)
anim.barplot(ptbl, xlab="Diet", ylab="N", xlim=c(0,8), legend.text=paste(
     "Quintile", 1:5), col=1:5)
anim.barplot(tbl, xlab="Diet", ylab="N", beside=TRUE, ylim=c(0,20),
   legend.text=paste("Quintile", 1:5), col=1:5)
   



