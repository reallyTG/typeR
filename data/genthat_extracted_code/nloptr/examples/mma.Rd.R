library(nloptr)


### Name: mma
### Title: Method of Moving Asymptotes
### Aliases: mma

### ** Examples


##  Solve the Hock-Schittkowski problem no. 100 with analytic gradients
x0.hs100 <- c(1, 2, 0, 4, 0, 1, 1)
fn.hs100 <- function(x) {
    (x[1]-10)^2 + 5*(x[2]-12)^2 + x[3]^4 + 3*(x[4]-11)^2 + 10*x[5]^6 +
                  7*x[6]^2 + x[7]^4 - 4*x[6]*x[7] - 10*x[6] - 8*x[7]
}
hin.hs100 <- function(x) {
    h <- numeric(4)
    h[1] <- 127 - 2*x[1]^2 - 3*x[2]^4 - x[3] - 4*x[4]^2 - 5*x[5]
    h[2] <- 282 - 7*x[1] - 3*x[2] - 10*x[3]^2 - x[4] + x[5]
    h[3] <- 196 - 23*x[1] - x[2]^2 - 6*x[6]^2 + 8*x[7]
    h[4] <- -4*x[1]^2 - x[2]^2 + 3*x[1]*x[2] -2*x[3]^2 - 5*x[6]	+11*x[7]
    return(h)
}
gr.hs100 <- function(x) {
   c(  2 * x[1] -  20,
      10 * x[2] - 120,
       4 * x[3]^3,
       6 * x[4] - 66,
      60 * x[5]^5,
      14 * x[6]   - 4 * x[7] - 10,
       4 * x[7]^3 - 4 * x[6] -  8 )}
hinjac.hs100 <- function(x) {
    matrix(c(4*x[1], 12*x[2]^3, 1, 8*x[4], 5, 0, 0,
        7, 3, 20*x[3], 1, -1, 0, 0,
        23, 2*x[2], 0, 0, 0, 12*x[6], -8,
        8*x[1]-3*x[2], 2*x[2]-3*x[1], 4*x[3], 0, 0, 5, -11), 4, 7, byrow=TRUE)
}

# incorrect result with exact jacobian
S <- mma(x0.hs100, fn.hs100, gr = gr.hs100,
            hin = hin.hs100, hinjac = hinjac.hs100,
            nl.info = TRUE, control = list(xtol_rel = 1e-8))

## No test: 
# This example is put in donttest because it runs for more than
# 40 seconds under 32-bit Windows. The difference in time needed
# to execute the code between 32-bit Windows and 64-bit Windows
# can probably be explained by differences in rounding/truncation
# on the different systems. On Windows 32-bit more iterations
# are needed resulting in a longer runtime.
# correct result with inexact jacobian
S <- mma(x0.hs100, fn.hs100, hin = hin.hs100,
            nl.info = TRUE, control = list(xtol_rel = 1e-8))
## End(No test)




