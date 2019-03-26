library(RSEIS)


### Name: butfilt
### Title: Butterworth filter
### Aliases: butfilt
### Keywords: misc

### ** Examples

data(CE1)

ts1  <-  CE1$y
zz  <-  butfilt(ts1, fl=1, fh=15,  deltat=CE1$dt, type="LP" ,  proto="BU",
npoles=5 )



###  try plotting:
## Not run: 
##D ### the above, by default, is zero phase.
##D #####  next filter with non-zero-phase
##D z2  <-  butfilt(ts1, fl=1, fh=15,  deltat=CE1$dt, type="LP" ,  proto="BU",
##D npoles=5, zp=FALSE )
##D ex = seq(from=0, by=CE1$dt, length=length(ts1))
##D 
##D plot(ex,  ts1, type='l')
##D lines(ex, zz, col='red')
##D lines(ex, z2, col='blue')
##D 
##D 
##D plot(ex[ex<0.5],  ts1[ex<0.5], type='l')
##D lines(ex[ex<0.5], zz[ex<0.5], col='red')
##D lines(ex[ex<0.5], z2[ex<0.5], col='blue')
##D 
##D 
##D 
## End(Not run)





