library(TIMP)


### Name: divergeZimage
### Title: Plots a matrix with a diverging palette, with the center value
###   of the palettle possible to set
### Aliases: divergeZimage
### Keywords: hplot

### ** Examples


exd <- dat(psi.df=matrix(rnorm(1000), ncol=100, nrow=100),
x=1:100,x2=1:100, nl=as.integer(100), nt=as.integer(100))

## by default linear range until 1 is used, logarithmic thereafter
divergeZimage(exd)

## can change this as desired
divergeZimage(exd, lin=10, title="plot linearly to 10")




