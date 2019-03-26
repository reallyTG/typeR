library(eeptools)


### Name: profpoly.data
### Title: Creates a data frame suitable for building custom polygon layers
###   in ggplot2 objects
### Aliases: profpoly.data
### Keywords: ggplot2 polygon

### ** Examples

grades<-c(3,4,5,6,7,8)
g<-length(grades)
LOSS<-rep(200,6)
HOSS<-rep(650,6)
basic<-c(320,350,370,390,420,440)
minimal<-basic-30
prof<-c(380,410,430,450,480,500)
adv<-c(480,510,530,550,580,600)

z<-profpoly.data(grades,LOSS,minimal,basic,
               proficient = prof,advanced = adv, HOSS)
z



