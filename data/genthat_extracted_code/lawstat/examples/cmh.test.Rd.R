library(lawstat)


### Name: cmh.test
### Title: The Cochran-Mantel-Haenszel Chi-square Test
### Aliases: cmh.test
### Keywords: htest

### ** Examples


## Sample Salary Data

data(blackhire)
cmh.test(blackhire)


## Sample Output
##
##        Mantel-Haenszel Chi-square Test
##
## data:  blackhire 
## Mantel-Haenszel Estimate = 0.477, Chi-squared = 145.840, df = 1.000, p-value = 0.000,
## Pooled Odd Ratio = 0.639, Odd Ratio of level 1 = 1.329, Odd Ratio of level 2 = 0.378, Odd
## Ratio of level 3 = 0.508, Odd Ratio of level 4 = 0.357, Odd Ratio of level 5 = 0.209, Odd
## Ratio of level 6 = 0.412, Odd Ratio of level 7 = 0.250, Odd Ratio of level 8 = 0.820
## 
## Note: P-value is significant and we should reject the null hypothesis.




