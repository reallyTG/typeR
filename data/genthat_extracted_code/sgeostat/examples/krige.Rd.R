library(sgeostat)


### Name: krige
### Title: Kriging
### Aliases: krige
### Keywords: spatial

### ** Examples

## Don't show: 
# prepare variables from other example pages if they are not already there:
if(length(ls(pat="maas.vmod"))==0){example(fit.variogram)}
## End(Don't show)
# a single point:
prdpnt <- point(data.frame(list(x=180000,y=331000)))
prdpnt <- krige(prdpnt, maas.point, 'zinc', maas.vmod)
prdpnt

# kriging on a grid (slow!)
grid <- list(x=seq(min(maas$x),max(maas$x),by=100),
             y=seq(min(maas$y),max(maas$y),by=100))
grid$xr <- range(grid$x)
grid$xs <- grid$xr[2] - grid$xr[1]
grid$yr <- range(grid$y)
grid$ys <- grid$yr[2] - grid$yr[1]
grid$max <- max(grid$xs, grid$ys)
grid$xy <- data.frame(cbind(c(matrix(grid$x, length(grid$x), length(grid$y))),
             c(matrix(grid$y, length(grid$x), length(grid$y), byrow=TRUE))))
colnames(grid$xy) <- c("x", "y")
grid$point <- point(grid$xy)
data(maas.bank)
grid$krige <- krige(grid$point,maas.point,'zinc',maas.vmod,
                    maxdist=1000,extrap=FALSE,border=maas.bank)
op <- par(no.readonly = TRUE)
par(pty="s")
plot(grid$xy, type="n", xlim=c(grid$xr[1], grid$xr[1]+grid$max),
                    ylim=c(grid$yr[1], grid$yr[1]+grid$max))
image(grid$x,grid$y,
      matrix(grid$krige$zhat,length(grid$x),length(grid$y)),
      add=TRUE)
contour(grid$x,grid$y,
        matrix(grid$krige$zhat,length(grid$x),length(grid$y)),
        add=TRUE)
data(maas.bank)
lines(maas.bank$x,maas.bank$y,col="blue")
par(op)



