library(forestSAS)


### Name: crowding
### Title: A forest spatial structure index characterizing crowding degree.
### Aliases: crowding

### ** Examples

overlap1<-c(-0.5,-0.4,-0.3,-0.2) ##negative means no overlap
overlap2<-c(-0.5,-0.4,-0.3,0.2)  ##positive means overlap
overlap3<-c(-0.5,-0.4,0.3,0.2)
overlap4<-c(-0.5,0.4,0.3,0.2)
overlap5<-c(0.5,0.4,0.3,0.2)

crowding1<-crowding(overlap1)
crowding1
crowding2<-crowding(overlap2)
crowding2
crowding3<-crowding(overlap3)
crowding3
crowding4<-crowding(overlap4)
crowding4
crowding5<-crowding(overlap5)
crowding5



