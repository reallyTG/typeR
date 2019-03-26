library(agricolae)


### Name: DAU.test
### Title: Finding the Variance Analysis of the Augmented block Design
### Aliases: DAU.test
### Keywords: models

### ** Examples

library(agricolae)
block<-c(rep("I",7),rep("II",6),rep("III",7))
trt<-c("A","B","C","D","g","k","l","A","B","C","D","e","i","A","B","C","D","f","h","j")
yield<-c(83,77,78,78,70,75,74,79,81,81,91,79,78,92,79,87,81,89,96,82)
out<- DAU.test(block,trt,yield,method="lsd", group=TRUE)
print(out$groups)
plot(out)



