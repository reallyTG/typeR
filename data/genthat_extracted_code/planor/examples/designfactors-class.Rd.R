library(planor)


### Name: designfactors-class
### Title: Class designfactors
### Aliases: designfactors-class [,designfactors,ANY,ANY,ANY-method
###   length,designfactors-method names,designfactors-method
### Keywords: classes design

### ** Examples

F1 <- planor.factors(factors=c("block",LETTERS[1:4]), nlevels=c(6,6,4,2,6))
F2 <- planor.factors(factors=c("block",LETTERS[11:12]), nlevels=c(4,6,6))
### Method bind - a warning will be issued because two factors
### in F1 and F2 have the same name
F3 <- bind(F1,F2) 
names(F3)
length(F3)
F3@levels
F3.trt <- F3[c(2:5,7,8)]
names(F3.trt)



