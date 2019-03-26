library(iarm)


### Name: partgam
### Title: Conditional and Partial Gamma Coefficients
### Aliases: partgam

### ** Examples

# Partial Gamma coefficient between an item and an exogenuous variable, given the total score
score <- apply(amts[, 4:13], 1, sum, na.rm = TRUE)
fz <- cut(score,unique(quantile(score,0:10/10)))
partgam(amts$firstww,amts$sex,fz)



