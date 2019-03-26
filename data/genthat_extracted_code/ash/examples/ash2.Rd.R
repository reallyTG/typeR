library(ash)


### Name: ash2
### Title: bivariate ASH
### Aliases: ash2
### Keywords: nonparametric

### ** Examples

## Don't show: 
# re-enable the next 3lines if used for S-PLUS:
#if(!is.R()) {
#  library(pkgutils)  # to get the example() function
#}
# prepare variables from other example pages if they are not already there:
if(length(ls(pat="bins"))==0){example(bin2)}
## End(Don't show)

# Continuing example from help(bin2)
m <- c(5,5)
f <- ash2(bins,m)
image(f$x,f$y,f$z)
contour(f$x,f$y,f$z,add=TRUE)



