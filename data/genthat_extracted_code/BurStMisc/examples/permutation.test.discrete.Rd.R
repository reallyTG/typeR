library(BurStMisc)


### Name: permutation.test.discrete
### Title: Random Permutation Test
### Aliases: permutation.test.discrete permutation.test.fun
###   print.permtstBurSt
### Keywords: htest

### ** Examples

winner <- c('N', 'N', 'A', 'N', 'A', 'N')
market <- c('+', '-', '-', '+', '+', '+')
smat <- diag(2)
dimnames(smat) <- list(c('N', 'A'), c('+', '-'))

pt1 <- permutation.test.discrete(winner, market, smat)
print(pt1)
plot(pt1)

pt2 <- permutation.test.fun(ToothGrowth[, -2], fun=cor)
print(pt2)
plot(pt2)


smat2 <- matrix(c(-3, -.5, 3, -1, 1, 0, 0, 1, -1, 3, -.5, -3),
	3, 4, dimnames=list(c('Up', 'Neut', 'Down'), 
	c('Q1', 'Q2', 'Q3', 'Q4')))
my.results <- data.frame(results=sample(c('Up', 'Neut', 'Down'),
       100, replace=TRUE), quartile=sample(
       c('Q1', 'Q2', 'Q3', 'Q4'), 100, replace=TRUE))
permutation.test.discrete(my.results[, c("results", "quartile")], 
	score=smat2)




