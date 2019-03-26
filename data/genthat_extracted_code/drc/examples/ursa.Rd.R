library(drc)


### Name: ursa
### Title: Model function for the universal response surface approach
###   (URSA) for the quantitative assessment of drug interaction
### Aliases: ursa genursa actimL genLoewe genLoewe2 iceLoewe.1 iceLoewe2.1
###   genBliss genBliss2
### Keywords: models nonlinear

### ** Examples


## Here is the complete statistical analysis of the data 
##  from Greco et al. (1995) by means of the URSA model
if (FALSE)
{
d1 <- c(0, 0, 0, 0, 0, 0, 0, 0, 2, 5, 10, 20, 50, 2, 2, 2, 
2, 2, 5, 5, 5, 5, 5, 10, 10, 10, 10, 10, 20, 20, 20, 20, 
20, 50, 50, 50, 50, 50)

d2 <- c(0, 0, 0, 0.2, 0.5, 1, 2, 5, 0, 0, 0, 0, 0, 0.2, 
0.5, 1, 2, 5, 0.2, 0.5,  1, 2, 5, 0.2, 0.5, 1, 2, 5, 0.2, 
0.5, 1, 2, 5, 0.2, 0.5, 1, 2, 5)

effect <- c(106.00, 99.20, 115.00, 79.20, 70.10, 49.00, 
21.00, 3.83, 74.20, 71.50,48.10, 30.90, 16.30, 76.30, 
48.80, 44.50, 15.50, 3.21, 56.70, 47.50, 26.80, 16.90, 
3.25, 46.70, 35.60, 21.50, 11.10, 2.94, 24.80, 21.60, 
17.30, 7.78, 1.84, 13.60, 11.10, 6.43, 3.34, 0.89)

greco <- data.frame(d1, d2, effect)

greco.m1 <- drm(effect ~ d1 + d2, data = greco, fct = ursa(fixed = c(NA, NA, 0, NA, NA, NA, NA)))

plot(fitted(greco.m1), residuals(greco.m1)) # wedge-shaped

summary(greco.m1)
 
## Transform-both-sides approach using a logarithm transformation
greco.m2 <- drm(effect ~ d1 + d2, data = greco, fct = ursa(fixed = c(NA, NA, 0, NA, NA, NA, NA)), 
bcVal = 0, control = drmc(relTol = 1e-12))

plot(fitted(greco.m2), residuals(greco.m2))  # looks okay

summary(greco.m2)
# close to the estimates reported by Greco et al. (1995)
}




