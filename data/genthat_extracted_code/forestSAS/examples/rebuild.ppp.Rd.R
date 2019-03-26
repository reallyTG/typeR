library(forestSAS)


### Name: rebuild.ppp
### Title: Reestablishing an object of class "ppp"
### Aliases: rebuild.ppp

### ** Examples

library(spatstat)
####Based on the simulated data####
# Creating a simulated point pattern
x <- runif(20)
y <- runif(20)
X <- ppp(x, y, c(0,1), c(0,1))
X

# Adding a identification number (ID) for each data point in the point pattern
# the following are equivalent
X1<-rebuild.ppp(X)
X1<-rebuild.ppp(X,id=1:X$n)
X1<-rebuild.ppp(X,id=1:20)
X1
as.data.frame(X1)

# Adding a identification number (ID) for each data point in the point pattern, and
# Removing the assinged points according to the ID.
X2<-rebuild.ppp(X,id=1:20,rm.id=1:5)
X2
as.data.frame(X2)
# Adding some points into orginal point pattern
newx <- runif(10)
newy <- runif(10)
newX <- ppp(newx, newy, c(0,1), c(0,1))
XY<-rebuild.ppp(X,add.X=newX,add.id=paste("new",1:10,sep=""))
XY
as.data.frame(XY)

####Based on the example data####
data(finpines)
finpines
# Marked planar point pattern: 126 points
# Mark variables: diameter, height
# window: rectangle = [-5, 5] x [-8, 2] metres

# Adding a identification number (ID) for each tree in the finpines
# finpines$n
# [1] 126
finpines_id<-rebuild.ppp(finpines,id=paste("T",1:126,sep=""))
finpines_id
head(as.data.frame(finpines_id))

# Removing the trees with id "T1","T3","T8","T9","T59","T60","T120"
finpines_rm<-rebuild.ppp(X=finpines,id=paste("T",1:126,sep=""),
                        rm.id=c("T1","T3","T8","T9","T59","T60","T120"))
finpines_rm
as.data.frame(finpines_rm)

# Adding some trees data into finpines
add.x=c(-2,-1,0,2,4)
add.y=c(-4,-3,-6,0,1)
add.marks=data.frame(diameter=c(2.0,3.0,4.0,5.0,6.0),
                 height=c(2.5,3.5,4.5,5.5,6.5))
add.Xdata=ppp(x=add.x,y=add.y,marks=add.marks,c(-5,5),c(-8,2))

finpines_add<-rebuild.ppp(X=finpines,id=paste("T",1:126,sep=""),
                         add.X=add.Xdata,add.id=paste("NT",1:5,sep=""))
finpines_add
as.data.frame(finpines_add)



