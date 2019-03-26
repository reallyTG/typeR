library(asbio)


### Name: bv.boxplot
### Title: Bivariate boxplots
### Aliases: bv.boxplot
### Keywords: graphs multivariate

### ** Examples

Y1<-rnorm(100, 17, 3)
Y2<-rnorm(100, 13, 2)
bv.boxplot(Y1, Y2)

X <- c(-0.24, 2.53, -0.3, -0.26, 0.021, 0.81, -0.85, -0.95, 1.0, 0.89, 0.59, 
0.61, -1.79, 0.60, -0.05, 0.39, -0.94, -0.89, -0.37, 0.18)
Y <- c(-0.83, -1.44, 0.33, -0.41, -1.0, 0.53, -0.72, 0.33,  0.27, -0.99, 0.15, 
-1.17, -0.61, 0.37, -0.96, 0.21, -1.29, 1.40, -0.21, 0.39)
b <- bv.boxplot(X, Y, ID.out = TRUE, bg.out = "red")
b



