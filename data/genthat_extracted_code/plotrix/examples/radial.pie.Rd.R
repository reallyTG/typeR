library(plotrix)


### Name: radial.pie
### Title: Plot sectors/annuli on a circular grid of 0 to 2*pi radians
### Aliases: radial.pie
### Keywords: misc

### ** Examples

 pie1<-c(3,6,5,4,7,8,9,1,4)
 pie2<-list(0:3,1:6,2:5,1:4,0:7,4:8,2:9,0:1,0:4)
 pie3<-sample(10:60,36)
 pie4<-list(sort(sample(1:60,8)))
 for(sector in 2:36) pie4[[sector]]<-sort(sample(1:60,8))
 oldpar<-radial.pie(pie1,labels=LETTERS[1:9])
 radial.pie(pie2,labels=letters[2:10])
 radial.pie(pie3,labels=1:36)
 radial.pie(pie4,labels=1:36)
 # restore the par values
 par(oldpar)



