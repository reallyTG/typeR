library(iRepro)


### Name: summary.ntestRes
### Title: Summary for ntestRes Objects
### Aliases: summary.ntestRes print.summary.ntestRes

### ** Examples

# Example with 6 predefined classes (grouped data)
classes <- 1:6
class.limits <- cbind(classes-0.5,classes+0.5)
r1 <- sample(classes,30,replace=TRUE)
r2 <- sample(classes,30,replace=TRUE)
nr <- ntest.res(r1,r2,predefined.classes=TRUE,classes,class.limits,bins=10)
summary(nr)



