library(ISBF)


### Name: isbf
### Title: Iterative Selection of Blocks of Features - isbf
### Aliases: isbf

### ** Examples

# generating data
b = c(rep(0,100),rep(2,40),rep(0,60))
e = rnorm(200,0,0.3)
Y = b + e

# call of isbf
A = isbf(Y,K=200,v=0.3)

# visualization of the results
plot(Y)
lines(A$beta,col="red")



