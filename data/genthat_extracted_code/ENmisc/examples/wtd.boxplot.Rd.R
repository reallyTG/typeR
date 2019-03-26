library(ENmisc)


### Name: wtd.boxplot
### Title: Box Plots with weighted cases
### Aliases: wtd.boxplot wtd.boxplot.default wtd.boxplot.formula
### Keywords: ~kwd1 hplot

### ** Examples

x<-1:10
fc<-rep(c("a","b"),each=5)
wt<-c(6:10,10:6)
wtd.boxplot(x~fc,weights=wt)



