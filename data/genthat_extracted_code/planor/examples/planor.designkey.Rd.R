library(planor)


### Name: planor.designkey
### Title: Search for a Design Key or a Collection of Design Keys
### Aliases: planor.designkey
### Keywords: design

### ** Examples

K0 <- planor.designkey(factors=c("block", LETTERS[1:4]),
  nlevels=rep(3,5), model=~block+(A+B+C+D)^2, estimate=~A+B+C+D,
  nunits=3^3, base=~A+B+C, max.sol=2)
### With automatic model generation
Km <- planor.designkey(factors=c("block", LETTERS[1:4]),
  nlevels=rep(2,5), resolution=3, nunits=2^4)



