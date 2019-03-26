library(crank)


### Name: cats2ranks
### Title: Ordered option selections to ranks
### Aliases: cats2ranks
### Keywords: misc

### ** Examples

 # first a standard 1:m numerically coded selection
 opchoice<-matrix(NA,nrow=40,ncol=5)
 for(i in 1:40) opchoice[i,]<-sample(1:10,5)
 opchoice
 cats2ranks(opchoice)
 # now a messy character choice with missing values
 opchoice<-matrix(NA,nrow=40,ncol=5)
 tencolors<-c("red","green","blue","yellow","magenta","cyan",
  "purple","orange","brown","pink")
 for(i in 1:40) {
  nchoices<-sample(3:5,1)
  opchoice[i,1:nchoices]<-sample(tencolors,nchoices)
 }
 opchoice
 cats2ranks(opchoice)



