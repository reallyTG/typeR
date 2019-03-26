library(BSDA)


### Name: Abbey
### Title: Daily price returns (in pence) of Abbey National shares between
###   7/31/91 and 10/8/91
### Aliases: Abbey
### Keywords: datasets

### ** Examples


qqnorm(Abbey$price)
qqline(Abbey$price)
t.test(Abbey$price, mu = 300)
hist(Abbey$price, main = "Exercise 6.39", 
     xlab = "daily price returns (in pence)",
     col = "blue")




