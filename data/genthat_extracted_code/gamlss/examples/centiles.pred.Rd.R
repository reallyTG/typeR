library(gamlss)


### Name: centiles.pred
### Title: Creating predictive centiles values
### Aliases: centiles.pred
### Keywords: regression

### ** Examples

## bring the data and fit the model
data(abdom)
a<-gamlss(y~pb(x),sigma.fo=~pb(x), data=abdom, family=BCT)
## plot the centiles
centiles(a,xvar=abdom$x)
##-----------------------------------------------------------------------------
## first use of  centiles.pred()
## to calculate the centiles at new x values
##-----------------------------------------------------------------------------
newx<-seq(12,40,2)
mat <- centiles.pred(a, xname="x", xvalues=newx )
mat
## now plot the centile curves  
 mat <- centiles.pred(a, xname="x",xvalues=newx, plot=TRUE )
##-----------------------------------------------------------------------------
## second use of centiles.pred()
## to calculate (nornalised) standard-centiles for new x
## values using the fitted model
##-----------------------------------------------------------------------------
newx <- seq(12,40,2)
mat <- centiles.pred(a, xname="x",xvalues=newx, type="standard-centiles" )
mat
## now plot the standard centiles  
mat <- centiles.pred(a, xname="x",xvalues=newx, type="standard-centiles",
       plot = TRUE )
##-----------------------------------------------------------------------------
## third use of centiles.pred()
##  if we have new x and y values what are their z-scores?
##-----------------------------------------------------------------------------
# create new y and x values and plot them in the previous plot
newx <- c(20,21.2,23,20.9,24.2,24.1,25)
newy <- c(130,121,123,125,140,145,150)
for(i in 1:7) points(newx[i],newy[i],col="blue")
## now calculate their z-scores
znewx <- centiles.pred(a, xname="x",xvalues=newx,yval=newy, type="z-scores" )
znewx
## Not run: 
##D ##-----------------------------------------------------------------------------
##D ## What we do if the x variables is transformed?
##D ##----------------------------------------------------------------------------
##D ##  case 1 : transformed x-variable within the formula
##D ##----------------------------------------------------------------------------
##D ## fit model
##D aa <- gamlss(y~pb(x^0.5),sigma.fo=~pb(x^0.5), data=abdom, family=BCT)
##D ## centiles works
##D centiles(aa,xvar=abdom$x, legend = FALSE)
##D newx<-seq(12,40,2)
##D mat <- centiles.pred(aa, xname="x",xvalues=newx, plot=TRUE )
##D 
##D mat <- centiles.pred(aa, xname="x",xvalues=c(20, 2 )
##D mat
##D xx <- rep(mat[,1],9)
##D yy<-mat[,2:10]
##D points(xx,yy,col="red")
##D ## case 2 : x-variable previously transformed 
##D nx<-abdom$x^0.5
##D aa<-gamlss(y~pb(nx),sigma.fo=~pb(nx), data=abdom, family=BCT)
##D centiles(aa, xvar=abdom$x)
##D newd<-data.frame( abdom, nx=abdom$x^0.5)
##D mat <-  centiles.pred(aa, xname="nx", xvalues=c(30), power=0.5, data=newd)
##D xxx<-rep(mat[,1],9)
##D yyy<-mat[,2:10]
##D points(xxx,yyy,col="red")
## End(Not run)



