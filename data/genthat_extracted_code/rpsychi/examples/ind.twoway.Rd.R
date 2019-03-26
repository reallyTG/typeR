library(rpsychi)


### Name: ind.twoway
### Title: A two-way design with independent samples using individual data
### Aliases: ind.twoway
### Keywords: design htest

### ** Examples

##Kline (2004) Table 7.5
dat <- data.frame(
           y = c(2,3,4,1,3,1,3,4,5,5,6,6,6,7),
           A = factor(c(rep("A1",5), rep("A2", 9))),
           B = factor(c(rep("B1",3), rep("B2",2), rep("B1",2), rep("B2",7)))
           )

ind.twoway(y~A*B, data=dat)



