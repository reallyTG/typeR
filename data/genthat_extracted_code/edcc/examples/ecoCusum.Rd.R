library(edcc)


### Name: ecoCusum
### Title: Economic design for the CUSUM control chart
### Aliases: echCusum ecoCusum

### ** Examples

#Chiu, W.K. (1974). Applied Statistics, 23, p427 Table3, row 1-2,14
## LINE 1
## global optimization to h, H and n, when lambda = 0.01, "Nelder-Mead" optimization algorithm doesn't work
#(y <- ecoCusum( P0=150,P1=50,Cr=30,d1=0,d2=0))
## we can try other algorithms:
(y1 <- ecoCusum( P0=150,P1=50,Cr=30,d1=0,d2=0,method="BFGS"))
# Based on the global optimum above, we specify the range of the
# parameters like this
(yy1 <- ecoCusum( h=seq(1.3,1.45,by=.01), H=seq(.5,0.6,by=.01),n=4:6,
P0=150,P1=50,Cr=30,d1=0,d2=0))
## LINE 2
(y2 <- ecoCusum( P0=150,P1=50,Cr=30,d1=0,d2=0,lambda=0.05))
(yy2 <- ecoCusum( h=seq(.6,0.7,by=.01), H=seq(.5,0.6,by=.01),n=3:6,
P0=150,P1=50,Cr=30,d1=0,d2=0,lambda=0.05))
contour(yy2)
## LINE 14
(y14 <- ecoCusum(n=30,P0=150,P1=50,Cr=30,delta=0.5,d1=0,d2=0,method="L-BFGS-B"))
(yy14 <- ecoCusum(h=seq(2.55,2.65,by=0.01),H=seq(0.3,0.4,by=0.01),
n=28:30,P0=150,P1=50,Cr=30,delta=0.5,d1=0,d2=0))
#Douglas (2009). Statistical quality control: a modern introduction, sixth edition, p470.
ecoCusum(lambda=.05,P0=110,P1=10,Cr=25,Cf=50,Tr=0,Tf=0,Tc=1,T0=.0167,a=1)
ecoCusum(h=seq(0.75,0.85,by=.01),H=seq(.55,0.65,by=.01),n=4:6,lambda=.05,
P0=110,P1=10,Cr=25,Cf=50,Tr=0,Tf=0,Tc=1,T0=.0167,a=1)



