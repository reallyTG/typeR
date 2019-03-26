library(simPop)


### Name: whipple
### Title: Whipple index (original and modified)
### Aliases: whipple
### Keywords: arith

### ** Examples


#Equally distributed
age <- sample(1:100, 5000, replace=TRUE)
whipple(age)
whipple(age,method="modified")

# Only 5 and 10
age5 <- sample(seq(0,100,by=5), 5000, replace=TRUE)
whipple(age5)
whipple(age5,method="modified")

#Only 10
age10 <- sample(seq(0,100,by=10), 5000, replace=TRUE)
whipple(age10)
whipple(age10,method="modified")




