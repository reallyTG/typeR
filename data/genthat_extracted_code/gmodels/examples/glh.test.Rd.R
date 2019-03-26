library(gmodels)


### Name: glh.test
### Title: Test a General Linear Hypothesis for a Regression Model
### Aliases: glh.test print.glh.test summary.glh.test
### Keywords: models regression

### ** Examples


# fit a simple model
y <- rnorm(100)
x <-  cut(rnorm(100, mean=y, sd=0.25),c(-4,-1.5,0,1.5,4))
reg <- lm(y ~ x)
summary(reg)

# test both group 1 = group 2  and group 3 = group 4
# *Note the 0 in the column for the intercept term*

C <- rbind( c(0,-1,0,0), c(0,0,-1,1) )
ret <- glh.test(reg, C)
ret  # same as 'print(ret) '
summary(ret)

# To compute a contrast between the first and second level of the factor
# 'x' using 'fit.contrast' gives:

fit.contrast( reg, x,c(1,-1,0,0) )
	
# To test this same contrast using 'glh.test', use a contrast matrix
# with a zero coefficient for the intercept term.  See the Note section,
# above, for an explanation.

C <- rbind( c(0,-1,0,0) )
glh.test( reg, C )





