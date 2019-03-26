library(adlift)


### Name: basisfns
### Title: basisfns
### Aliases: basisfns
### Keywords: graphs

### ** Examples

#create test signal data
#
x<-runif(100)
y<-make.signal2("blocks",x=x)
#
#perform procedure...
#
a<-basisfns(x,y,AdaptNeigh,2,TRUE,TRUE,2,FALSE,c(1,14,15),FALSE)
#
#this produces plots of three basis functions all on one graph.



