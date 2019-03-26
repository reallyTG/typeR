library(scrime)


### Name: rowChisqStats
### Title: Rowwise Pearson's ChiSquare Statistic
### Aliases: rowChisqStats
### Keywords: htest array

### ** Examples
## Not run: 
##D # Generate an example data set consisting of 5 rows (variables)
##D # and 200 columns (observations) by randomly drawing integers 
##D # between 1 and 3.
##D 
##D mat <- matrix(sample(3, 1000, TRUE), 5)
##D rownames(mat) <- paste("SNP", 1:5, sep = "")
##D 
##D # For each pair of rows of mat, test if they are independent.
##D 
##D r1 <- rowChisqStats(mat)
##D 
##D # The values of Pearson's ChiSquare statistic as matrix.
##D 
##D r1$stats
##D 
##D # And the corresponding (unadjusted) p-values.
##D 
##D r1$rawp
##D 
##D # Obtain only the values of the test statistic as vector
##D 
##D rowChisqStats(mat, compPval = FALSE, asMatrix =FALSE)
##D 
##D 
##D # Generate an example data set consisting of 10 rows (variables)
##D # and 200 columns (observations) by randomly drawing integers 
##D # between 1 and 3, and a vector of class labels of length 200
##D # indicating that the first 100 observation belong to class 1
##D # and the other 100 to class 2. 
##D 
##D mat2 <- matrix(sample(3, 2000, TRUE), 10)
##D cl <- rep(1:2, e = 100)
##D 
##D # For each row of mat2, test if they are associated with cl.
##D 
##D r2 <- rowChisqStats(mat2, cl)
##D r2$stats
##D 
##D # And the results are identical to the one of chisq.test
##D pv <- stat <- numeric(10)
##D for(i in 1:10){
##D     tmp <- chisq.test(mat2[i,], cl)
##D     pv[i] <- tmp$p.value
##D     stat[i] <- tmp$stat
##D }
##D 
##D all.equal(r2$stats, stat)
##D all.equal(r2$rawp, pv)
##D 
## End(Not run)


