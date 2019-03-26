library(robustX)


### Name: mvBACON
### Title: BACON: Blocked Adaptive Computationally-Efficient Outlier
###   Nominators
### Aliases: mvBACON
### Keywords: multivariate robust

### ** Examples

 require(robustbase) # for example data and covMcd():
## simple 2D example :
 plot(starsCYG, main = "starsCYG  data  (n=47)")
 B.st <- mvBACON(starsCYG)
 points(starsCYG[ ! B.st$subset,], pch = 4, col = 2, cex = 1.5)
 stopifnot(identical(which(!B.st$subset), c(7L,9L,11L,14L,20L,30L,34L)))
 ## finds the clear outliers (and 3 "borderline")

 ## 'coleman' from pkg 'robustbase'
 coleman.x <- data.matrix(coleman[, 1:6])
 Cc <- covMcd (coleman.x) # truly robust
 summary(Cc) # -> 6 outliers (1,3,10,12,17,18)
 Cb1 <- mvBACON(coleman.x) ##-> subset is all TRUE hmm??
 Cb2 <- mvBACON(coleman.x, init.sel = "dUniMedian")
 stopifnot(all.equal(Cb1, Cb2))
 Cb.r <- lapply(1:20, function(i) { set.seed(i)
                     mvBACON(coleman.x, init.sel="random", verbose=FALSE) })
 nm <- names(Cb.r[[1]]); nm <- nm[nm != "steps"]
 all(eqC <- sapply(Cb.r[-1], function(CC) all.equal(CC[nm], Cb.r[[1]][nm]))) # TRUE
 ## --> BACON always  breaks down, i.e., does not see the outliers here
## Don't show: 
stopifnot(Cb1$subset, Cb.r[[1]]$subset, eqC)
## End(Don't show) ## breaks down even when manually starting with all the non-outliers:
 Cb.man <- mvBACON(coleman.x, init.sel = "manual",
                   man.sel = setdiff(1:20, c(1,3,10,12,17,18)))
 which( ! Cb.man$subset) # the outliers according to mvBACON : _none_



