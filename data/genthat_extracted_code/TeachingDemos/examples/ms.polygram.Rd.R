library(TeachingDemos)


### Name: ms.polygram
### Title: Symbol functions/data to be passed as symb argument to
###   my.symbols
### Aliases: ms.polygram ms.polygon ms.filled.polygon ms.male ms.female
###   ms.arrows ms.sunflowers ms.image ms.face
### Keywords: dplot aplot

### ** Examples


plot(1:10,1:10)
my.symbols(1:10,1:10, ms.polygram, n=1:10, r=seq(0.5,1,length.out=10),
inches=0.3)

my.symbols(1:10,1:10, ms.polygon, n=1:10, add=FALSE, inches=0.3)

my.symbols(1:5, 5:1, ms.filled.polygon, add=FALSE, n=3:7, fg='green',
  bg=c('red','blue','yellow','black','white'), inches=0.3 )

my.symbols( 1:10, 1:10, ms.female, inches=0.3, add=FALSE)
my.symbols( 1:10, 10:1, ms.male, inches=0.3, add=TRUE)

plot(1:10, 1:10)
my.symbols(1:10, 1:10, ms.arrows, angle=runif(10)*2*pi, inches=0.5,
adj=seq(0,1,length.out=10), symb.plots=TRUE)

my.symbols(1:10, 1:10, ms.sunflowers, n=1:10, inches=0.3, add=FALSE)

if( require(png) ) {
  img <- readPNG(system.file("img", "Rlogo.png", package="png"))

  my.symbols( runif(10), runif(10), ms.image, MoreArgs=list(img=img),
                 inches=0.5, symb.plots=TRUE, add=FALSE)
}

tmp.mtcars <- scale(mtcars, center=sapply(mtcars,min),
	scale=sapply(mtcars,function(x) diff(range(x))) )
tmp2.mtcars <- lapply( seq_len(nrow(tmp.mtcars)), function(i) tmp.mtcars[i,] )
my.symbols(mtcars$wt, mtcars$mpg, ms.face, inches=0.3, features=tmp2.mtcars,
	add=FALSE)





