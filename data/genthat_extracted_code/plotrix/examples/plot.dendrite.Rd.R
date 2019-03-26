library(plotrix)


### Name: plot.dendrite
### Title: Plot a dendrogram of a dendrite object
### Aliases: plot.dendrite
### Keywords: misc

### ** Examples

 sex<-sample(c("M","F"),100,TRUE)
 hair<-c(sample(c("Blond","Black","Brown","Red"),90,TRUE),rep(NA,10))
 eye<-sample(c("Blue","Black","Brown","Green"),100,TRUE)
 charac<-data.frame(sex=sex,hair=hair,eye=eye)
 characlist<-makeDendrite(charac)
 shecol<-c(Black="black",Blond="yellow",Blue="blue",Brown="brown",
  F="pink",Green="green",M="lightblue","NA"="gray",Red="orange")
 plot.dendrite(characlist,names(charac),main="Test dendrogram",
  col=shecol)



