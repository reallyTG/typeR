library(HH)


### Name: xysplom
### Title: scatterplot matrix with potentially different sets of variables
###   on the rows and columns.
### Aliases: xysplom xysplom.formula xysplom.default
### Keywords: hplot

### ** Examples


## xysplom syntax options

tmp <- data.frame(y=rnorm(12), x=rnorm(12), z=rnorm(12), w=rnorm(12),
                  g=factor(rep(1:2,c(6,6))))
tmp2 <- tmp[,1:4]

xysplom(y + w ~ x , data=tmp, corr=TRUE, beta=TRUE, cartesian=FALSE, layout=c(1,2))

xysplom(y + x ~ z | g, data=tmp, layout=c(2,2))
xysplom(y + x ~ z | g, data=tmp, cartesian=FALSE)

xysplom(w + y ~ x + z, data=tmp)
xysplom(w + y ~ x + z | g, data=tmp, layout=c(2,4))
xysplom(w + y ~ x + z | g, data=tmp, cartesian=FALSE)

## Not run: 
##D ## xyplot in R has many similar capabilities with xysplom
##D if.R(r=
##D        xyplot(w + z ~ x + y, data=tmp, outer=TRUE)
##D      ,s=
##D        {}
##D     )
## End(Not run)




