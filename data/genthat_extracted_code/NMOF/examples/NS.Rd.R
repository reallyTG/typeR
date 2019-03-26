library(NMOF)


### Name: NS
### Title: Zero Rates for Nelson-Siegel-Svensson Model
### Aliases: NS NSS

### ** Examples

tm <- c(c(1, 3, 6, 9) / 12, 1:10)  ## in years
param <- c(6, 3, 8, 1)
yM <- NS(param, tm)
plot(tm, yM, xlab = "maturity in years", 
             ylab = "yield in percent")

param <- c(6, 3, 5, -5, 1, 3)  
yM <- NSS(param, tm) 
plot(tm, yM, xlab = "maturity in years", 
             ylab = "yield in percent")


## Not run: 
##D ## get Bliss/Diebold/Li data (used in some of the papers in References)
##D u <- url("http://www.ssc.upenn.edu/~fdiebold/papers/paper49/FBFITTED.txt")
##D open(u); BliDiLi <- scan(u, skip = 14); close(u)
##D mat <- NULL
##D for (i in 1:372) 
##D     mat <- rbind(mat,BliDiLi[(19*(i-1)+1):(19*(i-1)+19)])
##D mats  <- c(1,3,6,9,12,15,18,21,24,30,36,48,60,72,84,96,108,120)/12
##D 
##D ## the obligatory perspective plot
##D persp(x = mat[,1], y = mats, mat[ ,-1L],
##D       phi = 30, theta = 30, ticktype = "detailed",
##D       xlab = "time",
##D       ylab = "time to maturity in years",
##D       zlab = "zero rates in %")
## End(Not run)



