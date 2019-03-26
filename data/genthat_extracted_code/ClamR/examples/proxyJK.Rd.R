library(ClamR)


### Name: proxyJK
### Title: Jackknife Wilkinson Curve Fitting
### Aliases: proxyJK
### Keywords: misc

### ** Examples



## Not run: 
##D 
##D ##########   this is for reading in data
##D ########  fn = "/home/lees/DONNA/donna_viking_1.csv"
##D 
##D ## fn = "donna_viking_1.csv"
##D ######## C1 = scan(file=fn, what=list(mm="", o18=""), sep=",")
##D ######## x = as.numeric(C1$mm)
##D ######## y = as.numeric(C1$o18)
##D ########x = x[!is.na(y)]
##D ########y = y[!is.na(y)]
##D 
##D 
##D data(CLAM1)
##D x = CLAM1$x
##D y = CLAM1$y
##D 
##D dx = 3.392
##D 
##D gout = proxyJK(x, y, dx)
##D 
##D plotproxy1(x, y, gout)
##D 
##D par(mfrow=c(2,1))
##D 
##D plotproxy.error(x, y, gout, type = 1)
##D plotproxy.error(x, y, gout, type = 2)
##D 
##D 
##D par(mfrow=c(2,1))
##D plotproxy.error(x, y, gout, type = 2)
##D 
##D plotproxy.all2(gout, YAXstyle=1 )
##D 
## End(Not run)




