library(plotrix)


### Name: taylor.diagram
### Title: Taylor diagram
### Aliases: taylor.diagram
### Keywords: misc

### ** Examples

 # fake some reference data
 ref<-rnorm(30,sd=2)
 # add a little noise
 model1<-ref+rnorm(30)/2
 # add more noise
 model2<-ref+rnorm(30)
 # display the diagram with the better model
 oldpar<-taylor.diagram(ref,model1)
 # now add the worse model
 taylor.diagram(ref,model2,add=TRUE,col="blue")
 # get approximate legend position
 lpos<-1.5*sd(ref)
 # add a legend
 legend(lpos,lpos,legend=c("Better","Worse"),pch=19,col=c("red","blue"))
 # now restore par values
 par(oldpar)
 # show the "all correlation" display
 taylor.diagram(ref,model1,pos.cor=FALSE)
 taylor.diagram(ref,model2,add=TRUE,col="blue")



