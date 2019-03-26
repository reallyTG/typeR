library(RegSDC)


### Name: RegSDCromm
### Title: Regression-based SDC Tools - Random orthogonal matrix masking
###   (ROMM)
### Aliases: RegSDCromm

### ** Examples

x <- matrix(1:5, 5, 1)
y <- matrix(rnorm(15) + 1:15, 5, 3)

# Same as IPSO (RegSDCipso)
RegSDCromm(y, Inf, x)

# Close to IPSO
RegSDCromm(y, 100, x)

# Close to y
RegSDCromm(y, 0.001, x)



