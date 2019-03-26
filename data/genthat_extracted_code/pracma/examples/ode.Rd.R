library(pracma)


### Name: ode23
### Title: Non-stiff (and stiff) ODE solvers
### Aliases: ode23 ode23s ode45 ode78
### Keywords: ode

### ** Examples

##  Example1: Three-body problem
f <- function(t, y)
		as.matrix(c(y[2]*y[3], -y[1]*y[3], 0.51*y[1]*y[2]))
y0 <- as.matrix(c(0, 1, 1))
t0 <- 0; tf <- 20
sol <- ode23(f, t0, tf, y0, rtol=1e-5, atol=1e-10)
## Not run: 
##D matplot(sol$t, sol$y, type = "l", lty = 1, lwd = c(2, 1, 1),
##D         col = c("darkred", "darkblue", "darkgreen"),
##D         xlab = "Time [min]", ylab= "",
##D         main = "Three-body Problem")
##D grid()
## End(Not run)

##  Example2: Van der Pol Equation
#   x'' + (x^2 - 1) x' + x = 0
f <- function(t, x)
        as.matrix(c(x[1] * (1 - x[2]^2) -x[2], x[1]))
t0 <- 0; tf <- 20
x0 <- as.matrix(c(0, 0.25))
sol <- ode23(f, t0, tf, x0)
## Not run: 
##D plot(c(0, 20), c(-3, 3), type = "n",
##D      xlab = "Time", ylab = "", main = "Van der Pol Equation")
##D lines(sol$t, sol$y[, 1], col = "blue")
##D lines(sol$t, sol$y[, 2], col = "darkgreen")
##D grid()
## End(Not run)

##  Example3: Van der Pol as stiff equation
vdP  <- function(t,y) as.matrix(c(y[2], 10*(1-y[1]^2)*y[2]-y[1]))
ajax <- function(t, y)
            matrix(c(0, 1, -20*y[1]*y[2]-1, 10*(1-y[1]^2)), 2,2, byrow = TRUE)
sol <- ode23s(vdP, t0, tf, c(2, 0), jac = ajax, hmax = 1.0)
## Not run: 
##D plot(sol$t, sol$y[, 1], col = "blue")
##D lines(sol$t, sol$y[, 1], col = "blue")
##D lines(sol$t, sol$y[, 2]/8, col = "red", lwd = 2)
##D grid()
## End(Not run)

##  Example4: pendulum
m = 1.0;  l = 1.0   # [kg] resp. [m]
g = 9.81; b = 0.7   # [m/s^2] resp. [N s/m]
fp = function(t, x)
        c( x[2] , 1/(1/3*m*l^2)*(-b*x[2]-m*g*l/2*sin(x[1])) )
t0 <- 0.0; tf <- 5.0; hmax = 0.1
y0 = c(30*pi/180, 0.0)
sol = ode45(fp, t0, tf, y0, hmax = 0.1)
## Not run: 
##D matplot(sol$t, sol$y, type = "l", lty = 1)
##D grid()
## End(Not run)

##  Example: enforced pendulum
g <- 9.81
L <- 1.0; Y <- 0.25; w <- 2.5
f <- function(t, y) {
    as.matrix(c(y[2], -g/L * sin(y[1]) + w^2/L * Y * cos(y[1]) * sin(w*t)))
}
y0 <- as.matrix(c(0, 0))
sol <- ode78(f, 0.0, 60.0, y0, hmax = 0.05)
## Not run: 
##D plot(sol$t, sol$y[, 1], type="l", col="blue")
##D grid()
## End(Not run)



