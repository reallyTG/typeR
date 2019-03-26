library(decon)


### Name: DeconCdf
### Title: Estimating cumulative distribution function from data with
###   measurement error
### Aliases: DeconCdf
### Keywords: nonparametric smooth measurement error

### ** Examples


#####################
## the R function to estimate the smooth distribution function
SDF <- function (x, bw = bw.nrd0(x), n = 512, lim=1){
        dx <- lim*sd(x)/20 
        xgrid <- seq(min(x)-dx, max(x)+dx, length = n)
        Fhat <- sapply(x, function(x) pnorm((xgrid-x)/bw)) 
        return(list(x = xgrid, y = rowMeans(Fhat)))
    }

## Case study: homoscedastic normal errors
n2 <- 1000
x2 <- c(rnorm(n2/2,-3,1),rnorm(n2/2,3,1))
sig2 <- .8
u2 <- rnorm(n2, sd=sig2)
w2 <- x2+u2
# estimate the bandwidth with the bootstrap method with resampling
bw2 <- bw.dboot2(w2,sig=sig2, error="normal")
# estimate the distribution function with measurement error
F2 <-  DeconCdf(w2,sig2,error='normal',bw=bw2)

plot(F2,  col="red", lwd=3, lty=2, xlab="x", ylab="F(x)", main="")
lines(SDF(x2), lwd=3, lty=1)
lines(SDF(w2), col="blue", lwd=3, lty=3)





