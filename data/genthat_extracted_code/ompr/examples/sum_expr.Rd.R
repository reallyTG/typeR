library(ompr)


### Name: sum_expr
### Title: Construct a sum expression
### Aliases: sum_expr

### ** Examples

# create a sum from x_1 to x_10
sum_expr(x[i], i = 1:10)
# create a sum from x_2 to x_10 with even indexes
sum_expr(x[i], i = 1:10, i %% 2 == 0)




