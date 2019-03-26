library(forestSAS)


### Name: differ
### Title: A forest spatial structure index characterizing differation
###   degree of tree attributies.
### Aliases: differ

### ** Examples

##S1,S2,S3,S4,S5,represent 5 different forest stoeries
storey1<-c("S1","S1","S1","S1","S1")
storey2<-c("S1","S1","S1","S1","S2")
storey3<-c("S1","S1","S1","S3","S2")
storey4<-c("S1","S1","S4","S3","S2")
storey5<-c("S1","S5","S4","S3","S2")

differ1<-differ(storey1)
differ1
differ2<-differ(storey2)
differ2
differ3<-differ(storey3)
differ3
differ4<-differ(storey4)
differ4
differ5<-differ(storey5)
differ5



