library(agridat)


### Name: hazell.vegetables
### Title: Gross profit for 4 vegetable crops in 6 years
### Aliases: hazell.vegetables
### Keywords: datasets

### ** Examples


data("hazell.vegetables")
dat <- hazell.vegetables

if(FALSE & require(lattice)) {
  xyplot(carrot+celery+cucumber+pepper ~ year,dat,
         ylab="yearly profit by crop",
         type='b', auto.key=list(columns=4),
         panel.hline=0)
}

# optimal strategy for planting crops (calculated below)
dat2 <- apply(dat[,-1], 1, function(x) x*c(0, 27.5, 100, 72.5))/1000
colnames(dat2) <- rownames(dat)
barplot(dat2, legend.text=c("     0 carrot", "27.5 celery", " 100 cucumber", "72.5 pepper"),
        xlim=c(0,7), ylim=c(-5,120),
        col=c('orange','green','forestgreen','red'),
        xlab="year", ylab="Gross profit, $1000",
        main="hazell.vegetables - retrospective profit from optimal strategy",
        args.legend=list(title="acres, crop"))

## Not run: 
##D 
##D   require(linprog)
##D   # colMeans(dat[ , -1])
##D   # 252.8333 442.6667 283.8333 515.8333
##D  
##D   # cvec = avg across-years profit per acre for each crop
##D   cvec <- c(253, 443, 284, 516)
##D   
##D   # Maximize c'x for Ax=b
##D   A <- rbind(c(1,1,1,1), c(25,36,27,87), c(-1,1,-1,1))
##D   colnames(A) <- names(cvec) <- c("carrot","celery","cucumber","pepper")
##D   rownames(A) <- c('land','labor','rotation')
##D 
##D   # bvec criteria = (1) total acres < 200, (2) total labor < 10000,
##D   # (3) crop rotation.
##D 
##D   bvec <- c(200,10000,0)
##D   const.dir <- c("<=","<=","<=")
##D 
##D   m1 <- solveLP(cvec, bvec, A, maximum=TRUE, const.dir=const.dir, lpSolve=TRUE)
##D   # m1$solution # optimal number of acres for each crop
##D   #   carrot    celery  cucumber    pepper
##D   #  0.00000  27.45098 100.00000  72.54902
##D   
##D   # Average income for this plan
##D   ## sum(cvec * m1$solution)
##D   ## [1] 77996.08
##D 
##D   # Year-to-year income for this plan
##D   ## as.matrix(dat[,-1]) ##D 
##D   ##           [,1]
##D   ## [1,]  80492.16
##D   ## [2,]  80431.37
##D   ## [3,]  81884.31
##D   ## [4,] 106868.63
##D   ## [5,]  37558.82
##D   ## [6,]  80513.73
##D 
##D   # optimum allocation that minimizes year-to-year income variability.
##D   # brute-force search
##D 
##D   # For generality, assume we have unequal probabilities for each year.
##D   probs <- c(.15, .20, .20, .15, .15, .15)
##D   # Randomly allocate crops to 200 acres, 100,000 times
##D   #set.seed(1)
##D   mat <- matrix(runif(4*100000), ncol=4)
##D   mat <- 200*sweep(mat, 1, rowSums(mat), "/")
##D   # each row is one strategy, showing profit for each of the six years
##D   # profit <- mat ##D 
##D   profit <- tcrossprod(mat, as.matrix(dat[,-1])) # Each row is profit, columns are years
##D   # calculate weighted variance using year probabilities
##D   wtvar <- apply(profit, 1, function(x) cov.wt(as.data.frame(x), wt=probs)$cov)
##D   # five best planting allocations that minimizes the weighted variance
##D   ix <- order(wtvar)[1:5]
##D   mat[ix,]
##D   ## carrot celery cucumber pepper
##D   ##          [,1]     [,2]     [,3]     [,4]
##D   ## [1,] 71.26439 28.09259 85.04644 15.59657
##D   ## [2,] 72.04428 27.53299 84.29760 16.12512
##D   ## [3,] 72.16332 27.35147 84.16669 16.31853
##D   ## [4,] 72.14622 29.24590 84.12452 14.48335
##D   ## [5,] 68.95226 27.39246 88.61828 15.03700
##D 
## End(Not run)




