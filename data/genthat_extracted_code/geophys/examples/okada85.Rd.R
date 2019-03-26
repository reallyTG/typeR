library(geophys)


### Name: okada85
### Title: Okada Fault Deformation Model
### Aliases: okada85
### Keywords: misc

### ** Examples


library(RPMG)

EX = seq(from=-10, to=10, length=50)
WHY = seq(from=-10, to=10, length=50)
M = RPMG::meshgrid(EX, WHY )

OKout  = okada85(M$x, M$y,2,30,70,5,3,-45,1,1) 
old.par <- par(no.readonly = TRUE) 

par(mfrow=c(2, 2))

image(EX, WHY, OKout$uN, col=terrain.colors(100) ,
asp=1, main="uN" );contour(EX, WHY, OKout$uN, add=TRUE)

image(EX, WHY, OKout$uE, col=terrain.colors(100) ,
asp=1 , main="uE" );contour(EX, WHY, OKout$uE, add=TRUE)

image(EX, WHY, OKout$uZ, col=terrain.colors(100) ,
asp=1, main="uZ" );contour(EX, WHY, OKout$uZ,  add=TRUE)

plot(EX, OKout$uZ[, 25 ])


par(old.par)





