library(solaR)


### Name: A8_readG0dm
### Title: Monthly mean values of global horizontal irradiation.
### Aliases: readG0dm
### Keywords: utilities constructors

### ** Examples

G0dm=c(2.766,3.491,4.494,5.912,6.989,7.742,7.919,7.027,5.369,3.562,2.814,2.179)*1000;
Ta=c(10, 14.1, 15.6, 17.2, 19.3, 21.2, 28.4, 29.9, 24.3, 18.2, 17.2, 15.2)
BD<-readG0dm(G0dm=G0dm, Ta=Ta, lat=37.2)
print(BD)
getData(BD)
xyplot(BD)



