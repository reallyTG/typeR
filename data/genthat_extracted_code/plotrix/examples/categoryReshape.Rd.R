library(plotrix)


### Name: categoryReshape
### Title: Convert object label/attribute label coding.
### Aliases: categoryReshape
### Keywords: misc

### ** Examples

 ns<-sample(1:8,20,TRUE)
 objects<-0
 for(i in 1:length(ns)) objects<-c(objects,rep(i,ns[i]))
 attributes<-"Z"
 for(i in 1:length(ns)) attributes<-c(attributes,sample(LETTERS[1:8],ns[i]))
 setdf<-data.frame(objects[-1],attributes[-1])
 categoryReshape(setdf)



