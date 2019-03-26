library(bclust)


### Name: teethplot
### Title: produces teeth plot useful for demonstating a grouping on
###   clustered subjects
### Aliases: teethplot

### ** Examples

data(gaelle)
gaelle.id<-rep(1:14,c(3,rep(4,13))) 
# first 3 rows replication of ColWT, 4 for the rest

gaelle.lab<-c("ColWT","d172","d263","isa2","sex4","dpe2","mex1",
"sex3","pgm","sex1","WsWT","tpt","RLDWT","ke103")
gaelle.bclust<-bclust(gaelle,rep.id=gaelle.id,labels=gaelle.lab,
transformed.par=c(-1.84,-0.99,1.63,0.08,-0.16,-1.68),var.select=TRUE)
#start plotting
layout(matrix(c(1,2),1,2,byrow=TRUE), c(9,1),10, respect=TRUE) 
# divide plot space into two unequal parts
par(mar=c(0,0,0,2)) 
# preserve some space for labels in dendrogram plot
plot(as.dendrogram(gaelle.bclust),
horiz=TRUE,yaxs="i") #plot the dendrogram
abline(v=gaelle.bclust$cut) 
#show the optimal allocation by a line on the dendrogram
par(mar=c(0,0,0,0)) # we need no space for teeth plot
teethplot(gaelle.bclust) #show the optimal allocation using teeth plot



