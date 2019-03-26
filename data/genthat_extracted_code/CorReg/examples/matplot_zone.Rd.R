library(CorReg)


### Name: matplot_zone
### Title: Matplot with curves comparison by background colors.
### Aliases: matplot_zone

### ** Examples

    ## Not run: 
##D require(CorReg)
##D n=15
##D x=1:n
##D y=cbind(c(rnorm(5,0,1),rnorm(5,1,1),rnorm(5,2,1)),
##D          c(rnorm(5,0,1),rnorm(5,1,1),rnorm(5,4,1)),
##D          c(rnorm(5,1,3),rnorm(5,1,2),rnorm(5,1,1)))
##D matplot_zone(x,y,type="l",what=which.max,main="Highest curve")
##D #background color follows color of the highest curve
##D matplot_zone(x,y,type="l",what=which.min,main="Lowest curve")
##D #background color follows color of the lowest curve
##D 
## End(Not run)



