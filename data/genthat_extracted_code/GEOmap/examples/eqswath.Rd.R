library(GEOmap)


### Name: eqswath
### Title: Extract a set of eathquakes in swath along a cross sectional
###   line
### Aliases: eqswath
### Keywords: misc

### ** Examples


 #############  create data
x = runif(100, 1, 100)  
y = runif(100, 1, 100) 
z = runif(100, 1, 10) 
plot(x,y, asp=1)
## L = locator()

L=list()
L$x=c( 5.42328560757,64.62879777806)
L$y=c(89.843266449785,-0.174423911329)

J = eqswath(x, y, z, L, width = 10, PROJ = NULL)

##########   show box:
plot(x,y, asp=1)
lines(J$InvBox$x, J$InvBox$y)


############  show cross section with events plotted
plot(J$r, -J$depth)




