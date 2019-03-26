library(qpcR)


### Name: propagate
### Title: Error propagation using different methods
### Aliases: propagate
### Keywords: distribution htest

### ** Examples

## From summary data just calculate 
## Monte-Carlo and propagated error.
EXPR <- expression(x/y)
x <- c(5, 0.01)
y <- c(1, 0.01)
DF <- cbind(x, y)
RES1 <- propagate(expr = EXPR, data = DF, type = "stat", 
                 do.sim = TRUE, verbose = TRUE)

## Do Shapiro-Wilks test on Monte Carlo evaluations 
## !maximum 5000 datapoints can be used!
## => p.value on border to non-normality
shapiro.test(RES1$data.Sim[1:5000, 3])
## How about a graphical analysis:
qqnorm(RES1$data.Sim[, 3])

## Using raw data
## If data is of unequal length,
## use qpcR:::cbind.na to avoid replication!
## Do permutations (swap x and y values)
## and simulations.
EXPR <- expression(x*y)
x <- c(2, 2.1, 2.2, 2, 2.3, 2.1)
y <- c(4, 4, 3.8, 4.1, 3.1)
DF <- qpcR:::cbind.na(x, y)  
RES2 <- propagate(EXPR, DF, type = "raw", do.perm = TRUE, 
                 do.sim = TRUE, verbose = TRUE)
RES2$summary

## For replicate data, using relative 
## quantification ratio from qPCR.
## How good is the estimation of the propagated error?
## Done without using covariance in the 
## calculation and simulation.
## cp's and efficiencies are tied together
## because they are two observations on the
## same sample!
## As we are using an exponential type function,
## better to logarithmize the x-axis.
EXPR <- expression((E1^cp1)/(E2^cp2))
E1 <- c(1.73, 1.75, 1.77)
cp1 <- c(25.77,26.14,26.33)
E2 <-  c(1.72,1.68,1.65)
cp2 <- c(33.84,34.04,33.33)
DF <- cbind(E1, cp1, E2, cp2)
RES3 <- propagate(EXPR, DF, type = "raw", do.sim = TRUE,
                 do.perm = TRUE, verbose = TRUE, logx = TRUE)                 
## STRONG deviation from normality!
shapiro.test(RES3$data.Sim[1:5000, 5])
qqnorm(RES3$data.Sim[, 5])

## Same setup as above but also
## using a permutation approach
## for resampling the confidence interval.
## Cp's and efficiencies are tied together
## because they are two observations on the
## same sample! 
## Similar to what REST2008 software does.
RES4 <- propagate(EXPR, DF, type = "raw", do.sim = TRUE,
                 perm.crit = NULL, do.perm = TRUE, 
                 ties = c(1, 1, 2, 2), logx = TRUE, verbose = TRUE)
RES4$summary
## p-value of 0 in perm < init indicates that not a single 
## exchange of group memberships resulted in a smaller ratio!
              
## Proof that covariance of Monte-Carlo
## simulated dataset is the same as from 
## initial data.
RES4$covMat
cov(RES4$data.Sim[, 1:4])
all.equal(RES4$covMat, cov(RES4$data.Sim[, 1:4]))



