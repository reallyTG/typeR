library(elliptic)


### Name: WeierstrassP
### Title: Weierstrass P and related functions
### Aliases: WeierstrassP P Pdash sigma zeta e18.10.1 e18.10.2 e18.10.3
###   e18.10.4 e18.10.5 e18.10.6 e18.10.7
### Keywords: math

### ** Examples

## Example 8, p666, RHS:
P(z=0.07 + 0.1i,g=c(10,2))

## Example 8, p666, RHS:
P(z=0.1 + 0.03i,g=c(-10,2))
## Right answer!

## Compare the Laurent series, which also gives the Right Answer (tm):
 P.laurent(z=0.1 + 0.03i,g=c(-10,2))


## Now a nice little plot of the zeta function:
x <- seq(from=-4,to=4,len=100)
z <- outer(x,1i*x,"+")
view(x,x,limit(zeta(z,c(1+1i,2-3i))),nlevels=6,scheme=1)


#now figure 18.5, top of p643:
p <- parameters(Omega=c(1+0.1i,1+1i))
n <- 40

f <- function(r,i1,i2=1)seq(from=r+1i*i1, to=r+1i*i2,len=n)
g <- function(i,r1,r2=1)seq(from=1i*i+r1,to=1i*i+2,len=n)

solid.lines <-
  c(
    f(0.1,0.5),NA,
    f(0.2,0.4),NA,
    f(0.3,0.3),NA,
    f(0.4,0.2),NA,
    f(0.5,0.0),NA,
    f(0.6,0.0),NA,
    f(0.7,0.0),NA,
    f(0.8,0.0),NA,
    f(0.9,0.0),NA,
    f(1.0,0.0)
    )
dotted.lines <-
  c(
    g(0.1,0.5),NA,
    g(0.2,0.4),NA,
    g(0.3,0.3),NA,
    g(0.4,0.2),NA,
    g(0.5,0.0),NA,
    g(0.6,0.0),NA,
    g(0.7,0.0),NA,
    g(0.8,0.0),NA,
    g(0.9,0.0),NA,
    g(1.0,0.0),NA
    )

plot(P(z=solid.lines,params=p),xlim=c(-4,4),ylim=c(-6,0),type="l",asp=1)
lines(P(z=dotted.lines,params=p),xlim=c(-4,4),ylim=c(-6,0),type="l",lty=2)



