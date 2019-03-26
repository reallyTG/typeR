library(FIACH)


### Name: zeroNa
### Title: Zero non finite values
### Aliases: zeroNa

### ** Examples

 test<-matrix(rnorm(100),10,10)

test[5,5]<-NA
test
zeroNa(test)

test[5,5]<-NaN
test
zeroNa(test)

test[5,5]<- -Inf
test
zeroNa(test)

test[5,5]<- +Inf
test
zeroNa(test)



