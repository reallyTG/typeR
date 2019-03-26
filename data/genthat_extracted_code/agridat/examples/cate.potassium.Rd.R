library(agridat)


### Name: cate.potassium
### Title: Relative cotton yield for different soil potassium
###   concentrations
### Aliases: cate.potassium
### Keywords: datasets

### ** Examples


data(cate.potassium)
dat <- cate.potassium
names(dat) <- c('y','x')

CateNelson <- function(dat){
  dat <- dat[order(dat$x),] # Sort the data by x
  x <- dat$x
  y <- dat$y

  # Create a data.frame to store the results
  out <- data.frame(x=NA, mean1=NA, css1=NA, mean2=NA, css2=NA, r2=NA)

  css <- function(x) { var(x) * (length(x)-1) }
  tcss <- css(y) # Total corrected sum of squares

  for(i in 2:(length(y)-2)){
    y1 <- y[1:i]
    y2 <- y[-(1:i)]

    out[i, 'x'] <- x[i]
    out[i, 'mean1'] <- mean(y1)
    out[i, 'mean2'] <- mean(y2)
    out[i, 'css1'] <- css1 <- css(y1)
    out[i, 'css2'] <- css2 <- css(y2)
    out[i, 'r2'] <-  ( tcss - (css1+css2)) / tcss
  }
  return(out)
}

cn <- CateNelson(dat)
ix <- which.max(cn$r2)
with(dat, plot(y~x, ylim=c(0,110), xlab="Potassium", ylab="Yield"))
title("cate.potassium - Cate-Nelson analysis")
abline(v=dat$x[ix], col="skyblue")
abline(h=(dat$y[ix] + dat$y[ix+1])/2, col="skyblue")

## Not run: 
##D   # another approach with similar results
##D   # https://joe.org/joe/2013october/tt1.php
##D   require("rcompanion")
##D   cateNelson(dat$x, dat$y, plotit=0)
## End(Not run)




