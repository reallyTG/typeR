library(ClamR)


### Name: plotproxy.error
### Title: Plot Output Jack-Knife
### Aliases: plotproxy.error plotproxy1 plotproxy.all plotproxy.all2
###   plotproxy.error11
### Keywords: misc

### ** Examples


## Not run: 
##D ##  example to read in your data from csv file (for non ClamR data
##D 
##D ## fn = "donna_viking_1.csv"
##D ## C1 = scan(file=fn, what=list(mm="", o18=""), sep=",")
##D ## x = as.numeric(C1$mm)
##D ## y = as.numeric(C1$o18)
##D ## x = x[!is.na(y)]
##D ## y = y[!is.na(y)]
##D 
##D 
##D data(CLAM1)
##D 
##D x = CLAM1$x
##D y = CLAM1$y
##D 
##D dx = 3.392
##D 
##D gout = proxyJK(x, y, dx)
##D 
##D plotproxy1(x,y,gout)
##D 
## End(Not run)




