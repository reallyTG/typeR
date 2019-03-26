library(denpro)


### Name: pcf.func
### Title: Calculates a piecewise constant function for some illustrative
###   purposes
### Aliases: pcf.func
### Keywords: multivariate

### ** Examples

# Elliptical copulas

N<-c(32,32)  # choose the grid size
copula<-c("gauss","student")
margin<-c("normal","student","unif")
b<-4
support<-c(-b,b,-b,b)

ci<-1        # copula, ci = 1, 2
r<-0.5       # parameter of the copula
df<-2        # degrees of freedom for the Student copula 

mi<-1        # margin, mi = 1, 2, 3
sig<-c(1,1)  # std:s for the margins
t<-c(2,2)    # degreeds of freedom for the student margin

ef<-pcf.func(copula[ci],N,marginal=margin[mi],support=support,
             r=r,df=df,sig=sig,t=t)

dp<-draw.pcf(ef)
contour(dp$x,dp$y,dp$z)   

persp(dp$x,dp$y,dp$z,theta=30,phi=30)   

# Archimedean copulas

N<-c(32,32)  # choose the grid size
copula<-c("gumbel","frank","clayton")
margin<-c("normal","student","unif")
b<-4
support<-c(-b,b,-b,b)

ci<-1        # copula, ci = 1, 2, 3
g<-2         # parameter of the copula

mi<-1        # margin, mi = 1, 2, 3
sig<-c(1,1)  # std:s for the margins
t<-c(2,2)    # degreeds of freedom for the student margin

ef<-pcf.func(copula[ci],N,marginal=margin[mi],support=support,
             g=g,sig=sig,t=t)

dp<-draw.pcf(ef)
contour(dp$x,dp$y,dp$z)   

persp(dp$x,dp$y,dp$z,theta=30,phi=30)   

# mixture of Gaussians

d<-2
mixnum<-3               #we simulate a mixture of three Gaussians
M<-matrix(0,mixnum,d)   #rows of M contain the means of members of the mixture
M[1,]<-c(0,0)   
M[2,]<-c(4,0)  
M[3,]<-c(0,4)   
sig<-matrix(1,mixnum,d) #rows of sig contain the std:s ot the marginals
p0<-1/mixnum
p<-p0*rep(1,mixnum)     #p is a vector of weights for the mixture members
N<-c(50,50)

pcf<-pcf.func("mixt",N,sig=sig,M=M,p=p) 

dp<-draw.pcf(pcf,pnum=c(30,30))
contour(dp$x,dp$y,dp$z,drawlabels=FALSE)
persp(dp$x,dp$y,dp$z)

# skewed Gaussian

func<-"skewgauss"
N<-c(50,50)
support<-c(-6,2,-6,2)
mu<-c(0,0)
sig<-c(3,1)
alpha<-c(6,0)
theta<--3*pi/4

pcf<-pcf.func(func,N,support=support,mu=mu,sig=sig,
               alpha=alpha,theta=theta)

dp<-draw.pcf(pcf,pnum=c(60,60))

contour(dp$x,dp$y,dp$z)

persp(dp$x,dp$y,dp$z,theta=30,phi=30)   

# product of univariate Student densities

func<-"prod"
marginal<-"student"
b<-5; support<-c(-b,b,-b,b)
N<-c(32,32)                 # choose the grid size
t<-0.5                      # degrees of freedom                 
ef<-pcf.func(func,N,t=t,support=support,marginal=marginal)

dp<-draw.pcf(ef)
contour(dp$x,dp$y,dp$z)   

persp(dp$x,dp$y,dp$z,theta=30,phi=30) 

# Bartlett-Epanechnikov

func<-"epan"
N<-c(50,50)
sig<-c(1,1)

ef<-pcf.func(func,N,sig)

dp<-draw.pcf(ef)
contour(dp$x,dp$y,dp$z)

persp(dp$x,dp$y,dp$z,theta=30,phi=30)   




