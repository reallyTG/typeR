library(DescTools)


### Name: GiniSimpson
### Title: Compute Gini-Simpson Coefficient
### Aliases: GiniSimpson
### Keywords: univar

### ** Examples

x <- c(261,29,33,15,39,28,95,5,6,28,69,8,105,38,15)

GiniSimpson(x)

# is the same as 
1 - Herfindahl(x)

GiniSimpson(c(783,121,112,70,201,153,425,19,37,126,325,51,442,193,41))



