library(LifeTables)


### Name: hmd.DA
### Title: Discriminant analysis to determine life table family
### Aliases: hmd.DA
### Keywords: models misc

### ** Examples


# classifying with 1m0
examp.out <- hmd.DA(x=.05, sex="male", child.mort=1)
examp.out$classification

# classifying with 5q0 and 45q15 
examp.out2 <- hmd.DA(x=.03, sex="male", child.mort=4, adult.mort=.18)
examp.out2$classification




