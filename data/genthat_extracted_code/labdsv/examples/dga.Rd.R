library(labdsv)


### Name: dga
### Title: Direct Gradient Analysis
### Aliases: dga
### Keywords: multivariate

### ** Examples

    data(bryceveg) # returns a data.frame called bryceveg
    x <- c(0.2,0.5,1.0,2.0,3.0,4.0,5.0,6.0)
    y <- c(0.2,0.5,3.0,15.0,37.5,62.5,85.0,97.5)
    cover <- vegtrans(bryceveg,x,y)
    data(brycesite)
    dga(round(cover$arcpat),brycesite$elev,brycesite$av)



