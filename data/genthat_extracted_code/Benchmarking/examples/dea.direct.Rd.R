library(Benchmarking)


### Name: dea.direct
### Title: Directional efficiency
### Aliases: dea.direct
### Keywords: models efficiency

### ** Examples

# Directional efficiency
x <- matrix(c(2,5 , 1,2 , 2,2 , 3,2 , 3,1 , 4,1), ncol=2,byrow=TRUE)
y <- matrix(1,nrow=dim(x)[1])
dea.plot.isoquant(x[,1], x[,2],txt=1:dim(x)[1])

E <- dea(x,y)
z <- c(1,1)
e <- dea.direct(x,y,DIRECT=z)
data.frame(Farrell=E$eff, Perform=e$eff, objval=e$objval)
# The direction
arrows(x[,1], x[,2], (x-z)[,1], (x-z)[,2], lty="dashed")
# The efficiency (e$objval) along the direction
segments(x[,1], x[,2], (x-e$objval*z)[,1], (x-e$objval*z)[,2], lwd=2)



# Different directions
x1 <- c(.5, 1, 2, 4, 3, 1)
x2 <- c(4,  2, 1,.5, 2, 4)
x <- cbind(x1,x2)
y <- matrix(1,nrow=dim(x)[1])
dir1 <- c(1,.25)
dir2 <- c(.25, 4)
dir3 <- c(1,4)
e <- dea(x,y)
e1 <- dea.direct(x,y,DIRECT=dir1)
e2 <- dea.direct(x,y,DIRECT=dir2)
e3 <- dea.direct(x,y,DIRECT=dir3)
data.frame(e=eff(e),e1=e1$eff,e2=e2$eff,e3=e3$eff)[6,]

# Technology and directions for all firms
dea.plot.isoquant(x[,1], x[,2],txt=1:dim(x)[1])
arrows(x[,1], x[,2],  x[,1]-dir1[1], x[,2]-dir1[2],lty="dashed")
segments(x[,1], x[,2],  
    x[,1]-e1$objval*dir1[1], x[,2]-e1$objval*dir1[2],lwd=2)
# slack for direction 1
dsl1 <- slack(x,y,e1)
cbind(E=e$eff,e1$eff,dsl1$sx,dsl1$sy, sum=dsl1$sum)



# Technology and directions for firm 6, 
# Figure 2.6 page 32 in Bogetoft & Otto (2011)
dea.plot.isoquant(x1,x2,lwd=1.5, txt=TRUE)
arrows(x[6,1], x[6,2],  x[6,1]-dir1[1], x[6,2]-dir1[2],lty="dashed")
arrows(x[6,1], x[6,2],  x[6,1]-dir2[1], x[6,2]-dir2[2],lty="dashed")
arrows(x[6,1], x[6,2],  x[6,1]-dir3[1], x[6,2]-dir3[2],lty="dashed")
segments(x[6,1], x[6,2],  
    x[6,1]-e1$objval[6]*dir1[1], x[6,2]-e1$objval[6]*dir1[2],lwd=2)
segments(x[6,1], x[6,2],  
    x[6,1]-e2$objval[6]*dir2[1], x[6,2]-e2$objval[6]*dir2[2],lwd=2)
segments(x[6,1], x[6,2],  
    x[6,1]-e3$objval[6]*dir3[1], x[6,2]-e3$objval[6]*dir3[2],lwd=2)



