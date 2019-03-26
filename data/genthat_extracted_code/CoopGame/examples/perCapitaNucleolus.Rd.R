library(CoopGame)


### Name: perCapitaNucleolus
### Title: Compute per capita nucleolus
### Aliases: perCapitaNucleolus

### ** Examples

library(CoopGame)
perCapitaNucleolus(c(1, 1, 1, 2, 3, 4, 5))

## No test: 
#Example from YOUNG 1985, p. 68
v<-costSharingGameVector(n=3,C=c(15,20,55,35,61,65,78))
perCapitaNucleolus(v)
#[1]  0.6666667  1.1666667 10.1666667
## End(No test)




