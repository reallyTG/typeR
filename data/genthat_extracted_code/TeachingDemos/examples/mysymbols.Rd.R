library(TeachingDemos)


### Name: my.symbols
### Title: Draw Symbols (User Defined) on a Plot
### Aliases: my.symbols
### Keywords: aplot dplot hplot

### ** Examples


# symb is matrix

my.symbols( 1:10, runif(10), ms.male, add=FALSE, xlab='x',
  ylab='y', inches=0.3, col=c('blue','green'), xlim=c(0,11), ylim=c(-0.1,1.1))
my.symbols( (1:10)+0.5, runif(10), ms.female, add=TRUE, inches=0.3,
  col=c('red','green') )

# symb is function returning matrix

plot(1:10, 1:10)
my.symbols( 1:10, 1:10, ms.polygram, n=1:10, inches=0.3 )


# symb is plotting function
# create a variation on monthplot

fit <- lm( log(co2) ~ time(co2) )
fit.r <- resid(fit)

x <- 1:12
y <- tapply(fit.r, cycle(co2), mean)

tmp.r <- split( fit.r, cycle(co2) )
tmp.r <- lapply( tmp.r, function(x) x-mean(x) )

yl <- do.call('range',tmp.r)

tmpfun <- function(w,data,ylim,...){
  tmp <- data[[w]]
  plot(seq(along=tmp),tmp, type='l', xlab='',ylab='',
       axes=FALSE, ylim=ylim)
  lines(par('usr')[1:2], c(0,0), col='grey')
}

my.symbols(x,y, symb=tmpfun, inches=0.4, add=FALSE, symb.plots=TRUE,
  xlab='Month',ylab='Adjusted CO2', xlim=c(0.5,12.5),
  ylim=c(-0.012,0.012),
  w=1:12, MoreArgs=list(data=tmp.r,ylim=yl) )

# using xsize and ysize
plot( 1:10, (1:10)*100, type='n', xlab='', ylab='' )
my.symbols( 5, 500, ms.polygon, n=250, inches=1.5 )
my.symbols( 5, 500, ms.polygon, n=250, xsize=2, col='blue' )
my.symbols( 5, 500, ms.polygon, n=250, ysize=200, col='green' )
my.symbols( 5, 500, ms.polygon, n=250, xsize=2, ysize=200, col='red' )
abline( v=c(4,6), col='grey' )
abline( h=c(400, 600), col='grey' )


# hand crafted hexagonal grid

x1 <- seq(0, by=2*sqrt(3), length.out=10)
y1 <- seq(0, by=3, length.out=10)

mypoints <- expand.grid(x=x1, y=y1)
mypoints[,1] <- mypoints[,1] + rep( c(0,sqrt(3)), each=10, length.out=100 )

plot(mypoints, asp=1, xlim=c(-2,35))
my.symbols(mypoints, symb=ms.filled.polygon, n=6,
  inches=par('pin')[1]/(diff(par('usr')[1:2]))*4,
  bg=paste('gray',1:100,sep=''), fg='green' )




