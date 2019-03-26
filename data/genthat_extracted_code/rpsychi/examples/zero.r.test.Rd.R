library(rpsychi)


### Name: zero.r.test
### Title: A significance testing of a product moment correlation using
###   individual data
### Aliases: zero.r.test
### Keywords: design htest

### ** Examples

dat <- data.frame(x = c(44.4, 45.9, 41.9, 53.3, 44.7, 44.1, 50.7, 45.2, 60.1),
                  y = c( 2.6,  3.1,  2.5,  5.0,  3.6,  4.0,  5.2,  2.8,  3.8))          
zero.r.test(y~x, data=dat)



