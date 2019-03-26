library(nilde)


### Name: get.knapsack
### Title: Enumeration of all existing nonnegative integer solutions for
###   unbounded, bounded and 0-1 knapsack and subset sum problems
### Aliases: get.knapsack

### ** Examples

## some examples...
b1 <- get.knapsack(objective=c(200:206),a=c(100:106),n=999,problem="uknap")
b1

b2 <- get.knapsack(objective=c(41,34,21,20,8,7,7,4,3,3),a=c(41,34,21,20,8,7,7,4,3,3),
         n=50, problem="bknap", bounds=rep(2,10))
b2
colSums(b2$solutions*c(41,34,21,20,8,7,7,4,3,3))

b3 <- get.knapsack(objective=c(4,3,3),a=c(3,2,2),n=4,problem="bknap",bounds=c(2,2,2))
b3
## get maximum value of the objective function...
colSums(b3$solutions*c(4,3,3)) 
## checking constraint...
colSums(b3$solutions*c(3,2,2))   

b4 <- get.knapsack(objective=c(4,3,3),a=c(3,2,2),n=4,problem="knap01")
b4
## get maximum value of the objective function...
colSums(b4$solutions*c(4,3,3)) 
## checking constraint...
colSums(b4$solutions*c(3,2,2))

## No test: 
b5 <- get.knapsack(a=c(100:106),n=2999,objective=c(200:206),problem="uknap")
b5$p.n ## total number of solutions
options(max.print=5E5)
print(b5)

## End(No test)





