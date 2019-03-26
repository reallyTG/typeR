library(howmany)


### Name: howmany
### Title: Number of correct rejections, for independent test statistics
### Aliases: howmany
### Keywords: htest

### ** Examples

##  create a list of pvalues,
##  of which 1000 are uniform on [0,1]
##  (1000 true null hypotheses),
##  and 200 follow a (truncated) chi-squared distribution
##  (200 false null hypotheses).
pvalues <- c(   runif(300),   pmin(1,0.05*rchisq(50,df=1))  )

## compute object of class 'howmany' and print the result
(object <- howmany(pvalues))

## extract the lower bound
(lower <- lowerbound(object))

## plot the result
plot(object)

## for comparison: number of rejections with Bonferroni's correction
(bonf <- sum( pvalues < (0.05/1200) ))




