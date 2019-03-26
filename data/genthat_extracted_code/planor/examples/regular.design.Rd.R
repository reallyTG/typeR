library(planor)


### Name: regular.design
### Title: Construct and Randomize a Regular Factorial Design
### Aliases: regular.design
### Keywords: design

### ** Examples
mydesign <- regular.design(factors=c("block", LETTERS[1:4]),
  nlevels=rep(3,5), model=~block + (A+B+C+D)^2, estimate=~A+B+C+D,
  nunits=3^3, randomize=~block/UNITS)
print(mydesign)



