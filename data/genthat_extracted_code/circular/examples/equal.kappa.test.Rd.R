library(circular)


### Name: equal.kappa.test
### Title: Equal Kappa Test
### Aliases: equal.kappa.test print.equal.kappa.test
### Keywords: htest

### ** Examples


x <- c(rvonmises(50, circular(0), 1), rvonmises(100, circular(pi/3), 10))
group <- c(rep(0, 50), rep(1, 100)) 

equal.kappa.test(x, group)




