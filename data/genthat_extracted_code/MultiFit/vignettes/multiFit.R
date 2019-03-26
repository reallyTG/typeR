## ---- fig.show='hold'----------------------------------------------------
set.seed(1)
# Generate data for two random vectors, each of dimension 2, 300 observations:
n=300
x = matrix(0, ncol=2, nrow=n)
y = matrix(0, ncol=2, nrow=n)

# x1 and y1 are i.i.d Normal(0,1):
x[,1]=rnorm(n)
y[,1]=rnorm(n)
    
# x2 is a Uniform(0,1):  
x[,2]=runif(n)

# and y2 is depends on x2 as a noisy sine function:
y[,2]=sin(5*pi*x[,2]) + 0.6*rnorm(n)

plot(x[,1],y[,1], col="grey", pch="x", xlab="x1", ylab="y1")
plot(x[,1],y[,2], col="grey", pch="x", xlab="x1", ylab="y2")
plot(x[,2],y[,1], col="grey", pch="x", xlab="x2", ylab="y1")
plot(x[,2],y[,2], col="grey", pch="x", xlab="x2", ylab="y2")

## ------------------------------------------------------------------------
library(MultiFit)
fit = multiFit(x=x, y=y)
fit$p.values

## ------------------------------------------------------------------------
# Data may also be transferred to the function as a single list:
xy = list(x=x,y=y)
fit = multiFit(xy, verbose=TRUE)

## ---- fig.show='hold'----------------------------------------------------
multiSummary(xy=xy, fit=fit, alpha=0.005)

## ------------------------------------------------------------------------
# And plot a DAG representation of the ranked windows:
library(png)
library(qgraph)
multiTree(xy=xy, fit=fit, filename="first_example")

## ---- eval=F-------------------------------------------------------------
#  perm.null.first_example = permNullTest(perm.null.sim=1000L, xy=xy, fit=fit,
#                                         verbose=TRUE)

## ------------------------------------------------------------------------
fit100 = multiFit(xy, M=100, verbose=TRUE)
multiSummary(xy=xy, fit=fit100, alpha=0.005, plot.tests=FALSE)

## ---- eval=F-------------------------------------------------------------
#  # 1. set M=Inf, running through all windows up to the maximal resolution
#  # which by default is set to log2(n/100):
#  ex1 = multiFit(xy, M=Inf)
#  
#  # 2. set both M=Inf and the maximal resolution max.res=Inf.
#  # In this case, the algorithm will scan through higher and higher resolutions,
#  # until there are no more windows that satisfy the minimum requirements for
#  # marginal totals: min.win.tot, min.row.tot and min.col.tot (whose default values
#  # are presented below):
#  ex2 = multiFit(xy, M=Inf, max.res=Inf,
#                 min.win.tot = 25L, min.row.tot = 10L, min.col.tot = 10L)
#  
#  # 3. set smaller minimal marginal totals, that will result in testing
#  # even more windows in finer resolutions:
#  ex3 = multiFit(xy, M=Inf, max.res=Inf,
#                 min.win.tot = 10L, min.row.tot = 4L, min.col.tot = 4L)

## ---- fig.show='hold'----------------------------------------------------
# Generate data for two random vectors, each of dimension 2, 800 observations:
n=800
x = matrix(0, ncol=2, nrow=n)
y = matrix(0, ncol=2, nrow=n)

# x1, x2 and y1 are i.i.d Normal(0,1):
x[,1]=rnorm(n)
x[,2]=rnorm(n)
y[,1]=rnorm(n)

# y2 is i.i.d Normal(0,1) on most of the space:
y[,2]=rnorm(n)
# But is linearly dependent on x2 in a small portion of the space:
w=rnorm(n)
portion.of.space = x[,2]>0 & x[,2]<0.7 & y[,2]>0 & y[,2]<0.7
y[portion.of.space,2] = x[portion.of.space,2]+(1/12)*w[portion.of.space]
xy.local = list(x=x, y=y)

## ---- fig.show='hold'----------------------------------------------------
fit.local = multiFit(xy=xy.local, full.coverage.res=4, verbose=TRUE)
multiSummary(xy=xy.local, fit=fit.local, plot.margin=TRUE, pch="`")

