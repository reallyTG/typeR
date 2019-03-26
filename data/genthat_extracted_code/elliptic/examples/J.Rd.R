library(elliptic)


### Name: J
### Title: Various modular functions
### Aliases: J lambda
### Keywords: math

### ** Examples

 J(2.3+0.23i,use.theta=TRUE)
 J(2.3+0.23i,use.theta=FALSE)

 #Verify that J(z)=J(-1/z):
 z <- seq(from=1+0.7i,to=-2+1i,len=20)
 plot(abs((J(z)-J(-1/z))/J(z)))

 # Verify that lamba(z) = lambda(Mz) where M is a modular matrix with b,c
 # even and a,d odd:

 M <- matrix(c(5,4,16,13),2,2)
 z <- seq(from=1+1i,to=3+3i,len=100)
 plot(lambda(z)-lambda(M %mob% z,maxiter=100))


#Now a nice little plot; vary n to change the resolution:
 n <- 50
 x <- seq(from=-0.1, to=2,len=n)
 y <- seq(from=0.02,to=2,len=n)

 z <- outer(x,1i*y,"+")
 f <- lambda(z,maxiter=40)
 g <- J(z)
 view(x,y,f,scheme=04,real.contour=FALSE,main="try higher resolution")
 view(x,y,g,scheme=10,real.contour=FALSE,main="try higher resolution")




