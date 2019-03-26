library(RGIFT)


### Name: GIFTSA
### Title: Short Answer Question in GIFT format
### Aliases: GIFTSA
### Keywords: misc

### ** Examples

#Question 1
GIFTSA("The mean of 1, 2, and 3 is", c("Three", "3"))

#Question 2
GIFTSA("Compute the mean of 1, 2 and 3",
   c("mean(c(1,2,3))", "sum(c(1,2,3))/3", "sum(c(1,2,3))/length(c(1,2,3))", "(1+2+3)/3"),
   wright=c("100", "75", "75", "50"))



