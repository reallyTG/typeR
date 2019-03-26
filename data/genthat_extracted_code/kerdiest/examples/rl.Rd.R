library(kerdiest)


### Name: rl
### Title: Return level estimation
### Aliases: rl
### Keywords: smooth nonparametric

### ** Examples

data(saltriver)
peak<-saltriver$peakflow
## Not run: 
##D year<-saltriver$year
##D plot(year,peak, type="l",ylab="Annual peak flow")
##D  
## End(Not run)
# Calculating the return values for a period from 2 to 100 years
 T<-seq(2,100, length.out=100)
ret.lev<-rl(vec_data=peak, T=T)
## Not run: 
##D plot(T, ret.lev, type="l", xlab="years", ylab="Flow (cumecs)", 
##D main="Return level Plot")
##D  
## End(Not run)
 


