library(wmwpow)


### Name: shiehpow
### Title: Calculating Power with Shieh's Method
### Aliases: shiehpow

### ** Examples

# We want to determine the statistical power to compare the distance between mutations on a DNA 
# strand in two groups of people. Each group (X and Y) has 10 individuals. We assume that the 
# distance between mutations in the first group is exponentially distributed with rate 3. We assume 
# that the probability that the distance in the first group is less than the distance in the second 
# group (i.e., P(X<Y)) is 0.8. The desired type I error is 0.05.

shiehpow(n = 10, m = 10, p = 0.80, alpha = 0.05, dist = "exp", sides = "two.sided")




