library(geophys)


### Name: erf
### Title: Error Function
### Aliases: erf erfc erfinv philpotts.erf
### Keywords: misc

### ** Examples


j = seq(from=0, to=5.5, by=0.01)
 y = erf(j)   
phil = philpotts.erf(j)

 plot(j,y)
points( j, phil, pch=3, col='red'  )


#### plot the difference
plot(j, y-phil)
lines(j, y-phil)


#####  inverse of erf function:

 j = seq(from=0, to=5.5, by=0.1)
 y = erf(j)

for(i in 1:length(j))
   {

     z = erfinv(y[i])
     print(paste(i, y[i], j[i], z, sep=" "))
   }





