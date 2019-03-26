library(pracma)


### Name: integral
### Title: Adaptive Numerical Integration
### Aliases: integral
### Keywords: math

### ** Examples

##  Very smooth function
fun <- function(x) 1/(x^4+x^2+0.9)
val <- 1.582232963729353
for (m in c("Kron", "Clen", "Simp")) {
    Q <- integral(fun, -1, 1, reltol = 1e-12, method = m)
    cat(m, Q, abs(Q-val), "\n")}
# Kron 1.582233 3.197442e-13 
# Rich 1.582233 3.197442e-13  # use quadgr()
# Clen 1.582233 3.199663e-13 
# Simp 1.582233 3.241851e-13 
# Romb 1.582233 2.555733e-13  # use romberg()

##  Highly oscillating function
fun <- function(x) sin(100*pi*x)/(pi*x)
val <- 0.4989868086930458
for (m in c("Kron", "Clen", "Simp")) {
    Q <- integral(fun, 0, 1, reltol = 1e-12, method = m)
    cat(m, Q, abs(Q-val), "\n")}
# Kron 0.4989868 2.775558e-16 
# Rich 0.4989868 4.440892e-16  # use quadgr()
# Clen 0.4989868 2.231548e-14
# Simp 0.4989868 6.328271e-15 
# Romb 0.4989868 1.508793e-13  # use romberg()

## Evaluate improper integral
fun <- function(x) log(x)^2 * exp(-x^2)
val <- 1.9475221803007815976
Q <- integral(fun, 0, Inf, reltol = 1e-12)
# For infinite domains Gauss integration is applied!
cat(m, Q, abs(Q-val), "\n")
# Kron 1.94752218028062 2.01587635473288e-11 

## Example with small function support
fun <- function(x)
          if (x<=0 || x>=pi) 0 else sin(x)
Fun <- Vectorize(fun)
integral(fun, -100, 100, no_intervals = 1)  # 0
integral(Fun, -100, 100, no_intervals = 1)  # 0
integral(fun, -100, 100, random=FALSE)      # 2.00000000371071
integral(fun, -100, 100, random=TRUE)       # 2.00000000340142
integral(Fun, -1000, 1000, random=FALSE)    # 2.00000000655435
integral(Fun, -1000, 1000, random=TRUE)     # 2.00000001157690 (sometimes 0 !)



