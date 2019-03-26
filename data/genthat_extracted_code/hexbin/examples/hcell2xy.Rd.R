library(hexbin)


### Name: hcell2xy
### Title: Compute X and Y Coordinates for Hexagon Cells
### Aliases: hcell2xy hcell2xy,hexbin-method
### Keywords: manip

### ** Examples

x <- rnorm(10000)
y <- rnorm(10000)
plot(x,y, pch=".")
hbin <- hexbin(x,y)
str(xys <- hcell2xy(hbin))
points(xys, cex=1.5, col=2) ; title("hcell2xy( hexbin(..) )", col.main=2)

## Don't show: 
## Temporal trends with confidence bounds plotted on a map:
## <NOT YET> Illustration only pending access to user functions
##      mtapply()            # like tapply but for matrices
##      sens.season.slope()  # computes sen's seasonal slope

## This part does not work and commented out
#hbin  <- hcell(dat$x,dat$y)   #  x and y are in map projection units
#newdat < dat[,c('month','year','value')]    # extract columns
#stats <- mtapply(newdat,bin$cell,sens.season.slope,season=12)
#plot(mymap,type='l')       # map boundaries in map projection units
#xy <- hcell2xy(hbin)  # x and y coordinates for hexagon cell centers
#hray(xy$x, xy$y,val=stat[,1],lower= stat[,2],upper=stat[,3])
## End(Don't show)



