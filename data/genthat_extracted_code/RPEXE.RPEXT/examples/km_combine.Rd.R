library(RPEXE.RPEXT)


### Name: km_combine
### Title: Comparing two Kaplan Meier curves in one plot
### Aliases: km_combine

### ** Examples

t1 <- c(2,3,4,5.5,7,10,12,15)
c1 <- c(0,0,1,0,0,1,0,0)
t2 <- c(1,3,5,4,8,10,9,11)
c2 <- c(0,0,0,0,1,0,0,0)
x1<-cbind(t1,c1)
x2<-cbind(t2,c2)
km_combine(x1,x2)
km_combine(x1,x2,pos=1)



