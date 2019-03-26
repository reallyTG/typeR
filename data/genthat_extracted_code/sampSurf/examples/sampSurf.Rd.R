library(sampSurf)


### Name: sampSurf
### Title: Generate Objects of Class "'sampSurf'"
### Aliases: sampSurf
### Keywords: ~kwd1 ~kwd2

### ** Examples

#
#  create a sampling surface with 3 logs using the "sausage" method...
#
tr = Tract(c(x=50,y=50), cellSize=0.5)
btr = bufferedTract(10, tr)
ssSA = sampSurf(3, btr, iZone = 'sausageIZ', plotRadius=3,
       buttDiam=c(30,50), startSeed=1001)
plot(ssSA, axes=TRUE)
summary(ssSA)



