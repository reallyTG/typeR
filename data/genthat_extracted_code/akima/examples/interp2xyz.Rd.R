library(akima)


### Name: interp2xyz
### Title: From interp() Result, Produce 3-column Matrix
### Aliases: interp2xyz
### Keywords: manip

### ** Examples

data(akima)
ak.spl <- with(akima, interp(x, y, z, linear = FALSE,
                             xo= seq(0,25, length=100),
                             yo= seq(0,20, length= 96)))
str(ak.spl)# list (x[i], y[j], z = <matrix>[i,j])

## Now transform to simple  (x,y,z)  matrix / data.frame :
str(am <- interp2xyz(ak.spl))
str(ad <- interp2xyz(ak.spl, data.frame=TRUE))
## and they are the same:
stopifnot( am == ad | (is.na(am) & is.na(ad)) )



