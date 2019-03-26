library(plotrix)


### Name: labbePlot
### Title: Display a L'Abbe plot
### Aliases: labbePlot
### Keywords: misc

### ** Examples

 # first fake something like the data from a clinical trial
 didf<-data.frame(subject=1:50,interv=rep(c("therapist","ex-drinker"),each=25),
  outcome=sample(c("more","less"),50,TRUE))
 # make it into a table
 didf.tab<-table(didf$interv,didf$outcome)
 # now mix in some raw percentages just for the example
 didf2<-c(74,46,200)
 didf3<-c(33,87,500)
 x<-list(didf.tab,didf2,didf3)
 labbecol<-list("red","green","blue")
 labbePlot(x,main="Ex-drinkers vs therapists",
  xlab="Percent reduced drinking (ex-drinkers)",
  ylab="Percent reduced drinking (therapists)",
 labels=list("A","B52","X117"),col=labbecol)
 labbePlot(list(c(20,40,20)),col=list("purple"),labels=list("Z"),add=TRUE)



