library(GameTheoryAllocation)


### Name: Owen_value
### Title: Owen_value (Owen value)
### Aliases: Owen_value
### Keywords: owen owen_value

### ** Examples

characteristic_function<-c(1,1,2,1,2,2,2)
Owen_value(characteristic_function,union=list(c(1,2),c(3)),game="cost")
#[1] "Owen Value"
#     1    2   3
#  0.25 0.25 1.5

Shapley_value(characteristic_function,game="cost")
#[1] "Shapley Value"
#          1         2        3
#  0.3333333 0.3333333 1.333333



