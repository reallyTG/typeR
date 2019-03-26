library(catseyes)


### Name: catseyes
### Title: catseyes
### Aliases: catseyes

### ** Examples

#Show catseye plots for 4 groups with means of c(-3,2,-1,6)
#    and standard errors of c(1,2,4,3)
plot(NULL,xlim=c(.5,4.5),ylim=c(-10,10),xlab="",ylab="",main="4 Groups",xaxt="n")
axis(1,at=1:4,labels = c("Group1","Group2","Group3","Group4"))
catseyes(1:4,ymean=c(-3,2,-1,6),yse=c(1,2,4,3))
#Optionally, add points and lines (usually lines only when joining time sequence)
lines(1:4,c(-3,2,-1,6),type="b")



