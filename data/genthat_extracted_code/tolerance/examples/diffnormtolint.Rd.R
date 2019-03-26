library(tolerance)


### Name: diffnormtol.int
### Title: 1-Sided Tolerance Limits for the Distribution of the Difference
###   Between Two Independent Normal Random Variables
### Aliases: diffnormtol.int
### Keywords: file

### ** Examples
 
## 90%/99% tolerance limits for the difference between two
## simulated normal data sets.  This data is taken from
## Krishnamoorthy and Mathew (2009).  Note that there is a
## calculational error in their example, which yields different
## results with the output below. 

x1 <- c(10.166, 5.889, 8.258, 7.303, 8.757)
x2 <- c(-0.204, 2.578, 1.182, 1.892, 0.786, -0.517, 1.156,
        0.980, 0.323, 0.437, 0.397, 0.050, 0.812, 0.720)

diffnormtol.int(x1, x2, alpha = 0.10, P = 0.99, method = "HALL")
diffnormtol.int(x1, x2, alpha = 0.10, P = 0.99, method = "GK")
diffnormtol.int(x1, x2, alpha = 0.10, P = 0.99, method = "RG")
diffnormtol.int(x1, x2, var.ratio = 3.8, alpha = 0.10, P = 0.99)



