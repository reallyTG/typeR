library(mrfDepth)


### Name: cmltest
### Title: Test for linearity of the conditional median in simple
###   regression
### Aliases: cmltest
### Keywords: regression

### ** Examples


data("stars")

# Compute the least squares fit. Due to outliers
# this fit will be bad and thus H0 should be rejected. 
temp <- lsfit(x = stars[,1], y = stars[,2])$coefficients
intercept <- temp[1]
slope <- temp[2]
z <- matrix(c(intercept, slope), nrow = 1)
pvalue1 <- cmltest(x = stars, z = z)
pvalue1

# Lets now test the deepest regression line. 
result <- rdepthmedian(x = stars)
pvalue2 <- cmltest(x = stars, z = matrix(result$deepest, nrow = 1))
pvalue2

plot(stars)
abline(a = intercept, b = slope)
abline(result$deepest, col = "red")
text(x = 3.8, y = 5.3, labels = paste("p-value", round(pvalue1, digits = 3)) )
text(x = 4.45, y = 4.8, labels = paste("p-value", round(pvalue2, digits = 3)), col = "red")





