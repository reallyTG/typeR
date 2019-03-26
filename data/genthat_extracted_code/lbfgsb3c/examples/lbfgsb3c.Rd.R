library(lbfgsb3c)


### Name: lbfgsb3c
### Title: Interfacing wrapper for the Nocedal - Morales LBFGSB3 (Fortran)
###   limited memory BFGS solver.
### Aliases: lbfgsb3c
### Keywords: nonlinear optimization parameter

### ** Examples

# Rosenbrock's banana function
n=3; p=100

fr = function(x)
{
    f=1.0
    for(i in 2:n) {
        f=f+p*(x[i]-x[i-1]**2)**2+(1.0-x[i])**2
    }
    f
}

grr = function(x)
{
    g = double(n)
    g[1]=-4.0*p*(x[2]-x[1]**2)*x[1]
    if(n>2) {
        for(i in 2:(n-1)) {
            g[i]=2.0*p*(x[i]-x[i-1]**2)-4.0*p*(x[i+1]-x[i]**2)*x[i]-2.0*(1.0-x[i])
        }
    }
    g[n]=2.0*p*(x[n]-x[n-1]**2)-2.0*(1.0-x[n])
    g
}
x = c(a=1.02, b=1.02, c=1.02)
(op1 <- lbfgsb3c(x,fr, grr, x))



