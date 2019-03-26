library(gsl)


### Name: Ellint
### Title: Elliptic functions
### Aliases: Ellint ellint ellint_Kcomp ellint_Ecomp ellint_F ellint_E
###   ellint_P ellint_D ellint_RC ellint_RD ellint_RF ellint_RJ
### Keywords: array

### ** Examples

ellint_Kcomp(0.3)
ellint_Ecomp(0.3)
ellint_F(0.4,0.7)
ellint_E(0.4,0.7)
ellint_P(0.4,0.7,0.3)
ellint_D(0.4,0.7,0.3)
ellint_RC(0.5,0.6)
ellint_RD(0.5,0.6,0.7)
ellint_RF(0.5,0.6,0.7)
ellint_RJ(0.5,0.6,0.7,0.1)


x <- seq(from=0,to=0.5,by=0.01)
col1 <- ellint_Kcomp(sqrt(x))
col2 <- ellint_Kcomp(sqrt(1-x))
col3 <- exp(-pi*col2/col1)
cbind(x,col1,col2,col3)         #table 17.1, p608

x <- 0:45
col1 <- ellint_Kcomp(sin(pi/180*x))
col2 <- ellint_Kcomp(sin(pi/2-pi/180*x))
col3 <- exp(-pi*col2/col1)
cbind(x,col1,col2,col3)       #table 17.2, p610

x <- seq(from=0,to=90,by=2)
f <- function(a){ellint_F(phi=a*pi/180,sin(x*pi/180))}
g <- function(a){ellint_E(phi=a*pi/180,sin(x*pi/180))}
h <- function(a,n){ellint_P(phi=a*pi/180,sin( a*15*pi/180),n)}
i <- function(x){ellint_P(phi=x*pi/180, k=sin((0:6)*15*pi/180),  n= -0.6)}


cbind(x,f(5),f(10),f(15),f(20),f(25),f(30))          #table 17.5, p613
cbind(x,g(5),g(10),g(15),g(20),g(25),g(30))          #table 17.6, p616



cbind(i(15),i(30),i(45),i(60),i(75),i(90))           #table 17.9,
                                                     #(BOTTOM OF p625)





