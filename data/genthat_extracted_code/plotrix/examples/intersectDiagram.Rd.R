library(plotrix)


### Name: intersectDiagram
### Title: Display set intersections
### Aliases: intersectDiagram
### Keywords: misc

### ** Examples

 # create a matrix where each row represents an element and
 # a 1 (or TRUE) in each column indicates that the element is a member
 # of that set.
 druguse<-matrix(c(sample(c(0,1),200,TRUE,prob=c(0.15,0.85)),
  sample(c(0,1),200,TRUE,prob=c(0.35,0.65)),
  sample(c(0,1),200,TRUE,prob=c(0.5,0.5)),
  sample(c(0,1),200,TRUE,prob=c(0.9,0.1))),ncol=4)
 colnames(druguse)<-c("Alc","Tob","THC","Amp")
 druglist<-makeIntersectList(druguse,sep="\n")
 # first display it as counts
 intersectDiagram(druglist,main="Patterns of drug use",sep="\n")
 # then display only the intersections containing "Alc"
 intersectDiagram(druglist,main="Patterns of drug use (Alcohol users only)",
  sep="\n",include="alc")
 # now display only the intersections containing "Amp"
 intersectDiagram(druglist,main="Patterns of drug use (Speed users only)",
  sep="\n",include="amp")
 # then as percent with non.members, passing the initial matrix
 intersectDiagram(druguse,pct=TRUE,show.nulls=TRUE)
 # alter the data to have more multiple intersections
 druguse[which(as.logical(druguse[,1]))[1:40],2]<-1
 druguse[which(as.logical(druguse[,1]))[31:70],3]<-1
 druguse[,4]<-sample(c(0,1),200,TRUE,prob=c(0.9,0.1))
 intersectDiagram(druguse,main="Smaller font in labels",
  col=c("gray20","gray40","gray60","gray80"),cex=0.8)
 # transform the spacing - usually makes it too close, first try minspacing
 intersectDiagram(druguse,col="gray",main="Minimum spacing = 30 cases",
  minspacing=30)
 # then try cex - may need both for large differences
 intersectDiagram(druguse,main="Very boring single color",col="gray",cex=0.8)
 # create a matrix with empty intersections
 druguse<-matrix(c(sample(c(0,1),20,TRUE),
  sample(c(0,1),20,TRUE),
  sample(c(0,1),20,TRUE),
  sample(c(0,1),20,TRUE)),ncol=4)
 # show only the populated intersections
 intersectDiagram(druguse,main="Display only populated intersections")
 # show all intersections
 intersectDiagram(druguse,main="Display empty intersections",all.intersections=TRUE)



