library(GameTheoryAllocation)


### Name: GameTheoryAllocation-package
### Title: Tools for Calculating Allocations in Game Theory
### Aliases: GameTheoryAllocation-package GameTheoryAllocation
### Keywords: GameTheory

### ** Examples

# Example 1

characteristic_function<-c(0,0.538, 0.761, 1.742, 0.554, 0.137, 0.293, 0.343)
isinthecore(characteristic_function,allocation=c(0.1,0.2,0.043),game="cost")
#[1] "The allocation is not in the core"
#NULL

isinthecore(characteristic_function,allocation=c(0.05,0.206,0.087),game="cost")
#[1] "The allocation is in the core"
#NULL

nucleolus(characteristic_function,game="cost")
#[1] "Nucleolus"
#      1     2 3
#  0.137 0.206 0
# Example 2

characteristic_function<-c(1,1,2,1,2,2,2)
Owen_value(characteristic_function,union=list(c(1,2),c(3)),game="cost")
#[1] "Owen Value"
#     1    2   3
#  0.25 0.25 1.5


