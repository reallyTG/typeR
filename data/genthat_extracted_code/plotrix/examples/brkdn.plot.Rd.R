library(plotrix)


### Name: brkdn.plot
### Title: A point/line plotting routine
### Aliases: brkdn.plot
### Keywords: misc

### ** Examples

 test.df<-data.frame(a=rnorm(80)+4,b=rnorm(80)+4,c=rep(LETTERS[1:4],each=20),
  d=rep(rep(letters[1:4],each=4),5))
 # first use the default values
 brkdn.plot("a","c","d",test.df,pch=1:4,col=1:4)
 # now jazz it up a bit using medians and median absolute deviations
 # and some enhancements
 bp<-brkdn.plot(a~c+d,data=test.df,main="Test of the breakdown plot",
  mct="median",md="mad",xlab="Temperature range", ylab="Cognition",
  xaxlab=c("10-15","16-20","21-25","25-30"),pch=1:4,lty=1:4,col=1:4)
 es<-emptyspace(bp)
 legend(es,legend=c("Sydney","Gosford","Karuah","Brisbane"),pch=1:4,
  col=1:4,lty=1:4,xjust=0.5,yjust=0.5)



