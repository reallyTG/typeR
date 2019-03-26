library(NMOF)


### Name: restartOpt
### Title: Restart an Optimisation Algorithm
### Aliases: restartOpt

### ** Examples

## see example(DEopt)
algo <- list(nP = 50L,
              F = 0.5,
             CR = 0.9,
            min = c(-10, -10),
            max = c( 10,  10),
    printDetail = FALSE,
       printBar = FALSE)

## choose a larger 'n' when you can afford it
algo$nG <- 100L
res100 <- restartOpt(DEopt, n = 5L, OF = tfTrefethen, algo = algo)
res100F <- sapply(res100, `[[`, "OFvalue")

algo$nG <- 200L
res200 <- restartOpt(DEopt, n = 5L, OF = tfTrefethen, algo = algo)
res200F <- sapply(res200, `[[`, "OFvalue")

xx <- pretty(c(res100F, res200F, -3.31))
plot(ecdf(res100F), main = "optimum is -3.306",
     xlim = c(xx[1L], tail(xx, 1L)))
abline(v = -3.3069, col = "red")  ## optimum
lines(ecdf(res200F), col = "blue")
legend(x = "right", box.lty = 0, , lty = 1,
      legend = c("optimum", "100 generations", "200 generations"),
      pch = c(NA, 19, 19), col = c("red", "black", "blue"))

## a 'best-of-N' strategy: given a sample x of objective
## function values, compute the probability that, after N draws,
## we have at least one realisation not worse than X
x <- c(0.1,.3,.5,.5,.6)
bestofN <- function(x, N) {
    nx <- length(x)
    function(X)
        1 - (sum(x > X)/nx)^N
}
bestof2 <- bestofN(x, 2)
bestof5 <- bestofN(x, 5)
bestof2(0.15)
bestof5(0.15)


## Not run: 
##D ## with R >= 2.13.0 and the compiler package
##D algo$nG <- 100L
##D system.time(res100 <- restartOpt(DEopt, n = 10L, OF = tfTrefethen, algo = algo))
##D 
##D require("compiler")
##D enableJIT(3)
##D system.time(res100 <- restartOpt(DEopt, n = 10L, OF = tfTrefethen, algo = algo))
## End(Not run)



