library(plotrix)


### Name: makeIntersectList
### Title: Count set intersections
### Aliases: makeIntersectList
### Keywords: misc

### ** Examples

 # create a matrix where each row represents an element and
 # a 1 (or TRUE) in each column indicates that the element is a member
 # of that set.
 setdf<-data.frame(A=sample(c(0,1),100,TRUE,prob=c(0.7,0.3)),
  B=sample(c(0,1),100,TRUE,prob=c(0.7,0.3)),
  C=sample(c(0,1),100,TRUE,prob=c(0.7,0.3)),
  D=sample(c(0,1),100,TRUE,prob=c(0.7,0.3)))
 makeIntersectList(setdf)
 ns<-sample(1:8,20,TRUE)
 objects<-0
 for(i in 1:length(ns)) objects<-c(objects,rep(i,ns[i]))
 attributes<-"Z"
 for(i in 1:length(ns)) attributes<-c(attributes,sample(LETTERS[1:8],ns[i]))
 setdf2<-data.frame(objects[-1],attributes[-1])
 makeIntersectList(setdf2)



