library(sidier)


### Name: colour.scheme
### Title: internal function for node colour scheme
### Aliases: colour.scheme

### ** Examples

colour.scheme(def=c("blue","red"),N=4)
Colors<-colour.scheme(def=c("blue","red"),N=4,colors=c("black","gray33","gray66","orange","red"))
plot(c(1:4),col=Colors,pch=16)

#Given 10 individuals classified into three groups,
#this will provide the colour for each individual:
group<-c(1,1,1,2,2,2,1,2,3,3) # defining groups
colour.scheme(N=length(unique(group)))[group]




