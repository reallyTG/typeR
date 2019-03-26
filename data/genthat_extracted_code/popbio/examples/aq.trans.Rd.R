library(popbio)


### Name: aq.trans
### Title: Annual transition data for Aquilegia in the southwestern US
### Aliases: aq.trans
### Keywords: datasets

### ** Examples

data(aq.trans)
head(aq.trans,3)

sv<-table(aq.trans$stage, aq.trans$year)
addmargins(sv)
stage.vector.plot(sv[-1,], prop=FALSE, main="Aquilegia stage vectors")

## plot proportions with barplot
## use xpd to draw legend outside plot boundaries
op<-par(mar=c(5,4,4,1), xpd=TRUE)
x<-barplot(prop.table(sv[-1,],2), las=1,
xlab="Year", ylab="Proportion in stage class", 
col=rainbow(4), ylim=c(0,1), xaxt='n', space=.5)
yrs<-substr(colnames(sv),3,4)
axis(1,x, yrs)
legend(2.7,1.25, rev(rownames(sv)[-1]), fill=rev(rainbow(4)), bty='n', ncol=2)
par(op)





