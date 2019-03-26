library(planor)


### Name: bind-methods
### Title: Bind Two Objects
### Aliases: bind,designfactors,designfactors-method bind
### Keywords: methods design

### ** Examples

F1 <- planor.factors(factors=c("block",LETTERS[1:4]), nlevels=c(6,6,4,2,6))
F2 <- planor.factors(factors=c("block",LETTERS[11:12]), nlevels=c(6,6,4))
### Method bind on designfactors objects
F3 <- bind(F1,F2)
names(F3)



