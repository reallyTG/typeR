library(DALY)


### Name: hist.DALY
### Title: Histogram method for class 'DALY'
### Aliases: hist.DALY
### Keywords: output

### ** Examples

## Not run: 
##D 
##D ##= load NCC example ======================================
##D setDALYexample(1)
##D 
##D ##= perform DALY calculation, store results in 'x'  =======
##D x <- getDALY()
##D 
##D ##= plot histogram of total deaths ========================
##D ##= + show 90% credible interval & median =================
##D hist(x, xval = "deaths", prob = 0.90, central = "median")
## End(Not run)


