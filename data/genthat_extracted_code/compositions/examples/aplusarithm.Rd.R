library(compositions)


### Name: aplusarithm
### Title: vectorial arithmetic for data sets with aplus class
### Aliases: +.aplus -.aplus *.aplus /.aplus perturbe.aplus power.aplus
### Keywords: multivariate

### ** Examples

x <- aplus(matrix( sqrt(1:12), ncol= 3 ))
x
x+x
x + aplus(1:3)
x * 1:4
1:4 * x
x / 1:4
x / 10
power.aplus(x,1:4)



