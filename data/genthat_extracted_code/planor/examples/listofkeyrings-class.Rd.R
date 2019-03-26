library(planor)


### Name: listofkeyrings-class
### Title: Class listofkeyrings
### Aliases: listofkeyrings-class [,listofkeyrings,ANY,ANY,ANY-method
### Keywords: classes design

### ** Examples

showClass("listofkeyrings")
### Creation of a listofkeyrings object
K0 <- planor.designkey(factors=c(LETTERS[1:4], "block"), nlevels=rep(3,5),
   model=~block+(A+B+C+D)^2, estimate=~A+B+C+D,
   nunits=3^3, base=~A+B+C, max.sol=2)
show(K0)



