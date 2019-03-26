library(GameTheoryAllocation)


### Name: Shapley_value
### Title: Shapley_value (Shapley Value)
### Aliases: Shapley_value
### Keywords: shapley shapley_value

### ** Examples

characteristic_function<-c(1,1,2,1,2,2,2)
 
Shapley_value(characteristic_function,game="cost")
#[1] "Shapley Value"
#          1         2        3
#  0.3333333 0.3333333 1.333333



