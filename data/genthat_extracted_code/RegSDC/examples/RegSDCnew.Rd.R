library(RegSDC)


### Name: RegSDCnew
### Title: Regression-based SDC Tools - Scores from new data
### Aliases: RegSDCnew

### ** Examples

x <- matrix(1:5, 5, 1)
y <- matrix(rnorm(15) + 1:15, 5, 3)

# Same as IPSO (RegSDCipso)
RegSDCnew(y, matrix(rnorm(15), 5, 3), x)

# Close to y
RegSDCnew(y, y + 0.001 * matrix(rnorm(15), 5, 3), x)