## ---- fig.show='hold'----------------------------------------------------
# Marginal signal:

# Generate data for two random vectors, each of dimension 3, 800 observations:
n=800
x = matrix(0, ncol=3, nrow=n)
y = matrix(0, ncol=3, nrow=n)

# x1, x2, y1 and y2 are all i.i.d Normal(0,1)
x[,1]=rnorm(n)
x[,2]=rnorm(n)
y[,1]=rnorm(n)
y[,2]=rnorm(n)
    
# x3 and y3 form a noisy circle:
theta = runif(n,-pi,pi)
x[,3] = cos(theta) + 0.1*rnorm(n)
y[,3] = sin(theta) + 0.1*rnorm(n)

plot(x[,2],y[,2], col="grey", pch="x", xlab="x2", ylab="y2")
plot(x[,2],y[,3], col="grey", pch="x", xlab="x2", ylab="y3")
plot(x[,3],y[,2], col="grey", pch="x", xlab="x3", ylab="y2")
plot(x[,3],y[,3], col="grey", pch="x", xlab="x3", ylab="y3")

## ---- fig.show='hold'----------------------------------------------------
# And now rotate the circle:
phi = pi/4
rot.mat = matrix(c(cos(phi), -sin(phi),  0,
                   sin(phi),  cos(phi),  0,
                   0,         0,         1), nrow=3, ncol=3)
xxy = t(rot.mat%*%t(cbind(x[,2],x[,3],y[,3])))

x.rtt = matrix(0, ncol=3, nrow=n)
y.rtt = matrix(0, ncol=3, nrow=n)

x.rtt[,1]=x[,1]
x.rtt[,2]=xxy[,1]
x.rtt[,3]=xxy[,2]
y.rtt[,1]=y[,1]
y.rtt[,2]=y[,2]
y.rtt[,3]=xxy[,3]

plot(x.rtt[,2],y.rtt[,2], col="grey", pch="x", xlab="x2", ylab="y2")
plot(x.rtt[,2],y.rtt[,3], col="grey", pch="x", xlab="x2", ylab="y3")
plot(x.rtt[,3],y.rtt[,2], col="grey", pch="x", xlab="x3", ylab="y2")
plot(x.rtt[,3],y.rtt[,3], col="grey", pch="x", xlab="x3", ylab="y3")
    
xy.rtt.circ = list(x=x.rtt, y=y.rtt)

## ---- fig.show='hold'----------------------------------------------------
# This time, try another testing method, chi^2 (faster than the default Fisher's exact test, slightly less powerful):
fit.rtt.circ = multiFit(xy=xy.rtt.circ, test.method="chi.sq", verbose=TRUE)
multiSummary(xy=xy.rtt.circ, fit=fit.rtt.circ, only.rk=1:4)

## ---- fig.show='hold'----------------------------------------------------
n=550
x=matrix(0,nrow=n,ncol=2)
x[,1]=runif(n)
x[,2]=rbeta(n,.3,.3)

epsilon=rnorm(n,0,0.3)

y=matrix(0,nrow=n,ncol=1)
y[,1]=sin(10*x[,1])*(x[,2]>0.75)+sin(40*x[,1])*(x[,2]<=0.75)+epsilon

plot(x[,1],y[,1], col="grey", pch="x", xlab="x2", ylab="y2")
plot(x[,2],y[,1], col="grey", pch="x", xlab="x2", ylab="y2")

## ---- fig.show='hold'----------------------------------------------------
fit.superimpose=multiFit(x=x, y=y, M=100)
multiSummary(x=x, y=y, fit=fit.superimpose, alpha=0.0001)

## ---- fig.show='hold'----------------------------------------------------
n=300
# y is a noisy quadratic function of x:
x.uv = runif(n)
y.uv = (x.uv-0.5)^2 + 0.2*rnorm(n)

plot(x.uv,y.uv, col="grey", pch="x", xlab="x", ylab="y")

xy.uv = list(x=x.uv, y=y.uv)

## ------------------------------------------------------------------------
# Apply the test and in addition compute approximate and theoretical null distributions for the global test statistics:
fit.uv = multiFit(xy=xy.uv, uv.approx.null = TRUE, uv.exact.null = TRUE,
                  uv.null.sim = 10000L, verbose=TRUE)

