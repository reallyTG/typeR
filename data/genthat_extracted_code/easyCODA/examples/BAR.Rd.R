library(easyCODA)


### Name: BAR
### Title: Compositional bar plot
### Aliases: BAR
### Keywords: visualization

### ** Examples

# Vegetables data set: order samples by carbohydrates 
data(veg)
BAR(veg, order.column=2)
data(time)
# TimeBudget data set: put domestic work in first column and order by it
BAR(time[,c(2,1,3,4,5,6)], order.column=1, main="Time Budget")



